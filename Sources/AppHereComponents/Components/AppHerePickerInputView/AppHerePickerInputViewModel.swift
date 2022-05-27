//
//  AppHerePickerInputViewModel.swift
//  
//
//  Created by Arda Onat on 15/05/2022.
//

import UIKit

public struct AppHerePickerInputViewModel {
    let title: String?
    let placeholder: String?
    let errorLabelText: String?
    let pickerData: [Any]?
    let textAlignment: NSTextAlignment
    let pickerDelegate: UIPickerViewDelegate
    
    public init(title: String? = nil,
                errorLabelText: String? = nil,
                placeholder: String? = nil,
                pickerData:[Any]? = nil,
                textAlignment: NSTextAlignment = .left,
                pickerDelegate: UIPickerViewDelegate) {
        self.title = title
        self.errorLabelText = errorLabelText
        self.placeholder = placeholder
        self.pickerData = pickerData
        self.textAlignment = textAlignment
        self.pickerDelegate = pickerDelegate
    }
}

