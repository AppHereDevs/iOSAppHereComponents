import UIKit

public struct InputAlertModel: AlertModel {
    public let imageName: String
    public let titleText: String
    public let descriptionText: String?
    public let textFieldPlaceHolder: String?
    public let leftButtonTitle: String?
    public let rightButtonTitle: String?
    public let centerButtonTitle: String?
    public let isSecureEntry: Bool

    public init(
        imageName: String,
        titleText: String,
        descriptionText: String?,
        textFieldPlaceHolder: String?,
        leftButtonTitle: String?,
        rightButtonTitle: String?,
        centerButtonTitle: String?,
        isSecureEntry: Bool
    ) {
        self.imageName = imageName
        self.titleText = titleText
        self.descriptionText = descriptionText
        self.textFieldPlaceHolder = textFieldPlaceHolder
        self.leftButtonTitle = leftButtonTitle
        self.rightButtonTitle = rightButtonTitle
        self.centerButtonTitle = centerButtonTitle
        self.isSecureEntry = isSecureEntry
    }
}

struct PresentableInputAlertInformation {
    let imageName: String
    let titleText: String
    let textFieldPlaceHolder: String
    let descriptionText: String
    let descriptionLabelHidden: Bool
    let leftButtonTitle: String
    let leftButtonHidden: Bool
    let rightButtonTitle: String
    let rightButtonHidden: Bool
    let centerButtonTitle: String
    let centerButtonHidden: Bool
    let isSecureEntry: Bool

    init(
        imageName: String,
        titleText: String,
        textFieldPlaceHolder: String,
        descriptionText: String,
        descriptionLabelHidden: Bool,
        leftButtonTitle: String,
        leftButtonHidden: Bool,
        rightButtonTitle: String,
        rightButtonHidden: Bool,
        centerButtonTitle: String,
        centerButtonHidden: Bool,
        isSecureEntry: Bool
    ) {
        self.imageName = imageName
        self.titleText = titleText
        self.textFieldPlaceHolder = textFieldPlaceHolder
        self.descriptionText = descriptionText
        self.descriptionLabelHidden = descriptionLabelHidden
        self.leftButtonTitle = leftButtonTitle
        self.leftButtonHidden = leftButtonHidden
        self.rightButtonTitle = rightButtonTitle
        self.rightButtonHidden = rightButtonHidden
        self.centerButtonTitle = centerButtonTitle
        self.centerButtonHidden = centerButtonHidden
        self.isSecureEntry = isSecureEntry
    }
}

public final class AppHereInputAlertViewController: UIViewController {
    @IBOutlet private var alertImageView: UIImageView!
    @IBOutlet private var alertTitleLabel: AppHereLabel!
    @IBOutlet private var alertDescriptionLabel: AppHereLabel!
    @IBOutlet private var alertInputTextField: AppHereTextField!
    @IBOutlet private var alertLeftButton: AppHereButton!
    @IBOutlet private var alertRightButton: AppHereButton!
    @IBOutlet private var alertCenterButton: UIButton!

    var presentableModel: PresentableInputAlertInformation?

    public var inputtedText: String {
        alertInputTextField.text.valueOrEmpty
    }

    public var leftButtonHandler: (() -> Void)?
    public var rightButtonHandler: (() -> Void)?
    public var centerButtonHandler: (() -> Void)?

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    override public func viewDidLoad() {
        super.viewDidLoad()

        alertImageView.image = UIImage(named: presentableModel!.imageName)
        alertTitleLabel.text = presentableModel!.titleText
        alertInputTextField.placeholder = presentableModel!.textFieldPlaceHolder
        if #available(iOS 13.0, *) {
            alertInputTextField.overrideUserInterfaceStyle = .light
        }

        alertDescriptionLabel.isHidden = presentableModel!.descriptionLabelHidden
        alertDescriptionLabel.text = presentableModel!.descriptionText

        alertInputTextField.isSecureTextEntry = presentableModel!.isSecureEntry

        alertLeftButton.isHidden = presentableModel!.leftButtonHidden
        alertLeftButton.setTitle(presentableModel!.leftButtonTitle, for: .normal)

        alertRightButton.isHidden = presentableModel!.rightButtonHidden
        alertRightButton.setTitle(presentableModel!.rightButtonTitle, for: .normal)

        alertCenterButton.isHidden = presentableModel!.centerButtonHidden
        alertCenterButton.setTitle(presentableModel!.centerButtonTitle, for: .normal)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    public func enablePasswordToggle() {
        alertInputTextField.enablePasswordToggle()
    }

    @IBAction private func leftButtonPressed(_: Any) {
        leftButtonHandler?()
    }

    @IBAction private func rightButtonPressed(_: Any) {
        rightButtonHandler?()
    }

    @IBAction private func centerButtonPressed(_: Any) {
        centerButtonHandler?()
    }
}
