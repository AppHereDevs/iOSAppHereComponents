import UIKit

public typealias InputAlertButtonHandler = (AppHereInputAlertViewController) -> Void

public final class AppHereInputAlertViewController: UIViewController {
    @IBOutlet private var alertImageView: UIImageView!
    @IBOutlet private var alertTitleLabel: AppHereLabel!
    @IBOutlet private var alertDescriptionLabel: AppHereLabel!
    @IBOutlet private var alertInputTextField: AppHereTextField!
    @IBOutlet private var alertLeftButton: AppHereButton!
    @IBOutlet private var alertRightButton: AppHereButton!
    @IBOutlet private var alertCenterButton: UIButton!

    public var leftButtonHandler: InputAlertButtonHandler?
    public var rightButtonHandler: InputAlertButtonHandler?
    public var centerButtonHandler: InputAlertButtonHandler?

    public var inputtedText: String {
        alertInputTextField.text.valueOrEmpty
    }

    private let presentableModel: InputAlertModel

    init(presentableModel: InputAlertModel) {
        self.presentableModel = presentableModel
        super.init(nibName: String(describing: AppHereInputAlertViewController.self), bundle: .module)
    }

    override public func viewDidLoad() {
        super.viewDidLoad()

        alertImageView.image = UIImage(named: presentableModel.imageName)
        alertTitleLabel.text = presentableModel.titleText
        alertInputTextField.placeholder = presentableModel.textFieldPlaceHolder

        if #available(iOS 13.0, *) {
            alertInputTextField.overrideUserInterfaceStyle = .light
        }

        alertDescriptionLabel.isHidden = presentableModel.isDescriptionLabelHidden
        alertDescriptionLabel.text = presentableModel.descriptionText

        alertInputTextField.isSecureTextEntry = presentableModel.isSecureEntry

        alertLeftButton.isHidden = presentableModel.isLeftButtonHidden
        alertLeftButton.setTitle(presentableModel.leftButtonTitle, for: .normal)

        alertRightButton.isHidden = presentableModel.isRightButtonHidden
        alertRightButton.setTitle(presentableModel.rightButtonTitle, for: .normal)

        alertCenterButton.isHidden = presentableModel.isCenterButtonHidden
        alertCenterButton.setTitle(presentableModel.centerButtonTitle, for: .normal)

        if presentableModel.isSecureEntry {
            alertInputTextField.enablePasswordToggle()
        }

        if presentableModel.isFillingMandatory {
            alertRightButton.isUserInteractionEnabled = false
            alertRightButton.alpha = 0.6
            alertInputTextField.addTarget(
                self,
                action: #selector(AppHereInputAlertViewController.textFieldDidChange(_:)),
                for: .editingChanged
            )
        }
    }

    @objc func textFieldDidChange(_ textField: UITextField) {
        if textField.text?.count ?? 0 > 0 {
            alertRightButton.alpha = 1
            alertRightButton.isUserInteractionEnabled = true
        } else {
            alertRightButton.alpha = 0.6
            alertRightButton.isUserInteractionEnabled = false
        }
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError()
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
