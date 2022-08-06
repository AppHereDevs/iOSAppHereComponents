//
//  ApphereVerticalBannerViewModel.swift
//
//
//  Created by Muhammed Sevük on 24.05.2022.
//

public struct ApphereVerticalBannerViewModel {
    var informationText: String?
    var imageUrl: String?

    public init(informationText: String? = nil, imageUrl: String? = nil) {
        self.informationText = informationText
        self.imageUrl = imageUrl
    }
}
