//
//  AppSettings.swift
//  spiid
//
//  Created by роман поздняков on 01/04/2019.
//  Copyright © 2019 romchick. All rights reserved.
//

import Foundation

final class AppSettings {
    
    // MARK: - UserDefaults keys
    private static let currentSkinKey = "currentSkin"
    
    static var currentSkin: Skin = .casual
    
    static func getSettings() {
        if let currentSkinName = UserDefaults.standard.string(forKey: currentSkinKey),
            let currentSkin = Skin(rawValue: currentSkinName) {
            AppSettings.currentSkin = currentSkin
        }
    }
    
    static func updateSkin(skin: Skin) {
        UserDefaults.standard.set(skin.rawValue, forKey: currentSkinKey)
        AppSettings.currentSkin = skin
    }
}
