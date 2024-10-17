//
//  HomeView.swift
//  LiveSupportApp
//
//  Created by Şehriban Yıldırım on 17.10.2024.
//  
//

import UIKit
import SnapKit

protocol HomeViewDelegate: AnyObject {
    func didTapStartButton()
}

final class HomeView: BaseView<HomeViewController> {

    // MARK: - Properties
    weak var delegate: HomeViewDelegate?

    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Chatbot02")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Welcome to the Live Support System"
        label.font = UIFont.systemFont(ofSize: 30, weight: .semibold)
        label.textColor = .appDark
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()

    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "I'm here to help you get quick answers. Are you ready to start?"
        label.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        label.textColor = .appLightGrey
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()

    private lazy var startButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Start", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        button.setTitleColor(.appWhite, for: .normal)
        button.titleLabel?.textAlignment = .center
        button.backgroundColor = .appDark
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(didTapStartButton), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Actions
    @objc private func didTapStartButton() {
        delegate?.didTapStartButton()
    }

    // MARK: - Initializer
    init(controller: HomeViewController, delegate: HomeViewDelegate) {
        self.delegate = delegate
        super.init(controller)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setup
    override func setupView() {
        super.setupView()
        setupLayout()
    }
}

// MARK: - Layout Extension
extension HomeView{
    private func addSubviews() {
        addSubview(imageView)
        addSubview(titleLabel)
        addSubview(descriptionLabel)
        addSubview(startButton)
    }

    private func setupLayout() {
        addSubviews()

        imageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        titleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top).offset(450)
            make.leading.trailing.equalToSuperview().inset(16)
        }

        descriptionLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(titleLabel.snp.bottom).offset(15)
            make.leading.trailing.equalToSuperview().inset(25)
        }

        startButton.snp.makeConstraints { make in
            make.top.equalTo(descriptionLabel.snp.bottom).offset(60)
            make.centerX.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(55)
        }
    }
}
