//
//  Themeable.swift
//
//
//  Created by Arda Onat on 24.12.2021.
//

import Foundation

public protocol Themeable {
    var themeKey: String? { get set }
    var themeDict: NSDictionary? { get set }
}
