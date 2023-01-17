public final class MockUserInputtable: UserInputtable {
    var isValidInput: Bool {
        get { return underlyingIsValidInput }
        set(value) { underlyingIsValidInput = value }
    }

    var underlyingIsValidInput: Bool!

    // MARK: - showError

    var showErrorCallsCount = 0
    var showErrorCalled: Bool {
        return showErrorCallsCount > 0
    }

    var showErrorClosure: (() -> Void)?

    func showError() {
        showErrorCallsCount += 1
        showErrorClosure?()
    }

    // MARK: - hideError

    var hideErrorCallsCount = 0
    var hideErrorCalled: Bool {
        return hideErrorCallsCount > 0
    }

    var hideErrorClosure: (() -> Void)?

    func hideError() {
        hideErrorCallsCount += 1
        hideErrorClosure?()
    }
}
