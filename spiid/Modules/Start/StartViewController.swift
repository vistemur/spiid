//
//  StartViewController.swift
//  spiid
//
//  Created by роман поздняков on 30/03/2019.
//  Copyright © 2019 romchick. All rights reserved.
//

import UIKit

final class StartViewController: UIViewController {
    
    private let xibFileName = "Start"
    
    @IBOutlet private weak var highScoreLabel: UILabel!
    
    init() {
        super.init(nibName: xibFileName,
                   bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        let highScore = UserDefaults.standard.integer(forKey: "ClassicalHighScore")
        
        if highScore > 0 {
            highScoreLabel.text = "High score \(highScore)"
        } else {
            highScoreLabel.isHidden = true
        }
        
    }
    
    @IBAction private func startButtonPressed(_ sender: UIButton) {
        let gameVC = GameViewController()
        present(gameVC,
                animated: true)
    }
    
    @IBAction private func skinsButtonPressed(_ sender: UIButton) {
        let skinsVC = SkinsViewController()
        present(skinsVC,
                animated: true)
    }
}
