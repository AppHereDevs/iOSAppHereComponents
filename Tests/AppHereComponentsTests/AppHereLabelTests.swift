import XCTest
@testable import AppHereComponents

final class AppHereLabelTest: XCTestCase {
    
    func testLabelIsHiddenWhenThemeIsNotFound() {
        // Given
        setupAppThemeManager()
        let sut = AppHereLabel()
        
        // When
        sut.themeKey = "LabelTheme0"
        
        // Then
        XCTAssertNil(sut.themeDict)
        XCTAssertTrue(sut.isHidden)
    }
    
    func testLabelIsShownThemeDictSetWhenThemeIsFound() {
        // Given
        setupAppThemeManager()
        let sut = AppHereLabel()

        // When
        sut.themeKey = "LabelTheme1"

        // Then
        XCTAssertNotNil(sut.themeDict)
        XCTAssertFalse(sut.isHidden)
    }
    
    func testLabelAppearanceHasBeenSetWhenThemeDoesNotIncludeBackgroundColor() {
        // Given
        setupAppThemeManager()
        let sut = AppHereLabel()

        // When
        sut.themeKey = "LabelThemeNoValue"

        // Then
        XCTAssertEqual(sut.backgroundColor, UIColor(hexString: AppHereLabelThemeModel.defaultBackgroundColor))
    }
    
    func testLabelAppearanceHasBeenSetWhenThemeDoesNotIncludeTextColor() {
        // Given
        setupAppThemeManager()
        let sut = AppHereLabel()

        // When
        sut.themeKey = "LabelThemeNoValue"

        // Then
        XCTAssertEqual(sut.textColor, UIColor(hexString: AppHereLabelThemeModel.defaultTextColor))
    }
    
    func testLabelAppearanceHasBeenSetWhenThemeIsFoundWithValues() {
        // Given
        setupAppThemeManager()
        let sut = AppHereLabel()

        // When
        sut.themeKey = "LabelTheme1"

        // Then
        XCTAssertEqual(sut.backgroundColor, UIColor(hexString:"#FFFFFF"))
        XCTAssertEqual(sut.textColor, UIColor(hexString:"#00000"))
    }
}

extension XCTestCase {
    func setupAppThemeManager(themesJSONFileName: String = "testThemeFile") {
        AppHereThemeManager.setup(bundle: Bundle.module, themesJSONFileName: themesJSONFileName)
    }
}
