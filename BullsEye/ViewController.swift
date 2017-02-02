//
//  ViewController.swift
//  BullsEye
//
//  Created by Yixin Xue on 1/28/17.
//  Copyright © 2017 Yixin Xue. All rights reserved.
//

import UIKit
import QuartzCore

class ViewController: UIViewController {
    
    var currentValue = 0
    var targetValue = 0
    var score = 0
    var round = 0
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let thumbImageNormal = UIImage(named: "SliderThumb-Normal")
        slider.setThumbImage(thumbImageNormal, for: .normal)
        
        let thumbImagehighlighted = UIImage(named: "SliderThumb-Highlighted")
        slider.setThumbImage(thumbImagehighlighted, for: .highlighted)
        
        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        
        if let trackLeftTmage = UIImage(named: "SliderTrackLeft"){
            let trackLeftResizable = trackLeftTmage.resizableImage(withCapInsets: insets)
            slider.setMinimumTrackImage(trackLeftResizable, for: .normal)
        }
        if let trackRightImage = UIImage(named: "SliderTrackRight"){
            let trackRightResizable = trackRightImage.resizableImage(withCapInsets: insets)
            slider.setMaximumTrackImage(trackRightResizable, for: .normal)
        }
        startNewGame()
        updateLabels()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func showAlert() {
        let difference = abs(currentValue - targetValue)
        let point = 100 - difference
        score += point

        let message = "The value of the slider is:\(currentValue)"
                    + "\nThe target value is: \(targetValue)"
                    + "\nThe difference is: \(difference)"
                    + "\nThe score is: \(point)"
        let alert = UIAlertController(title: "Hello, World",
                                      message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default,
                                   handler: { action in
                                                self.startNewRound()
                                                self.updateLabels()
                                            })
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func sliderMoved(slider: UISlider){
        currentValue = lroundf(slider.value)
        print(currentValue)
    }
    
    func startNewGame(){
        round = 0
        score = 0
        startNewRound()
    }
    
    func startNewRound(){
        targetValue = 1 + Int(arc4random_uniform(100))
        currentValue = 50
        slider.value = Float(currentValue)
        round += 1
    }
    
    func updateLabels(){
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
    }
    
    @IBAction func startOver(){
        startNewGame()
        updateLabels()
        
        let transition = CATransition()
        transition.type = kCATransitionFade
        transition.duration = 1
        transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
        
        view.layer.add(transition, forKey: nil)
    }
    
}

