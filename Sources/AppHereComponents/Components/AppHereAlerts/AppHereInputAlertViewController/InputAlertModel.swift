public struct InputAlertModel: AlertModel {
    public let imageName: String
    public let titleText: String
    public let descriptionText: String?
    public let textFieldPlaceHolder: String?
    public let leftButtonTitle: String?
    public let rightButtonTitle: String?
    public let centerButtonTitle: String?
    public let isSecureEntry: Bool
    public let isFillingMandatory: Bool

    public init(
        imageName: String,
        titleText: String,
        descriptionText: String?,
        textFieldPlaceHolder: String?,
        leftButtonTitle: String?,
        rightButtonTitle: String?,
        centerButtonTitle: String?,
        isSecureEntry: Bool,
        isFillingMandatory: Bool = true
    ) {
        self.imageName = imageName
        self.titleText = titleText
        self.descriptionText = descriptionText
        self.textFieldPlaceHolder = textFieldPlaceHolder
        self.leftButtonTitle = leftButtonTitle
        self.rightButtonTitle = rightButtonTitle
        self.centerButtonTitle = centerButtonTitle
        self.isSecureEntry = isSecureEntry
        self.isFillingMandatory = isFillingMandatory
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
