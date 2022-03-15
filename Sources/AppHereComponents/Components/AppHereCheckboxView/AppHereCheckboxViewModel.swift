//
//  AppHereCheckboxViewModel.swift
//  
//
//  Created by Arda Onat on 11.02.2022.
//

public struct AppHereCheckboxViewModel {
    var checkboxDefaultImageName: String
    var checkboxSelectedImageName: String
    var checkboxErrorImageName: String
    var informationText: String
    var isFirstClickButtonEnabled: Bool
    
    public init(checkboxDefaultImageName: String, checkboxSelectedImageName: String, checkboxErrorImageName: String, informationText: String, isFirstClickButtonEnabled: Bool = false) {
        
        self.checkboxDefaultImageName = checkboxDefaultImageName
        self.checkboxSelectedImageName = checkboxSelectedImageName
        self.checkboxErrorImageName = checkboxErrorImageName
        self.informationText = informationText
        self.isFirstClickButtonEnabled = isFirstClickButtonEnabled
    }
}
