//
//  LiveSupportViewController.swift
//  LiveSupportApp
//
//  Created by Şehriban Yıldırım on 17.10.2024.
//  
//

import UIKit

final class LiveSupportViewController: UIViewController, NavigationView {
    
    // MARK: - Properties
    var presenter: ViewToPresenterLiveSupportProtocol!

    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        view = LiveSupportView(self)
        view.backgroundColor = .white
    }
     
}

extension LiveSupportViewController: PresenterToViewLiveSupportProtocol{
    // TODO: Implement View Output Methods
}
