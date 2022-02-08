//
//  InformationViewModel.swift
//  
//
//  Created by Arda Onat on 8.02.2022.
//

public struct InformationViewModel {
    var firstInformationText: String?
    var secondInformationText: String?
    
    public init(firstInformationText: String?, secondInformationText: String?) {
        self.firstInformationText = firstInformationText
        self.secondInformationText = secondInformationText
    }
}
