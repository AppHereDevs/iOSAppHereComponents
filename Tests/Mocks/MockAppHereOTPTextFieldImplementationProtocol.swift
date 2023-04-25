public final class MockAppHereOTPTextFieldImplementationProtocol: AppHereOTPTextFieldImplementationProtocol {
    // MARK: - digitalLabelsCount

    var digitalLabelsCountCallsCount = 0
    var digitalLabelsCountCalled: Bool {
        return digitalLabelsCountCallsCount > 0
    }

    var digitalLabelsCountReturnValue: Int!
    var digitalLabelsCountClosure: (() -> Int)?

    func digitalLabelsCount() -> Int {
        digitalLabelsCountCallsCount += 1
        if let digitalLabelsCountClosure = digitalLabelsCountClosure {
            return digitalLabelsCountClosure()
        } else {
            return digitalLabelsCountReturnValue
        }
    }
}
