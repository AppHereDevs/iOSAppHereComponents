//
//  AppHereValidationRules.swift
//
//
//  Created by Muhammed Sevük on 11.02.2022.
//

import Foundation
import Validator

public enum AppHereValidationError: ValidationError {
    case invalidEmail
    case invalidPhoneNumber

    public var message: String {
        ""
    }
}

public enum PatternType: ValidationPattern {
    case email
    case phoneNumberWithSpace

    public var pattern: String {
        switch self {
        case .email:
            return "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        case .phoneNumberWithSpace:
            return "^[5]\\d{2} \\d{3} \\d{2} \\d{2}$"
        }
    }

    public var regex: String? {
        switch self {
        case .email:
            return nil
        case .phoneNumberWithSpace:
            return "NNN NNN NN NN"
        }
    }

    public var rulePattern: ValidationRulePattern {
        switch self {
        case .email:
            return ValidationRulePattern(pattern: pattern, error: AppHereValidationError.invalidEmail)
        case .phoneNumberWithSpace:
            return ValidationRulePattern(pattern: pattern, error: AppHereValidationError.invalidPhoneNumber)
        }
    }
}
