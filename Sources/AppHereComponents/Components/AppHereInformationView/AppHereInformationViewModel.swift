//
//  AppHereInformationViewModel.swift
//
//
//  Created by Arda Onat on 8.02.2022.
//

public struct AppHereInformationViewModel {
    var firstInformationText: String?
    var secondInformationText: String?

    public init(firstInformationText: String? = nil, secondInformationText: String? = nil) {
        self.firstInformationText = firstInformationText
        self.secondInformationText = secondInformationText
    }
}
