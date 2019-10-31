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
    
    
    var arrayOfColorValues = [CGFloat]()
    var red = CGFloat.random(in: 0.0...1.0)
    var green = CGFloat.random(in: 0.0...1.0)
    var blue = CGFloat.random(in: 0.0...1.0)
    var score = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
     arrayOfColorValues = [red,green,blue]
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
    
    func updateColor() {
          color.backgroundColor = .init(red: arrayOfColorValues[0], green: arrayOfColorValues[1], blue: arrayOfColorValues[2], alpha: 1)
    }
    
    func colorMax() -> CGFloat {
        let colorMax = arrayOfColorValues.max() ?? 1.0
        return colorMax
    }
    
    func rightOrWrong(float: CGFloat, button: CGFloat) {
        if float == button {
            print("That is correct")
            score += 1
            
            
        } else {
            print("buzz! Wrong")
        }
    }
    

}

