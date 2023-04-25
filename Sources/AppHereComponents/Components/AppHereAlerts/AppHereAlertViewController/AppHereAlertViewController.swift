import UIKit

public typealias AlertButtonHandler = (AppHereAlertViewController) -> Void

public struct DefaultAlertModel: AlertModel {
    public let imageName: String
    public let titleText: String
    public let descriptionText: String?
    public let leftButtonTitle: String?
    public let rightButtonTitle: String?
    public let leftButtonHandler: AlertButtonHandler?
    public let rightButtonHandler: AlertButtonHandler?

    public init(
        imageName: String,
        titleText: String,
        descriptionText: String?,
        leftButtonTitle: String?,
        rightButtonTitle: String?,
        leftButtonHandler: AlertButtonHandler? = nil,
        rightButtonHandler: AlertButtonHandler? = nil
    ) {
        self.imageName = imageName
        self.titleText = titleText
        self.descriptionText = descriptionText
        self.leftButtonTitle = leftButtonTitle
        self.leftButtonHandler = leftButtonHandler
        self.rightButtonTitle = rightButtonTitle
        self.rightButtonHandler = rightButtonHandler
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

    var isButtonStackViewHidden: Bool {
        isLeftButtonHidden && isRightButtonHidden
    }
}

public final class AppHereAlertViewController: UIViewController {
    @IBOutlet private var alertImageView: UIImageView!
    @IBOutlet private var textStackView: UIStackView!
    @IBOutlet private var alertTitleLabel: AppHereLabel!
    @IBOutlet private var alertDescriptionLabel: AppHereLabel!
    @IBOutlet private var buttonStackView: UIStackView!
    @IBOutlet private var alertLeftButton: AppHereButton!
    @IBOutlet private var alertRightButton: AppHereButton!

    var presentableModel: DefaultAlertModel?

    private var leftButtonHandler: AlertButtonHandler?
    private var rightButtonHandler: AlertButtonHandler?

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    override public func viewDidLoad() {
        super.viewDidLoad()
        alertImageView.image = UIImage(named: presentableModel!.imageName)

        alertTitleLabel.text = presentableModel!.titleText

        alertDescriptionLabel.isHidden = presentableModel!.isDescriptionLabelHidden
        alertDescriptionLabel.text = presentableModel!.descriptionText

        buttonStackView.isHidden = presentableModel!.isButtonStackViewHidden

        alertLeftButton.isHidden = presentableModel!.isLeftButtonHidden
        alertLeftButton.setTitle(presentableModel!.leftButtonTitle, for: .normal)

        alertRightButton.isHidden = presentableModel!.isRightButtonHidden
        alertRightButton.setTitle(presentableModel!.rightButtonTitle, for: .normal)

        leftButtonHandler = presentableModel!.leftButtonHandler
        rightButtonHandler = presentableModel!.rightButtonHandler
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError()
    }

    @IBAction private func leftButtonPressed(_: Any) {
        leftButtonHandler?(self)
    }

    @IBAction private func rightButtonPressed(_: Any) {
        rightButtonHandler?(self)
    }
}
