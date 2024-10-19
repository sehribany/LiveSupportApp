//
//  LiveSupportInteractor.swift
//  LiveSupportApp
//
//  Created by Şehriban Yıldırım on 17.10.2024.
//  
//

import Foundation

final class LiveSupportInteractor: PresenterToInteractorLiveSupportProtocol {

    // MARK: Properties
    var presenter: InteractorToPresenterLiveSupportProtocol?
    
    private let dataLoader = DataLoader()
    
    func fetchLiveSupportData() {
        if let responses = dataLoader.loadLiveSupportData() {
            presenter?.didFetchLiveSupportData(responses)  // Presenter'a veri iletimi
        } else {
            presenter?.didFailToFetchLiveSupportData(with: NSError(domain: "LiveSupportInteractor", code: 0, userInfo: [NSLocalizedDescriptionKey: "Failed to load live support data"]))
        }
    }
}
