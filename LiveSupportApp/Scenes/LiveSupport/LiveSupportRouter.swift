//
//  TestVbRouter.swift
//  PodcastApp
//
//  Created by vb10 on 1.02.2024.
//
//

import Foundation
import UIKit

final class  LiveSupportRouter: PresenterToRouterLiveSupportProtocol {
    // MARK: Static methods

    static func createModule() -> LiveSupportViewController {
        let viewController = LiveSupportViewController()
        let interactor = LiveSupportInteractor()
        let router = LiveSupportRouter(navigation: viewController)

        let presenter: ViewToPresenterLiveSupportProtocol & InteractorToPresenterLiveSupportProtocol = LiveSupportPresenter(
            interactor: interactor, router: router, view: viewController)

        viewController.presenter = presenter
        interactor.presenter = presenter

        return viewController
    }

    private let navigation: NavigationView

    init(navigation: NavigationView) {
        self.navigation = navigation
    }
}
