import UIKit

public typealias InputAlertButtonHandler = (AppHereInputAlertViewController) -> Void

public struct InputAlertModel: AlertModel {
    public let imageName: String
    public let titleText: String
    public let descriptionText: String?
    public let textFieldPlaceHolder: String?
    public let leftButtonTitle: String?
    public let rightButtonTitle: String?
    public let centerButtonTitle: String?
    public let isSecureEntry: Bool
    public let leftButtonHandler: InputAlertButtonHandler?
    public let rightButtonHandler: InputAlertButtonHandler?
    public let centerButtonHandler: InputAlertButtonHandler?

    public init(
        imageName: String,
        titleText: String,
        descriptionText: String?,
        textFieldPlaceHolder: String?,
        leftButtonTitle: String?,
        rightButtonTitle: String?,
        centerButtonTitle: String?,
        isSecureEntry: Bool,
        leftButtonHandler: InputAlertButtonHandler?,
        rightButtonHandler: InputAlertButtonHandler?,
        centerButtonHandler: InputAlertButtonHandler?
    ) {
        self.imageName = imageName
        self.titleText = titleText
        self.descriptionText = descriptionText
        self.textFieldPlaceHolder = textFieldPlaceHolder
        self.leftButtonTitle = leftButtonTitle
        self.rightButtonTitle = rightButtonTitle
        self.centerButtonTitle = centerButtonTitle
        self.isSecureEntry = isSecureEntry
        self.leftButtonHandler = leftButtonHandler
        self.rightButtonHandler = rightButtonHandler
        self.centerButtonHandler = centerButtonHandler
    }

    var isDescriptionLabelHidden: Bool {
        descriptionText == nil
    }

    var isLeftButtonHidden: Bool {
        leftButtonTitle == nil
    }

    var isRightButtonHidden: Bool {
        rightButtonTitle == nil
    }

    var isCenterButtonHidden: Bool {
        centerButtonTitle == nil
    }

    var isButtonStackViewHidden: Bool {
        isLeftButtonHidden && isRightButtonHidden
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

    var presentableModel: InputAlertModel?

    public var inputtedText: String {
        alertInputTextField.text.valueOrEmpty
    }

    private var leftButtonHandler: InputAlertButtonHandler?
    private var rightButtonHandler: InputAlertButtonHandler?
    private var centerButtonHandler: InputAlertButtonHandler?

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

        alertDescriptionLabel.isHidden = presentableModel!.isDescriptionLabelHidden
        alertDescriptionLabel.text = presentableModel!.descriptionText

        alertInputTextField.isSecureTextEntry = presentableModel!.isSecureEntry

        alertLeftButton.isHidden = presentableModel!.isLeftButtonHidden
        alertLeftButton.setTitle(presentableModel!.leftButtonTitle, for: .normal)

        alertRightButton.isHidden = presentableModel!.isRightButtonHidden
        alertRightButton.setTitle(presentableModel!.rightButtonTitle, for: .normal)

        alertCenterButton.isHidden = presentableModel!.isCenterButtonHidden
        alertCenterButton.setTitle(presentableModel!.centerButtonTitle, for: .normal)

        leftButtonHandler = presentableModel!.leftButtonHandler
        rightButtonHandler = presentableModel!.rightButtonHandler
        centerButtonHandler = presentableModel!.centerButtonHandler

        if presentableModel!.isSecureEntry {
            alertInputTextField.enablePasswordToggle()
        }
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    func enablePasswordToggle() {
        alertInputTextField.enablePasswordToggle()
    }

    @IBAction private func leftButtonPressed(_: Any) {
        leftButtonHandler?(self)
    }

    @IBAction private func rightButtonPressed(_: Any) {
        rightButtonHandler?(self)
    }

    @IBAction private func centerButtonPressed(_: Any) {
        centerButtonHandler?(self)
    }
}
