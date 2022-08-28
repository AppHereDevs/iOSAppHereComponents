import UIKit

public struct AlertModel {
    let imageName: String
    let titleText: String?
    let descriptionText: String?
    let leftButtonTitle: String?
    let rightButtonTitle: String?
}

public struct PresentableAlertInformation {
    let imageName: String
    let titleText: String
    let descriptionText: String
    let descriptionLabelHidden: Bool
    let leftButtonTitle: String
    let leftButtonHidden: Bool
    let rightButtonTitle: String
    let rightButtonHidden: Bool

    public init(imageName: String, titleText: String, descriptionText: String, descriptionLabelHidden: Bool, leftButtonTitle: String, leftButtonHidden: Bool, rightButtonTitle: String, rightButtonHidden: Bool) {
        self.imageName = imageName
        self.titleText = titleText
        self.descriptionText = descriptionText
        self.descriptionLabelHidden = descriptionLabelHidden
        self.leftButtonTitle = leftButtonTitle
        self.leftButtonHidden = leftButtonHidden
        self.rightButtonTitle = rightButtonTitle
        self.rightButtonHidden = rightButtonHidden
    }
}

public final class AppHereAlertViewController: UIViewController {
    @IBOutlet private var alertImageView: UIImageView!
    @IBOutlet private var alertTitleLabel: AppHereLabel!
    @IBOutlet private var alertDescriptionLabel: AppHereLabel!
    @IBOutlet private var alertLeftButton: AppHereButton!
    @IBOutlet private var alertRightButton: AppHereButton!

    var cancelButtonHandler: (() -> Void)?
    var confirmButtonHandler: (() -> Void)?

    init(presentableModel: PresentableAlertInformation) {
        super.init(nibName: nil, bundle: .main)
        _ = view

        alertImageView.image = UIImage(named: presentableModel.imageName)

        alertTitleLabel.text = presentableModel.titleText

        alertDescriptionLabel.isHidden = presentableModel.descriptionLabelHidden
        alertDescriptionLabel.text = presentableModel.descriptionText

        alertLeftButton.isHidden = presentableModel.leftButtonHidden
        alertLeftButton.setTitle(presentableModel.leftButtonTitle, for: .normal)

        alertRightButton.isHidden = presentableModel.rightButtonHidden
        alertRightButton.setTitle(presentableModel.rightButtonTitle, for: .normal)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    @IBAction private func cancelButtonPressed(_: Any) {
        cancelButtonHandler?()
    }

    @IBAction func confirmButtonPressed(_: Any) {
        confirmButtonHandler?()
    }
}