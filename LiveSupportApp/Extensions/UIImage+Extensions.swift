//
//  UIImage+Extensions.swift
//  LiveSupportApp
//
//  Created by Şehriban Yıldırım on 17.10.2024.
//

import Kingfisher
import UIKit

public extension UIImage {
    func resize(to size: CGSize, for contentMode: UIView.ContentMode? = nil) -> UIImage {
        switch contentMode {
        case .scaleAspectFit:
            return kf.resize(to: size, for: .aspectFit)
        case .scaleToFill:
            return kf.resize(to: size, for: .aspectFill)
        default:
            return kf.resize(to: size)
        }
    }
}
