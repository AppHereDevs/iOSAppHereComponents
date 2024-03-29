import Foundation
import UIKit

public class AppHereComponentView: UIView, Themeable {
    var view: UIView!
    public var themeDict: NSDictionary?

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    private func setup() {
        view = fromNib()
        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.backgroundColor = .clear
        addSubview(view)
    }

    @IBInspectable public var themeKey: String? {
        didSet {
            guard let themeKey = themeKey, let themeDict = AppHereThemeManager.shared.getTheme(byKey: themeKey) else {
                return
            }
            self.themeDict = themeDict
        }
    }

    private func fromNib() -> UIView {
        let bundle = Bundle.module
        let nibName = type(of: self).description().components(separatedBy: ".").last!
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as! UIView
    }
}
