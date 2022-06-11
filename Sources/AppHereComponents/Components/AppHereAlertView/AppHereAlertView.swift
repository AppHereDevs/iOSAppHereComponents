//
//  AppHereAlertView.swift
//  ooAutos
//
//  Created by Arda Onat on 11/06/2022.
//

import UIKit

public class AppHereAlertView: AppHereComponentView {
    
    @IBOutlet private weak var alertIconImageView: UIImageView!
    @IBOutlet private weak var alertLabel: AppHereLabel!
    @IBOutlet private weak var cancelButton: AppHereButton!
    @IBOutlet private weak var approveButton: AppHereButton!
    
    public var cancelButtonTapHandler: (() -> Void)?
    public var approveButtonTapHandler: (() -> Void)?
    
    public init(imageName: String, alertText: String) {
        super.init(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        self.alertIconImageView.image = UIImage(named: imageName)
        self.alertLabel.text = alertText
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    @IBAction private func cancelButtonPressed(_ sender: Any) {
        cancelButtonTapHandler?()
    }
    
    @IBAction private func approveButtonTapHandler(_ sender: Any) {
        approveButtonTapHandler?()
    }
}
