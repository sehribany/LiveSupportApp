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

    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        view = HomeView(self)
        view.backgroundColor = .white
    }
     
}

extension HomeViewController: PresenterToViewHomeProtocol{
    // TODO: Implement View Output Methods
}
