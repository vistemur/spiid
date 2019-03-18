//
//  ViewController.swift
//  spiid
//
//  Created by роман поздняков on 01/02/2019.
//  Copyright © 2019 romchick. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
    
    var classicalHighScore = 0
    var savedSkin = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let x = UserDefaults.standard.object(forKey: "classicalHighScore") as? Int {
            classicalHighScore = x
        }
            
        classicalHighScoreLabel.text = "High score \(classicalHighScore)"
        classicalHighScoreLabel.transform = CGAffineTransform( rotationAngle: CGFloat((Double.pi ) / 3) )
        
        if let x = UserDefaults.standard.object(forKey: "savedSkin") as? Int {
            savedSkin = x
        } else {
            savedSkin = 0
        }
    }
    
    @IBOutlet weak var skinsButton: UIButton!
    @IBOutlet weak var startPlayButton: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var classicalHighScoreLabel: UILabel!
    
    public var classicalScore = 0
    public var game = false
    public var amountOfButtonsOnSreen = 0;
    
    // TODO: startButtonPressed
    @IBAction func startButtunPressed(_ sender: UIButton) {
        classicalScore = 0
        scoreLabel.isHidden = false
        classicalHighScoreLabel.isHidden = true
        sender.isHidden = true
        skinsButton.isHidden = true
        spawnPlayButton()
        game = true
        
        // timer
        let time = 60
        var timeCount = 0
        var timeTillTheEnd = time
        
        timeLabel.text = "\(timeTillTheEnd)"
        
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            timeCount += 1
            timeTillTheEnd -= 1
            self.timeLabel.text = "\(timeTillTheEnd)"
            
            ///timers end
            if timeCount == time {
                timer.invalidate()
                self.timeIsOut()
            }
        }
    }
    
    // ToDo: time is out
    func timeIsOut() {
        timeLabel.text = "your score \(classicalScore)"
        scoreLabel.isHidden = true
        startPlayButton.isHidden = false
        skinsButton.isHidden = false
        classicalHighScoreLabel.isHidden = false
        game = false
        if classicalScore > classicalHighScore {
            classicalHighScore = classicalScore
            UserDefaults.standard.set(classicalScore, forKey: "classicalHighScore")
            classicalHighScoreLabel.text = "New record \(classicalScore)"
        }
    }
    
    // TODO: spawn button (for game)
    func spawnPlayButton() {
        
        let height = self.view!.frame.height
        let width = self.view!.frame.width
        
        let playButton = UIButton(frame: CGRect(x: Int.random(in: 1...(Int(width) - 50)),
                                                y: Int.random(in: 5...(Int(height) - 50)),
                                                width: 50,
                                                height: 50))
        playButton.setTitle("tap", for: .normal)
        playButton.backgroundColor = UIColor.red
        playButton.addTarget(self, action: #selector(playButtonAction), for: .touchUpInside)
        self.view.addSubview(playButton)
        amountOfButtonsOnSreen += 1
    }
    
    // playButton is touched
    @objc func playButtonAction(sender: UIButton!) {
        if game {
            sender.removeFromSuperview()
            if amountOfButtonsOnSreen == 1 {
                spawnPlayButton()
                classicalScore += 1
                scoreLabel.text = "\(classicalScore)"
            }
        } else {
            sender.removeFromSuperview()
            game = false
        }
        amountOfButtonsOnSreen -= 1
    }
}

extension ViewController: BDelegate {
    func valueChanged(newValue: Int) {
        savedSkin = newValue
        UserDefaults.standard.set(savedSkin, forKey: "savedSkin")
        print(savedSkin)
    }
}
