import UIKit

public protocol AlertBuilding {
    func buildDefaultAlertViewController(with viewData: DefaultAlertModel) -> AppHereAlertViewController
    func buildInputAlertViewController(with viewData: InputAlertModel) -> AppHereInputAlertViewController
}

public class AlertViewControllerBuilder: AlertBuilding {
    public init() {}

    public func buildDefaultAlertViewController(with viewData: DefaultAlertModel) -> AppHereAlertViewController {
        let viewController = AppHereAlertViewController(presentableModel: viewData)
        return viewController
    }

    public func buildInputAlertViewController(with viewData: InputAlertModel) -> AppHereInputAlertViewController {
        let viewController = AppHereInputAlertViewController(presentableModel: viewData)
        return viewController
    }
}

private extension UIViewController {
    func loadFromNib() -> Self {
        func instantiateFromNib<T: UIViewController>() -> T {
            T(nibName: String(describing: T.self), bundle: .module)
        }

        return instantiateFromNib()
    }
}
