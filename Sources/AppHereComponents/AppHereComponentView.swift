//
//  File.swift
//  
//
//  Created by Arda Onat on 24.12.2021.
//

import Foundation
import UIKit

public protocol Themeable {
    var themeKey: String? { get set }
    var themeDict: NSDictionary? { get set }
}

open class AppHereComponentView: UIView, Themeable {
    
    var view: UIView!
    public var themeDict: NSDictionary?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    func setup() {
        view = fromNib()
        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.backgroundColor = .clear
        addSubview(view)
    }
    
    public var themeKey: String? {
        didSet {
            guard let themeKey = themeKey, let themeDict = AppHereThemeManager.shared.getTheme(byKey: themeKey) else {
                return
            }
            self.themeDict = themeDict
        }
    }
    
    func fromNib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nibName = type(of: self).description().components(separatedBy: ".").last!
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as! UIView
    }
}
