//
//  HomeViewController.swift
//  LiveSupportApp
//
//  Created by Şehriban Yıldırım on 17.10.2024.
//  
//

import UIKit

final class HomeViewController: UIViewController, NavigationView {
    
    // MARK: - Properties
    var presenter: ViewToPresenterHomeProtocol!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupHomeView()
    }

    private func setupHomeView() {
        let homeView = HomeView(controller: self, delegate: self)
        view = homeView
    }
}

// MARK: - HomeViewDelegate
extension HomeViewController: HomeViewDelegate {
    func didTapStartButton() {
        presenter.startLiveSupport()
    }
}

// MARK: - PresenterToViewHomeProtocol
extension HomeViewController: PresenterToViewHomeProtocol {}
