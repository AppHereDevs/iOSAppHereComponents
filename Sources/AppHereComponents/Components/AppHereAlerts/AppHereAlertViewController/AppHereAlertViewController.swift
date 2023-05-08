import UIKit

public typealias AlertButtonHandler = (AppHereAlertViewController) -> Void

public final class AppHereAlertViewController: UIViewController {
    @IBOutlet private var alertImageView: UIImageView!
    @IBOutlet private var textStackView: UIStackView!
    @IBOutlet private var alertTitleLabel: AppHereLabel!
    @IBOutlet private var alertDescriptionLabel: AppHereLabel!
    @IBOutlet private var buttonStackView: UIStackView!
    @IBOutlet private var alertLeftButton: AppHereButton!
    @IBOutlet private var alertRightButton: AppHereButton!

    public var leftButtonHandler: AlertButtonHandler?
    public var rightButtonHandler: AlertButtonHandler?

    private let presentableModel: DefaultAlertModel

    init(presentableModel: DefaultAlertModel) {
        self.presentableModel = presentableModel
        super.init(nibName: String(describing: AppHereAlertViewController.self), bundle: .module)
    }

    override public func viewDidLoad() {
        super.viewDidLoad()
        alertImageView.image = UIImage(named: presentableModel.imageName)

        alertTitleLabel.isHidden = presentableModel.isTitleLabelHidden
        alertTitleLabel.text = presentableModel.titleText

        alertDescriptionLabel.isHidden = presentableModel.isDescriptionLabelHidden
        alertDescriptionLabel.text = presentableModel.descriptionText

        buttonStackView.isHidden = presentableModel.isButtonStackViewHidden

        alertLeftButton.isHidden = presentableModel.isLeftButtonHidden
        alertLeftButton.setTitle(presentableModel.leftButtonTitle, for: .normal)

        alertRightButton.isHidden = presentableModel.isRightButtonHidden
        alertRightButton.setTitle(presentableModel.rightButtonTitle, for: .normal)
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
