public final class MockAlertBuilding: AlertBuilding {
    // MARK: - buildAlertViewController

    var buildAlertViewControllerWithCallsCount = 0
    var buildAlertViewControllerWithCalled: Bool {
        return buildAlertViewControllerWithCallsCount > 0
    }

    var buildAlertViewControllerWithReceivedAlertModel: AlertModel?
    var buildAlertViewControllerWithReceivedInvocations: [AlertModel] = []
    var buildAlertViewControllerWithReturnValue: UIViewController?
    var buildAlertViewControllerWithClosure: ((AlertModel) -> UIViewController?)?

    func buildAlertViewController(with alertModel: AlertModel) -> UIViewController? {
        buildAlertViewControllerWithCallsCount += 1
        buildAlertViewControllerWithReceivedAlertModel = alertModel
        buildAlertViewControllerWithReceivedInvocations.append(alertModel)
        if let buildAlertViewControllerWithClosure = buildAlertViewControllerWithClosure {
            return buildAlertViewControllerWithClosure(alertModel)
        } else {
            return buildAlertViewControllerWithReturnValue
        }
    }
}
