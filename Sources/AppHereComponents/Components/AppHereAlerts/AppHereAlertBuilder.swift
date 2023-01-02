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
        let descriptionLabelHidden = viewData.descriptionText == nil
        let leftButtonHidden = viewData.leftButtonTitle == nil
        let rightButtonHidden = viewData.rightButtonTitle == nil
        let buttonStackViewHidden = leftButtonHidden && rightButtonHidden

        let viewController = AppHereAlertViewController.loadFromNib()
        viewController.presentableModel = PresentableAlertInformation(
            imageName: viewData.imageName,
            titleText: viewData.titleText,
            descriptionText: viewData.descriptionText.valueOrEmpty,
            descriptionLabelHidden: descriptionLabelHidden,
            buttonStackViewHidden: buttonStackViewHidden,
            leftButtonTitle: viewData.leftButtonTitle.valueOrEmpty,
            leftButtonHidden: leftButtonHidden,
            rightButtonTitle: viewData.rightButtonTitle.valueOrEmpty,
            rightButtonHidden: rightButtonHidden
        )
        return viewController
    }

    private func buildInputAlertViewController(with viewData: InputAlertModel) -> AppHereInputAlertViewController {
        let descriptionLabelHidden = viewData.descriptionText == nil
        let leftButtonHidden = viewData.leftButtonTitle == nil
        let rightButtonHidden = viewData.rightButtonTitle == nil
        let centerButtonHidden = viewData.centerButtonTitle == nil
        let viewController = AppHereInputAlertViewController.loadFromNib()
        viewController.presentableModel = PresentableInputAlertInformation(
            imageName: viewData.imageName,
            titleText: viewData.titleText,
            textFieldPlaceHolder: viewData.textFieldPlaceHolder.valueOrEmpty,
            descriptionText: viewData.descriptionText.valueOrEmpty,
            descriptionLabelHidden: descriptionLabelHidden,
            leftButtonTitle: viewData.leftButtonTitle.valueOrEmpty,
            leftButtonHidden: leftButtonHidden,
            rightButtonTitle: viewData.rightButtonTitle.valueOrEmpty,
            rightButtonHidden: rightButtonHidden,
            centerButtonTitle: viewData.centerButtonTitle.valueOrEmpty,
            centerButtonHidden: centerButtonHidden,
            isSecureEntry: viewData.isSecureEntry
        )
        if viewData.isSecureEntry {
            viewController.enablePasswordToggle()
        }

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
