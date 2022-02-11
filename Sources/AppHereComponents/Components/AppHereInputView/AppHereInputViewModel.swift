//
//  AppHereInputViewModel.swift
//  
//
//  Created by Muhammed Sevük on 10.02.2022.
//

import UIKit

public struct AppHereInputViewModel {
    var title: String?
    var phoneLabelText: String?
    var placeholder: String?
    var regex: String?
    var keyboardType: UIKeyboardType
    
    public init(title: String?, phoneLabelText: String?, placeholder: String?, regex: String?, keyboardType: UIKeyboardType = .default) {
        
        self.title = title
        self.phoneLabelText = phoneLabelText
        self.placeholder = placeholder
        self.regex = regex
        self.keyboardType = keyboardType
    }
}
