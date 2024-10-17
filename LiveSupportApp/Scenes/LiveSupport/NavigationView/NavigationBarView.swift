//
//  NavigationBarView.swift
//  LiveSupportApp
//
//  Created by Şehriban Yıldırım on 17.10.2024.
//

import UIKit
import SnapKit

final class NavigationBarView: UIView {

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Canlı Destek"
        label.textColor = .appDark
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "robot")
        imageView.tintColor = .white
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [iconImageView, titleLabel])
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.alignment = .center
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    private func setupView() {
        backgroundColor = .clear
        addSubview(stackView)
        
        stackView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.height.equalTo(25)
        }
        
        iconImageView.snp.makeConstraints { make in
            make.width.height.equalTo(25)
        }
    }
}
