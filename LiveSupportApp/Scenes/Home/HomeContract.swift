//
//  HomeContract.swift
//  LiveSupportApp
//
//  Created by Şehriban Yıldırım on 17.10.2024.
//  
//

import Foundation

// MARK: View Output (Presenter -> View)
protocol PresenterToViewHomeProtocol {}


// MARK: View Input (View -> Presenter)
protocol ViewToPresenterHomeProtocol {
    func startLiveSupport()
}


// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorHomeProtocol {
    var presenter: InteractorToPresenterHomeProtocol? { get set }
}


// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterHomeProtocol {}


// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterHomeProtocol {
    func navigateToLiveSupport()
}
