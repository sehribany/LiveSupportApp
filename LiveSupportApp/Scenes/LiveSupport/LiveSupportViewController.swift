//
//  LiveSupportViewController.swift
//  LiveSupportApp
//
//  Created by Şehriban Yıldırım on 17.10.2024.
//  
//

import UIKit
import SnapKit

final class LiveSupportViewController: UIViewController, NavigationView {
    
    // MARK: - Properties
    var presenter: ViewToPresenterLiveSupportProtocol!
    
    private lazy var customNavBarView: NavigationBarView = {
        return NavigationBarView()
    }()

    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()        
        presenter.loadData()
    }
    
    // MARK: - Setup Methods
    private func setupView() {
        setupSupportView()
        setupNavigationBar()
    }
    
    private func setupSupportView() {
        let supportView = LiveSupportView(self)
        self.view = supportView
        self.view.backgroundColor = .appWhite
    }
    
    // MARK: - View Lifecycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
}

extension LiveSupportViewController: PresenterToViewLiveSupportProtocol {}

// MARK: - Navigation Bar Setup
extension LiveSupportViewController{
    
    private func setupNavigationBar() {
        addCustomNavBar()
        addBottomBorder()
    }
    
    // Custom Navigation Bar Addition
    private func addCustomNavBar() {
        navigationController?.navigationBar.tintColor = .appDark
        navigationController?.navigationBar.addSubview(customNavBarView)
        customNavBarView.snp.makeConstraints { make in
            make.leading.trailing.equalTo(navigationController!.navigationBar).inset(60)
            make.top.bottom.equalTo(navigationController!.navigationBar)
        }
    }
    
    // Bottom Border Addition
    private func addBottomBorder() {
        let bottomBorder = UIView()
        bottomBorder.backgroundColor = .appDark
        bottomBorder.translatesAutoresizingMaskIntoConstraints = false
        navigationController?.navigationBar.addSubview(bottomBorder)
        
        bottomBorder.snp.makeConstraints { make in
            make.height.equalTo(1)
            make.leading.trailing.equalTo(navigationController!.navigationBar)
            make.bottom.equalTo(navigationController!.navigationBar.snp.bottom)
        }
    }
}
