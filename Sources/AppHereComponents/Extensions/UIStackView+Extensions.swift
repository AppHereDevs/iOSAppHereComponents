//
//  File.swift
//  
//
//  Created by Muhammed Sevük on 25.12.2021.
//

import UIKit

public extension UIStackView {
    
    func removeAllArrangedViewIfExist() {
        for item in self.arrangedSubviews {
            self.removeArrangedSubview(item)
            item.removeFromSuperview()
        }
    }
}
