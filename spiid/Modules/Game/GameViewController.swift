//
//  GameViewController.swift
//  spiid
//
//  Created by роман поздняков on 30/03/2019.
//  Copyright © 2019 romchick. All rights reserved.
//

import UIKit

final class GameViewController: UIViewController {
    
    private var game = false
    private var score = 0
    private let xibFileName = "Game"
    private weak var timer: Timer?
    private var timeCounter = 0
    private let startTimerValue = 60
    private let endTimerValue = 0
    
    // MARK: - IBOutlets
    @IBOutlet private weak var timeLabel: UILabel!
    @IBOutlet private weak var scoreLabel: UILabel!
    @IBOutlet private weak var gameFieldView: UIView!
    
    // MARK: - Inits
    init() {
        super.init(nibName: xibFileName,
                   bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - ViewController lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initializeLabels()
        spawnPlayButton()
        
    }
    
    @IBAction private func backButtonPressed(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    private func initializeLabels() {
        scoreLabel.text = ""
        timeLabel.text = "tap to start"
    }
    
    // MARK: - StartButton
    func spawnPlayButton() {
        
        let height = gameFieldView.frame.height
        let width = gameFieldView.frame.width
        
        let playButton = UIButton(frame: CGRect(x: Int.random(in: 0...(Int(width) - 50)),
                                                y: Int.random(in: 0...(Int(height)) - 50),
                                                width: 50,
                                                height: 50))
        playButton.setImage(AppSettings.currentSkin.getSkinImage(), for: .normal)
        playButton.addTarget(self, action: #selector(playButtonAction), for: .touchUpInside)
        gameFieldView.addSubview(playButton)
    }
    
    // playButton is touched
    @objc func playButtonAction(sender: UIButton!) {
        if game {
            sender.removeFromSuperview()
                spawnPlayButton()
                score += 1
                scoreLabel.text = "\(score)"
        } else {
            initializeTimer()
            sender.removeFromSuperview()
            spawnPlayButton()
            score += 1
            scoreLabel.text = "\(score)"
            game = true
        }
    }
}

// MARK: - Timer
extension GameViewController {
    
    private func initializeTimer() {
        timer?.invalidate()
        timeCounter = startTimerValue
        updateTimerLabel()
        startTimer()
    }
    
    private func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1.0,
                                     target: self,
                                     selector: #selector(timerHandler),
                                     userInfo: nil,
                                     repeats: true)
        timer?.fire()
    }
    
    @objc private func timerHandler() {
        timeCounter -= 1
        if timeCounter > endTimerValue {
            updateTimerLabel()
        } else {
            timeCounter = 0
            game = false
            updateTimerLabel()
            timer?.invalidate()
            let highScore = UserDefaults.standard.integer(forKey: "ClassicalHighScore")
            if score > highScore {
                UserDefaults.standard.set(score, forKey: "ClassicalHighScore")
            }
            timeLabel.text = "your score \(score)"
            scoreLabel.text = ""
            timeLabel.textColor = .black
            score = 0
            //dismiss(animated: true)
        }
    }
    
    private func updateTimerLabel() {
        if timeCounter < 10 {
            timeLabel.textColor = .red
        } else {
            timeLabel.textColor = .black
        }
        
        let minutes = timeCounter / 60
        let seconds = timeCounter % 60
        let minutesText = String(minutes)
        let secondsText = seconds < 10 ? "0" + String(seconds) : String(seconds)
        timeLabel.text = minutesText + ":" + secondsText
    }
}
