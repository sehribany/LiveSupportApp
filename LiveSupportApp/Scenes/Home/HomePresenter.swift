//
//  HomePresenter.swift
//  LiveSupportApp
//
//  Created by Şehriban Yıldırım on 17.10.2024.
//  
//

import Foundation

final class HomePresenter{

    // MARK: Properties
    private let view: PresenterToViewHomeProtocol
    private let interactor: PresenterToInteractorHomeProtocol
    private let router: PresenterToRouterHomeProtocol
    
    init(interactor: PresenterToInteractorHomeProtocol, router: PresenterToRouterHomeProtocol, view: PresenterToViewHomeProtocol) {
        self.interactor = interactor
        self.router = router
        self.view = view
    }
}

// MARK: - ViewToPresenterHomeProtocol Implementation
extension HomePresenter: ViewToPresenterHomeProtocol{
    func startLiveSupport() {
        router.navigateToLiveSupport()
    }
}

// MARK: - InteractorToPresenterHomeProtocol Implementation
extension HomePresenter: InteractorToPresenterHomeProtocol {}
