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
    var errorLabelText: String?
    var placeholder: String
    var regex: String?
    var keyboardType: UIKeyboardType
    let validationModel: ValidationModel?
    
    public init(title: String? = nil,
                phoneLabelText: String? = nil,
                errorLabelText: String? = nil,
                placeholder: String,
                regex: String? = nil,
                keyboardType: UIKeyboardType = .default,
                validationModel: ValidationModel? = nil) {
        
        self.title = title
        self.phoneLabelText = phoneLabelText
        self.placeholder = placeholder
        self.regex = regex
        self.keyboardType = keyboardType
        self.errorLabelText = errorLabelText
        self.validationModel = validationModel
    }
    
    public struct ValidationModel {
        let patternType: PatternType?
        let regexPattern: String?
        let maxCharLength: Int?
        //TODO: IsSecureTextEntry will add
        
        public init(patternType: PatternType? = nil,
                    regexPattern: String? = nil,
                    maxCharLength: Int? = nil) {
            
            self.patternType = patternType
            
            if let pattern = patternType,
               let regex = pattern.regex {
                self.regexPattern = regex
            } else {
                self.regexPattern = regexPattern
            }
            self.maxCharLength = maxCharLength
        }
    }
}
