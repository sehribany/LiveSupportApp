//
//  WebSocketManager.swift
//  LiveSupportApp
//
//  Created by Şehriban Yıldırım on 21.10.2024.
//

import Foundation

// MARK: - WebSocketInteractorDelegate
protocol WebSocketInteractorDelegate: AnyObject {
    func didReceiveMessage(_ message: LiveSupportResponse)
    func didFailWithError(_ error: Error)
}

// MARK: - WebSocketManager (Singleton)
final class WebSocketManager {
    static let shared = WebSocketManager()
    weak var delegate: WebSocketInteractorDelegate?

    private var webSocketTask: URLSessionWebSocketTask?
    private var urlSession: URLSession?

    private init() {}

    // MARK: - Connect WebSocket
    func connectWebSocket(socketURL: String) {
        guard let url = URL(string: socketURL) else { return }
        urlSession = URLSession(configuration: .default)
        webSocketTask = urlSession?.webSocketTask(with: url)
        webSocketTask?.resume()
        print("Connection")
        listenForMessages()
    }

    // MARK: - Disconnect WebSocket
    func disconnectWebSocket() {
        webSocketTask?.cancel(with: .goingAway, reason: nil)
        webSocketTask = nil
        urlSession = nil
    }

    // MARK: - Send Message
    func sendMessage(_ message: LiveSupportResponse) {
        do {
            let jsonData = try JSONEncoder().encode(message)
            
            guard let jsonString = String(data: jsonData, encoding: .utf8) else { return }
            let webSocketMessage = URLSessionWebSocketTask.Message.string(jsonString)
            
            webSocketTask?.send(webSocketMessage) { [weak self] error in
                guard let self = self else { return }
                if let error = error {
                    self.delegate?.didFailWithError(error)
                }
            }
        } catch {
            delegate?.didFailWithError(error)
        }
    }
}

// MARK: - Utils
private extension WebSocketManager {
    func listenForMessages() {
        webSocketTask?.receive { [weak self] result in
            guard let self = self else { return }

            switch result {
            case .success(let message):
                switch message {
                case .string(let jsonString):
                    self.handleWebSocketMessage(jsonString)
                default:
                    print("Unsupported message format")
                }
            case .failure(let error):
                self.delegate?.didFailWithError(error)
            }
            self.listenForMessages()
        }
    }
    
    
    func handleWebSocketMessage(_ message: String) {
        guard let data = message.data(using: .utf8) else { return }
        
        do {
            let response = try JSONDecoder().decode(LiveSupportResponse.self, from: data)
            delegate?.didReceiveMessage(response)
        } catch {
            delegate?.didFailWithError(error)
        }
    }
}
