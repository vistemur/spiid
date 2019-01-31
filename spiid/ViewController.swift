//
//  ViewController.swift
//  spiid
//
//  Created by роман поздняков on 01/02/2019.
//  Copyright © 2019 romchick. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func startButtunPressed(_ sender: UIButton) {
        sender.isHidden = true
        spawnPlayButton()
    }
    
    func spawnPlayButton() {
        let playButton = UIButton(frame: CGRect(x: Int.random(in: 1...325),
                                                y: Int.random(in: 1...600),
                                                width: 50,
                                                height: 50))
        playButton.setTitle("tap", for: .normal)
         playButton.backgroundColor = UIColor.red
        playButton.addTarget(self, action: #selector(playButtonAction), for: .touchUpInside)
        self.view.addSubview(playButton)
    }
    
    @objc func playButtonAction(sender: UIButton!) {
        sender.isHidden = true
        spawnPlayButton()
    }
}
