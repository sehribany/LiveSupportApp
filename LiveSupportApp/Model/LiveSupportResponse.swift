//
//  LiveSupportResponse.swift
//  LiveSupportApp
//
//  Created by Şehriban Yıldırım on 19.10.2024.
//

import Foundation

// Adım yapısını tanımlama
struct Step: Codable {
    let step: String
    let type: String
    let content: Content
    let action: String
    
    struct Content: Codable {
        let text: String?
        let buttons: [Button]?
        
        struct Button: Codable {
            let label: String
            let action: String
        }
    }
}

// MARK: - LiveSupportResponse
struct LiveSupportResponse: Codable {
    let step: LiveSupportChatStepTypes
    let type: TypeEnum
    let content: ContentUnion
    let action: Action
}

// Enum for actions that can be taken
enum Action: String, Codable {
    case awaitUserChoice = "await_user_choice"
    case endConversation = "end_conversation"
    case showGuide = "show_guide"
}

// Union type to handle different content types
enum ContentUnion: Codable {
    case contentClass(ContentClass)
    case string(String)

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode(String.self) {
            self = .string(x)
            return
        }
        if let x = try? container.decode(ContentClass.self) {
            self = .contentClass(x)
            return
        }
        throw DecodingError.typeMismatch(ContentUnion.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for ContentUnion"))
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .contentClass(let x):
            try container.encode(x)
        case .string(let x):
            try container.encode(x)
        }
    }
}

// MARK: - ContentClass
struct ContentClass: Codable {
    let text: String
    let buttons: [Button]
}

// MARK: - Button
struct Button: Codable {
    let label: String
    let action: String
}

// Enum for different content types
enum TypeEnum: String, Codable {
    case button = "button"
    case image = "image"
    case text = "text"
}
