//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let numbersDic = ["Soft": 4, "Medium": 5, "Hard": 6]
    var counter = 60
    var timer = Timer()
    var totalTime = 0
    var secondsPassed = 0
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
  


    @IBAction func eggButtonPressed(_ sender: UIButton) {
        let hardness = sender.currentTitle!
        progressBar.progress = 0.0
        secondsPassed = 0
        titleLabel.text = hardness
        timer.invalidate()
        counter = numbersDic[hardness]!
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
        progressBar.progress = 100
        
    }
   
    
   
    
    @objc func updateCounter() {
        //example functionality
        if secondsPassed < totalTime  {
            let percentageProgress = Float(secondsPassed)/Float(totalTime)
            progressBar.progress = Float(percentageProgress)
            secondsPassed += 1
        } else if (counter == 0){
            titleLabel.text = "Done"
        }
    }
 
}
