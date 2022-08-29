//
//  ApphereVerticalBannerViewModel.swift
//
//
//  Created by Muhammed Sevük on 24.05.2022.
//
import Foundation

public struct ApphereVerticalBannerViewModel {
    var informationText: String?
    var imageUrl: URL?

    public init(informationText: String? = nil, imageUrl: URL? = nil) {
        self.informationText = informationText
        self.imageUrl = imageUrl
    }
}
