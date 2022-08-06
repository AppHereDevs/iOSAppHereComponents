//
//  File.swift
//
//
//  Created by Muhammed Sevük on 25.12.2021.
//

import UIKit

public extension UIStackView {
    func removeAllArrangedViewIfExist() {
        for item in arrangedSubviews {
            removeArrangedSubview(item)
            item.removeFromSuperview()
        }
    }
}
