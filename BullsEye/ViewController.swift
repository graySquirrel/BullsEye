//
//  ViewController.swift
//  BullsEye
//
//  Created by Fritz Ebner on 12/12/18.
//  Copyright © 2018 Fritz Ebner. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var currentValue: Int = 0
    var targetValue: Int = 0
    var totalScore: Int = 0
    var round = 0
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        resetGame()
        let thumbImageNormal = #imageLiteral(resourceName: "SliderThumb-Normal")
        slider.setThumbImage(thumbImageNormal, for: .normal)
        
        let thumbImageHighlighted = #imageLiteral(resourceName: "SliderThumb-Highlighted")
        slider.setThumbImage(thumbImageHighlighted, for: .highlighted)
        
        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        
        let trackLeftImage = #imageLiteral(resourceName: "SliderTrackLeft")
        let trackLeftResizable = trackLeftImage.resizableImage(withCapInsets: insets)
        slider.setMinimumTrackImage(trackLeftResizable, for: .normal)
        
        let trackRightImage = #imageLiteral(resourceName: "SliderTrackRight")
        let trackRightResizable = trackRightImage.resizableImage(withCapInsets: insets)
        slider.setMaximumTrackImage(trackRightResizable, for: .normal)

    }

    @IBAction func showAlert() {
        
        let diff = abs(currentValue-targetValue)
        
        var points = 100 - diff
        
        let title: String // can let if only set once
        let message: String
        
        if diff == 0 {
            title = "Perfect!"
            points += 100
        } else if diff == 1 {
            title = "Darn close!"
            points += 50
        } else if diff < 5 {
            title = "Pretty good."
        } else if diff < 10 {
            title = "Not bad, but you can do better."
        } else {
            title = "You're not even trying, are you?"
        }
        
        totalScore += points
        
        if diff == 0 {
            message = "You scored \(points) points"
        } else {
            message = "You were \(diff) off\nYou scored \(points) points"
        }
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Ok", style: .default, handler: {
            action in
            self.startNewRound()
        })
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
    }
    
    @IBAction func sliderMoved(_ slider: UISlider) {
        //print("slid is now: \(slider.value)")
        currentValue = Int(slider.value.rounded())
    }
    
    @IBAction func resetGame() {
        totalScore = 0
        round = 0
        startNewRound()
    }
    
    func startNewRound() {
        round += 1
        targetValue = Int.random(in: 1...100)
        currentValue = 50
        slider.value = Float(currentValue)
        updateLabels()
    }
    
    func updateLabels() {
        targetLabel.text = "\(targetValue)"
        scoreLabel.text = "\(totalScore)"
        roundsLabel.text = "\(round)"
    }
}

