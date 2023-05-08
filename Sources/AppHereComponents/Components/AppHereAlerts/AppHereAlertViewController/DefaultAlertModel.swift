public struct DefaultAlertModel: AlertModel {
    public let imageName: String
    public let titleText: String
    public let descriptionText: String?
    public let leftButtonTitle: String?
    public let rightButtonTitle: String?

    public init(
        imageName: String,
        titleText: String,
        descriptionText: String?,
        leftButtonTitle: String?,
        rightButtonTitle: String?
    ) {
        self.imageName = imageName
        self.titleText = titleText
        self.descriptionText = descriptionText
        self.leftButtonTitle = leftButtonTitle
        self.rightButtonTitle = rightButtonTitle
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
