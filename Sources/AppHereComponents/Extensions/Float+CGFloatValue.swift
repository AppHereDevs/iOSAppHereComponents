//
//  File.swift
//  
//
//  Created by Arda Onat on 9.02.2022.
//

import UIKit
import CoreGraphics

public extension Float {
    var CGFloatValue: CGFloat {
        return CGFloat(self)
    }
}

public extension Optional where Wrapped == Float {
    var nullableCGFloatValue: CGFloat {
        switch self {
        case .none:
            return 0
        case .some(let wrapped):
            return CGFloat(wrapped)
        }
    }
}
