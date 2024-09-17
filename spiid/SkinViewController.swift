//
//  SkinViewController.swift
//  spiid
//
//  Created by роман поздняков on 25/02/2019.
//  Copyright © 2019 romchick. All rights reserved.
//

import UIKit

protocol BDelegate {
    func valueChanged(newValue: Int)
}

class SkinViewController: UIViewController {
    
    var currentSkin: BDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func snin0ButtonTouched(_ sender: UIButton) {
        currentSkin?.valueChanged(newValue: 0)
        UserDefaults.standard.set(0, forKey: "savedSkin")
    }
    
    @IBAction func skin1ButtonTouched(_ sender: UIButton) {
        currentSkin?.valueChanged(newValue: 1)
        UserDefaults.standard.set(1, forKey: "savedSkin")
    }
    
//    @IBAction func skin2ButtonTouched(_ sender: UIButton) {
//        currentSkin?.valueChanged(newValue: 2)
//    }
//
//    @IBAction func skin3ButtonTouched(_ sender: UIButton) {
//        currentSkin?.valueChanged(newValue: 3)
//    }
//
//    @IBAction func skin4ButtonTouched(_ sender: UIButton) {
//        currentSkin?.valueChanged(newValue: 4)
//    }
    
}

