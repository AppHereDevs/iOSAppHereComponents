//
//  File.swift
//  
//
//  Created by Arda Onat on 24.12.2021.
//

import Foundation

public class AppHereThemeManager {
    
    // MARK: Singleton
    public static let shared = AppHereThemeManager()
    
    private static var themeJSONData: Data?
    private static var themes: NSDictionary = [:]
    
    public class func setup(bundle: Bundle = Bundle.main, themesJSONFileName: String) {
        guard let path = bundle.path(forResource: themesJSONFileName, ofType: "json"),
              let themeJSONData = try? Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe) else {
                  fatalError("Error - theme json file could not be found.")
              }
        
        AppHereThemeManager.themeJSONData = themeJSONData
        AppHereThemeManager.shared.prepareThemes()
    }
    
    private init () {
        guard AppHereThemeManager.themeJSONData != nil else {
            fatalError("Error - you must call setup function with a valid JSON file name before accessing AppHereThemeManager.shared.")
        }
    }
    
    private func prepareThemes() {
        guard let themeJSONData = AppHereThemeManager.themeJSONData,
              let themeJSON = try? JSONSerialization.jsonObject(with: themeJSONData, options: []) as? [String: Any],
              let themeDict = themeJSON["themes"] as? [String: Any],
              let componentDict = themeDict["components"] as? [[String: Any]] else {
                  return
              }
        
        let componentThemes = NSMutableDictionary()
        for component in componentDict {
            if let themeItemkey = component["key"] as? String {
                componentThemes.addEntries(from: [themeItemkey: component])
            }
        }
        
        AppHereThemeManager.themes = componentThemes
    }
    
    public func getTheme(byKey key: String) -> NSDictionary? {
        return (AppHereThemeManager.themes.value(forKey:  key) as? NSDictionary)
    }
}
