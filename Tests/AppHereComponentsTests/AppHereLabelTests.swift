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
        sut.themeKey = "AppHereLabel-NoValue"

        // Then
        XCTAssertNotNil(sut.themeDict)
        XCTAssertFalse(sut.isHidden)
    }

    func testLabelAppearanceWhenThemeDoesNotIncludeValues() {
        // Given
        setupAppThemeManager()
        let sut = AppHereLabel()

        // When
        sut.themeKey = "AppHereLabel-NoValue"

        // Then
        XCTAssertEqual(sut.backgroundColor, UIColor(hexString: AppHereLabelThemeModel.defaultBackgroundColor))
        XCTAssertEqual(sut.textColor, UIColor(hexString: AppHereLabelThemeModel.defaultTextColor))
    }

    func testLabelAppearanceWhenThemeIncludesValues() {
        // Given
        setupAppThemeManager()
        let sut = AppHereLabel()

        // When
        sut.themeKey = "AppHereLabel-Values"

        // Then
        XCTAssertEqual(sut.backgroundColor, UIColor(hexString: "#FFFFFF"))
        XCTAssertEqual(sut.textColor, UIColor(hexString: "#00000"))
    }
}

extension XCTestCase {
    func setupAppThemeManager(themesJSONFileName: String = "testThemeFile") {
        AppHereThemeManager.setup(bundle: Bundle.module, themesJSONFileName: themesJSONFileName)
    }
}
