//
//  AppHereButtonTests.swift
//  
//
//  Created by Arda Onat on 10.02.2022.
//

import XCTest
@testable import AppHereComponents

final class AppHereButtonTest: XCTestCase {

    func testButtonIsHiddenWhenThemeIsNotFound() {
        // Given
        setupAppThemeManager()
        let sut = AppHereButton()
        
        // When
        sut.themeKey = "ButtonTheme0"
        
        // Then
        XCTAssertNil(sut.themeDict)
        XCTAssertTrue(sut.isHidden)
    }
    
    func testButtonIsShownThemeDictSetWhenThemeIsFound() {
        // Given
        setupAppThemeManager()
        let sut = AppHereButton()

        // When
        sut.themeKey = "AppHereButton-NoValue"

        // Then
        XCTAssertNotNil(sut.themeDict)
        XCTAssertFalse(sut.isHidden)
    }
    
    func testButtonAppearanceWhenThemeDoesNotIncludeValues() {
        // Given
        setupAppThemeManager()
        let sut = AppHereButton()

        // When
        sut.themeKey = "AppHereButton-NoValue"

        // Then
        XCTAssertEqual(sut.titleLabel?.textColor, UIColor(hexString: AppHereButtonThemeModel.defaultTextColor))
        XCTAssertEqual(sut.backgroundColor, UIColor(hexString: AppHereButtonThemeModel.defaultBackgroundColor))
        XCTAssertEqual(sut.layer.cornerRadius, 0)
        XCTAssertEqual(sut.layer.borderWidth, 0)
    }
    
    func testButtonAppearanceWhenThemeIncludesValues() {
        // Given
        setupAppThemeManager()
        let sut = AppHereButton()

        // When
        sut.themeKey = "AppHereButton-Values"

        // Then
        XCTAssertEqual(sut.titleLabel?.textColor, UIColor(hexString:"#FFF000"))
        XCTAssertEqual(sut.backgroundColor, UIColor(hexString:"#0CBFDC"))
        XCTAssertEqual(sut.layer.cornerRadius, 8)
        XCTAssertEqual(sut.layer.borderWidth, 8)
    }
}
