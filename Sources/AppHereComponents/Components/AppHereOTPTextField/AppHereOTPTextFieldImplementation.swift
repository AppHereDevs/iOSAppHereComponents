//
//  AppHereOTPTextFieldImplementation.swift
//  ViberTemplate
//
//  Created by Abdelrhman Eliwa on 09/05/2021.
//

import UIKit

protocol AppHereOTPTextFieldImplementationProtocol: AnyObject {
    func digitalLabelsCount() -> Int
}

class AppHereOTPTextFieldImplementation: NSObject, UITextFieldDelegate {
    weak var implementationDelegate: AppHereOTPTextFieldImplementationProtocol?

    func textField(
        _ textField: UITextField,
        shouldChangeCharactersIn _: NSRange,
        replacementString string: String
    ) -> Bool {
        guard let characterCount = textField.text?.count else { return false }
        return characterCount < implementationDelegate?.digitalLabelsCount() ?? 0 || string == ""
    }
}
