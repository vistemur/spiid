//
//  Skin.swift
//  spiid
//
//  Created by роман поздняков on 30/03/2019.
//  Copyright © 2019 romchick. All rights reserved.
//

import UIKit

enum Skin: String, CaseIterable {
    case casual
    case roma
    case roma1
    case colpac
    
    func getSkinImage() -> UIImage? {
        let imageName = rawValue + "Skin"
        return UIImage(named: imageName)
    }
}
