import UIKit

public protocol AlertModel {
    var imageName: String { get }
    var titleText: String { get }
    var descriptionText: String? { get }
    var leftButtonTitle: String? { get }
    var rightButtonTitle: String? { get }
}

public protocol AlertBuilding {
    func buildAlertViewController(with alertModel: AlertModel) -> UIViewController?
}

public class AlertViewControllerBuilder: AlertBuilding {
    public init() {}

    public func buildAlertViewController(with alertModel: AlertModel) -> UIViewController? {
        if let defaultAlertModel = alertModel as? DefaultAlertModel {
            return buildDefaultAlertViewController(with: defaultAlertModel)
        } else if let inputAlertModel = alertModel as? InputAlertModel {
            return buildInputAlertViewController(with: inputAlertModel)
        }
        return nil
    }

    private func buildDefaultAlertViewController(with viewData: DefaultAlertModel) -> AppHereAlertViewController {
        let viewController = AppHereAlertViewController.loadFromNib()
        viewController.presentableModel = viewData
        return viewController
    }

    private func buildInputAlertViewController(with viewData: InputAlertModel) -> AppHereInputAlertViewController {
        let viewController = AppHereInputAlertViewController.loadFromNib()
        viewController.presentableModel = viewData
        // if viewData.isSecureEntry {
        //   viewController.enablePasswordToggle()
        // }

        return viewController
    }
}

private extension UIViewController {
    static func loadFromNib() -> Self {
        func instantiateFromNib<T: UIViewController>() -> T {
            T(nibName: String(describing: T.self), bundle: .module)
        }

        return instantiateFromNib()
    }
}
