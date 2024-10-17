//
//  NavigationView.swift
//  LiveSupportApp
//
//  Created by Şehriban Yıldırım on 17.10.2024.
//

import UIKit

protocol NavigationView {
    func present(_ viewController: UIViewController)
    func dismiss()
    func push(_ viewController: UIViewController, animated: Bool)
}

extension NavigationView where Self: UIViewController {
    func present(_ viewController: UIViewController) {
        present(viewController, animated: true, completion: nil)
    }

    func dismiss() {
        dismiss(animated: true)
    }

    func push(_ viewController: UIViewController, animated: Bool) {
        if let navController = self.navigationController {
            navController.pushViewController(viewController, animated: animated)
        }
    }
}
