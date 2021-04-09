//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation
class ViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    var player: AVAudioPlayer?
    
    let numbersDic = ["Soft": 10, "Medium": 420, "Hard": 630]
    
    
    var timer = Timer()
    
    var totalTime = 0
    var secondsPassed = 0
 

    @IBAction func eggButtonPressed(_ sender: UIButton) {
        let hardness = sender.currentTitle!
        
        timer.invalidate()
        
        titleLabel.text = hardness
        
        progressBar.progress = 0.0
        secondsPassed = 0
        
        totalTime = numbersDic[hardness]!
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
    }
       
    
    @objc func updateCounter() {
        //example functionality
        if secondsPassed < totalTime  {
            secondsPassed += 1
        let percentageProgress = Float(secondsPassed)/Float(totalTime)
            progressBar.progress = Float(percentageProgress)
            
        } else {
            titleLabel.text = "Done"
            let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
                     player = try! AVAudioPlayer(contentsOf: url!)
            player!.play()
        }
    }
 
}
