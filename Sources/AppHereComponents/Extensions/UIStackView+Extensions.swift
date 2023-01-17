import UIKit

public extension UIStackView {
    func removeAllArrangedViewIfExist() {
        for item in arrangedSubviews {
            removeArrangedSubview(item)
            item.removeFromSuperview()
        }
    }
}
