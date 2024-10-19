//
//  DataLoader.swift
//  LiveSupportApp
//
//  Created by Şehriban Yıldırım on 19.10.2024.
//
import Foundation

class DataLoader {
    func loadLiveSupportData() -> [LiveSupportResponse]? {
        guard let url = Bundle.main.url(forResource: "live_support_flow", withExtension: "json") else {
            print("JSON file not found")
            return nil
        }

        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let responses = try decoder.decode([LiveSupportResponse].self, from: data)
            return responses
        } catch {
            print("Error decoding JSON: \(error)")
            return nil
        }
    }
}
