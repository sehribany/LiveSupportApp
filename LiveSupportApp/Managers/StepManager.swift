//
//  StepManager.swift
//  LiveSupportApp
//
//  Created by Şehriban Yıldırım on 23.10.2024.
//

import Foundation

final class StepManager {
    static let shared = StepManager()
    
    private var steps: [LiveSupportResponse] = []
    private let dataLoder = DataLoader.shared
    
    private init() {
        dataLoder.loadLiveSupportData()
    }
    
    func createStepDetails(stepId: LiveSupportChatStepTypes) -> LiveSupportResponse? {
        return steps.first { $0.step.rawValue == stepId.rawValue }
    }
}
