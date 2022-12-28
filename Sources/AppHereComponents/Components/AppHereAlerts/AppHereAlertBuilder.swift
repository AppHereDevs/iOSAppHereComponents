import UIKit

public protocol AlertBuilding {
    func buildInputAlertViewController(with viewData: InputAlertModel) -> AppHereInputAlertViewController
    func buildAlertViewController(with viewData: AlertModel) -> AppHereAlertViewController
}

public class AlertViewControllerBuilder: AlertBuilding {
    public init() {}
    public func buildInputAlertViewController(with viewData: InputAlertModel) -> AppHereInputAlertViewController {
        let descriptionLabelHidden = viewData.descriptionText == nil
        let leftButtonHidden = viewData.leftButtonTitle == nil
        let rightButtonHidden = viewData.rightButtonTitle == nil
        let centerButtonHidden = viewData.centerButtonTitle == nil
        let viewController = AppHereInputAlertViewController(presentableModel: PresentableInputAlertInformation(
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
        ))
        if viewData.isSecureEntry {
            viewController.enablePasswordToggle()
        }

        return viewController
    }

    public func buildAlertViewController(with viewData: AlertModel) -> AppHereAlertViewController {
        let descriptionLabelHidden = viewData.descriptionText == nil
        let leftButtonHidden = viewData.leftButtonTitle == nil
        let rightButtonHidden = viewData.rightButtonTitle == nil

        let vc = AppHereAlertViewController.loadFromNib()
        vc.presentableModel = PresentableAlertInformation(
            imageName: viewData.imageName,
            titleText: viewData.titleText.valueOrEmpty,
            descriptionText: viewData.descriptionText.valueOrEmpty,
            descriptionLabelHidden: descriptionLabelHidden,
            leftButtonTitle: viewData.leftButtonTitle.valueOrEmpty,
            leftButtonHidden: leftButtonHidden,
            rightButtonTitle: viewData.rightButtonTitle.valueOrEmpty,
            rightButtonHidden: rightButtonHidden
        )

        return vc
    }
}

extension UIViewController {
    static func loadFromNib() -> Self {
        func instantiateFromNib<T: UIViewController>() -> T {
            T(nibName: String(describing: T.self), bundle: nil)
        }

        return instantiateFromNib()
    }
}
