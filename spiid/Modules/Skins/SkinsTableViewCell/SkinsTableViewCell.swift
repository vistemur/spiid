//
//  SkinsTableViewCell.swift
//  spiid
//
//  Created by роман поздняков on 30/03/2019.
//  Copyright © 2019 romchick. All rights reserved.
//

import UIKit

final class SkinsTableViewCell: UITableViewCell {

    static let reuseId = "SkinsTableViewCell"
    
    @IBOutlet private weak var skinImageView: UIImageView!
    
    func updateContent(skin: Skin) {
        skinImageView.image = skin.getSkinImage()
    }
}
