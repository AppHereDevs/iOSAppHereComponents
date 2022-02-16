//
//  File.swift
//  
//
//  Created by Arda Onat on 13.02.2022.
//

import Foundation

public protocol UserInputtable {
    var isValidInput: Bool { get }
    func showError()
}
