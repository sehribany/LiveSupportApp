//
//  LiveSupportPresenter.swift
//  LiveSupportApp
//
//  Created by Şehriban Yıldırım on 17.10.2024.
//  
//

import Foundation

final class LiveSupportPresenter: ViewToPresenterLiveSupportProtocol {

    // MARK: Properties
    private let view: PresenterToViewLiveSupportProtocol
    private let interactor: PresenterToInteractorLiveSupportProtocol
    private let router: PresenterToRouterLiveSupportProtocol


    init(interactor: PresenterToInteractorLiveSupportProtocol, router: PresenterToRouterLiveSupportProtocol, view: PresenterToViewLiveSupportProtocol) {
        self.interactor = interactor
        self.router = router
        self.view = view
    }
    
    func loadData() {
        interactor.fetchLiveSupportData()  // Veriyi al
    }
}

extension LiveSupportPresenter: InteractorToPresenterLiveSupportProtocol {
    func didFetchLiveSupportData(_ responses: [LiveSupportResponse]) {
        // Verileri başarıyla aldık, görünümü güncelle
        print("Fetched Live Support Data: \(responses)")
        // Burada view'yi güncellemek için view protokolü üzerinden çağrı yapabilirsiniz
    }

    func didFailToFetchLiveSupportData(with error: Error) {
        print("Failed to fetch live support data: \(error.localizedDescription)")
        // Hata durumunu view'ye iletebilirsiniz
    }
}
