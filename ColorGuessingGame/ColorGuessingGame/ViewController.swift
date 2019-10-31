//
//  ViewController.swift
//  ColorGuessingGame
//
//  Created by Ian Bailey on 10/30/19.
//  Copyright © 2019 Ian Bailey. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var color: UIView!
    @IBOutlet weak var redButton: UIButton!
    @IBOutlet weak var greenButton: UIButton!
    @IBOutlet weak var blueButton: UIButton!
    @IBOutlet weak var currentScore: UILabel!
    @IBOutlet weak var highScore: UILabel!
    @IBOutlet weak var reset: UIButton!
    
    var arrayOfColorValues = [CGFloat]()
    var red = CGFloat.random(in: 0.0...1.0)
    var green = CGFloat.random(in: 0.0...1.0)
    var blue = CGFloat.random(in: 0.0...1.0)
    var score = 0
    var highscore = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateColor()
    }

    @IBAction func redIsHigher(_ sender: UIButton) {
        rightOrWrong(float: colorMax(), button: red)
        
    }
    
    @IBAction func greenIsHigher(_ sender: UIButton) {
        rightOrWrong(float: colorMax(), button: green)
        
    }
    
    @IBAction func blueIsHigher(_ sender: UIButton) {
        rightOrWrong(float: colorMax(), button: blue)
        
    }
    
    @IBAction func resetButton(_ sender: UIButton) {
        updateColor()
        restart()
        updateScore()
        updateHighScore()
    }
    
    func updateColor() {
        red = CGFloat.random(in: 0.0...1.0)
        green = CGFloat.random(in: 0.0...1.0)
        blue = CGFloat.random(in: 0.0...1.0)
        arrayOfColorValues = [red, green, blue]
          color.backgroundColor = .init(red: arrayOfColorValues[0], green: arrayOfColorValues[1], blue: arrayOfColorValues[2], alpha: 1)
    }
    
    func colorMax() -> CGFloat {
        let colorMax = arrayOfColorValues.max() ?? 1.0
        return colorMax
    }
    
    func rightOrWrong(float: CGFloat, button: CGFloat) {
        if float == button {
            score += 1
            arrayOfColorValues.removeAll()
            updateColor()
            updateHighScore()
            updateScore()
           
        } else {
            gameOver()
        }
    }
    
    func updateScore() {
        currentScore.text = "Current Score: \(score)"
    }
    
    func updateHighScore() {
        if score > highscore {
            highscore = score
            highScore.text = "High Score: \(highscore)"
        }
    }
    
    func gameOver() {
        redButton.isEnabled = false
        greenButton.isEnabled = false
        blueButton.isEnabled = false
    }
    
    func restart() {
        score = 0
        redButton.isEnabled = true
        greenButton.isEnabled = true
        blueButton.isEnabled = true
    }
}

