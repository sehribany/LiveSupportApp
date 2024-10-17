//
//  TestVbRouter.swift
//  PodcastApp
//
//  Created by vb10 on 1.02.2024.
//
//

import Foundation
import UIKit

final class HomeRouter: PresenterToRouterHomeProtocol {
    
    // MARK: Static methods
    static func createModule() -> HomeViewController {
        let viewController = HomeViewController()
        let interactor = HomeInteractor()
        let router = HomeRouter(navigation: viewController)

        let presenter: ViewToPresenterHomeProtocol & InteractorToPresenterHomeProtocol = HomePresenter(
            interactor: interactor, router: router, view: viewController)

        viewController.presenter = presenter
        interactor.presenter = presenter

        return viewController
    }

    private let navigation: UIViewController

    init(navigation: UIViewController) {
        self.navigation = navigation
    }
    
    /// Navigates to the Live Support screen.
    func navigateToLiveSupport() {
        let liveSupportVC = LiveSupportViewController()
        navigation.navigationController?.pushViewController(liveSupportVC, animated: true)
    }
}
