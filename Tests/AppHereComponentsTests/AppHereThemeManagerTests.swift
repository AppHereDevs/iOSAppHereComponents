import XCTest
@testable import AppHereComponents

final class AppHereThemeManagerTests: XCTestCase {
    func testDidAppHereThemeManagerSetupInitializedSharedInstance() {
        // When
        setupAppThemeManager()

        // Then
        XCTAssertNotNil(AppHereThemeManager.shared)
    }

    func testAppHereThemeManagerReturnsEmptyForNonExistingTheme() throws {
        // When
        setupAppThemeManager()

        // Then
        XCTAssertNil(AppHereThemeManager.shared.getTheme(byKey: "LabelTheme0"))
    }

    func testAppHereThemeManagerGetsThemeForExistingTheme() throws {
        // When
        setupAppThemeManager()
        let dict = try XCTUnwrap(AppHereThemeManager.shared.getTheme(byKey: "LabelTheme1"))
        let keyValue = try XCTUnwrap(dict.value(forKey: "key") as? String)

        // Then
        XCTAssertEqual(keyValue, "LabelTheme1")
    }
}
