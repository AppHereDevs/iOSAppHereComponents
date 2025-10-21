import Foundation

// MARK: - ValidationError Protocol
public protocol ValidationError {
    var message: String { get }
}

// MARK: - ValidationPattern Protocol
public protocol ValidationPattern {
    var pattern: String { get }
    var regex: String? { get }
    var rulePattern: ValidationRulePattern { get }
}

// MARK: - ValidationRulePattern
public struct ValidationRulePattern {
    public let pattern: String
    public let error: ValidationError
    
    public init(pattern: String, error: ValidationError) {
        self.pattern = pattern
        self.error = error
    }
}

// MARK: - ValidationRule
public struct ValidationRule {
    public let pattern: String
    public let error: ValidationError
    
    public init(pattern: String, error: ValidationError) {
        self.pattern = pattern
        self.error = error
    }
}

// MARK: - ValidationRuleSet
public class ValidationRuleSet<T> {
    private var rules: [ValidationRule] = []
    
    public init() {}
    
    public func add(rule: ValidationRulePattern) {
        let validationRule = ValidationRule(pattern: rule.pattern, error: rule.error)
        rules.append(validationRule)
    }
    
    public func validate(_ input: T) -> ValidationResult {
        guard let stringInput = input as? String else {
            return .invalid([AppHereValidationError.invalidEmail])
        }
        
        for rule in rules {
            if !matchesPattern(stringInput, pattern: rule.pattern) {
                return .invalid([rule.error])
            }
        }
        
        return .valid
    }
    
    private func matchesPattern(_ input: String, pattern: String) -> Bool {
        do {
            let regex = try NSRegularExpression(pattern: pattern)
            let range = NSRange(location: 0, length: input.utf16.count)
            return regex.firstMatch(in: input, options: [], range: range) != nil
        } catch {
            return false
        }
    }
}

// MARK: - ValidationResult
public enum ValidationResult: Equatable {
    case valid
    case invalid([ValidationError])
    
    public static func == (lhs: ValidationResult, rhs: ValidationResult) -> Bool {
        switch (lhs, rhs) {
        case (.valid, .valid):
            return true
        case (.invalid(let lhsErrors), .invalid(let rhsErrors)):
            return lhsErrors.count == rhsErrors.count && 
                   zip(lhsErrors, rhsErrors).allSatisfy { $0.0.message == $0.1.message }
        default:
            return false
        }
    }
}

