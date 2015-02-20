//
//  ViewController.swift
//  99 Red Ballons
//
//  Created by Andrew Bell on 2/20/15.
//  Copyright (c) 2015 FiixedMobile. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var numberOfBalloonsLabel: UILabel!
    
    @IBOutlet weak var balloonImage: UIImageView!
    
    var Balloons:[Balloon] = []
    
    var currentIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.createBalloons()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func createBalloons() {
        
        for var i = 1; i <= 99; i++ {
            var newBalloon = Balloon()
            newBalloon.number = i
            
            let randomNumber = Int(arc4random_uniform(UInt32(4)))
            switch randomNumber {
            case 1:
                newBalloon.image = UIImage(named: "RedBalloon1.jpg")
            case 2:
                newBalloon.image = UIImage(named: "RedBalloon2.jpg")
            case 3:
                newBalloon.image = UIImage(named: "RedBalloon3.jpg")
            default:
                newBalloon.image = UIImage(named: "RedBalloon4.jpg")
            }
            self.Balloons.append(newBalloon)
        }
        
    }
    
    @IBAction func nextBalloon(sender: UIBarButtonItem) {
        
        let balloon = self.Balloons[currentIndex]
        self.numberOfBalloonsLabel.text = "\(balloon.number) balloons"
        self.balloonImage.image = balloon.image
        if currentIndex == 98 {
            currentIndex = 0
        } else {
            currentIndex++
        }
        
        
    }
    
}

