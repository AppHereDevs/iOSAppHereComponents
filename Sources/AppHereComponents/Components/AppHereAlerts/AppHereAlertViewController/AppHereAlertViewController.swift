import UIKit

public struct AlertModel {
    let imageName: String
    let titleText: String?
    let descriptionText: String?
    let leftButtonTitle: String?
    let rightButtonTitle: String?

    public init(imageName: String, titleText: String?, descriptionText: String?, leftButtonTitle: String?, rightButtonTitle: String?) {
        self.imageName = imageName
        self.titleText = titleText
        self.descriptionText = descriptionText
        self.leftButtonTitle = leftButtonTitle
        self.rightButtonTitle = rightButtonTitle
    }
}

struct PresentableAlertInformation {
    let imageName: String
    let titleText: String
    let descriptionText: String
    let descriptionLabelHidden: Bool
    let leftButtonTitle: String
    let leftButtonHidden: Bool
    let rightButtonTitle: String
    let rightButtonHidden: Bool

    init(imageName: String, titleText: String, descriptionText: String, descriptionLabelHidden: Bool, leftButtonTitle: String, leftButtonHidden: Bool, rightButtonTitle: String, rightButtonHidden: Bool) {
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

    private let presentableModel: PresentableAlertInformation

    public var leftButtonHandler: (() -> Void)?
    public var rightButtonHandler: (() -> Void)?

    init(presentableModel: PresentableAlertInformation) {
        self.presentableModel = presentableModel
        super.init(nibName: nil, bundle: .main)
    }

    public override func viewDidLoad() {
        super.viewDidLoad()
        var v = self.view
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
        fatalError()
    }

    @IBAction private func leftButtonPressed(_: Any) {
        leftButtonHandler?()
    }

    @IBAction private func rightButtonPressed(_: Any) {
        rightButtonHandler?()
    }
}
