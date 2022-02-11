//
//  AppHereCheckboxViewModel.swift
//  
//
//  Created by Arda Onat on 11.02.2022.
//

public struct AppHereCheckboxViewModel {
    var checkboxDefaultImageName: String?
    var checkboxSelectedImageName: String?
    var informationText: String
    
    public init(checkboxDefaultImageName: String, checkboxSelectedImageName: String, informationText: String) {
        
        self.checkboxDefaultImageName = checkboxDefaultImageName
        self.checkboxSelectedImageName = checkboxSelectedImageName
        self.informationText = informationText
    }
}
