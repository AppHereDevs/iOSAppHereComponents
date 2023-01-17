final class MockAlertModel: AlertModel {
    var imageName: String {
        get { return underlyingImageName }
        set(value) { underlyingImageName = value }
    }

    var underlyingImageName: String!
    var titleText: String {
        get { return underlyingTitleText }
        set(value) { underlyingTitleText = value }
    }

    var underlyingTitleText: String!
    var descriptionText: String?
    var leftButtonTitle: String?
    var rightButtonTitle: String?
}
