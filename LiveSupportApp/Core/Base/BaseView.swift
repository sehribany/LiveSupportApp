//
//  BaseView.swift
//  LiveSupportApp
//
//  Created by Şehriban Yıldırım on 17.10.2024.
//

import UIKit

class BaseView<T: UIViewController>: UIView {
    
    var controller: T

    init(_ controller: T) {
        self.controller = controller
        super.init(frame: .zero)
        setupView()
    }

    func setupView() { }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
