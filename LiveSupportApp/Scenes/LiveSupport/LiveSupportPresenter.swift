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
}

extension LiveSupportPresenter: InteractorToPresenterLiveSupportProtocol {
    
}
