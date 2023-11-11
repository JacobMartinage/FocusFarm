//
//  TimerViewController.swift
//  FocusFarm
//
//  Created by Jacob Martinage on 11/11/23.
//

import UIKit


class TimerViewController: UIViewController {

    var seconds = 60 * 15
    var timer = Timer()
    var isTimerRunning = false
    var initialTime = 60 * 15
    
    @IBOutlet weak var eggImage: UIImageView!
    
    @IBOutlet weak var timerLabel: UILabel!
    
    @IBOutlet weak var timerSlider: UISlider!
    @IBOutlet weak var startButton: UIButton!
    
    @IBOutlet weak var endButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(timerSlider.value)
        seconds = Int(60 * timerSlider.value)
        timerLabel.text = timeString(time: TimeInterval(seconds))
        

       
    }
    
    func updateEggImage(i:Int) {
        var newImage = UIImage()
        if(i == 0) {
            newImage = UIImage(named: "fullEgg")!
        }
        else if(i == 1) {
            newImage = UIImage(named: "StageOne")!
        }
        else if(i == 2) {
            newImage = UIImage(named: "StageTwo")!
        }
        else if(i == 3) {
            newImage = UIImage(named: "StageThree")!
        }
        else {
            newImage = UIImage(named: "StageFour")!
        }
            
        eggImage.image = newImage
        }
    
    
    
    func runTimer() {
        initialTime = seconds
        isTimerRunning = true;
         timer = Timer.scheduledTimer(timeInterval: 1, target: self,   selector: (#selector(TimerViewController.updateTimer)), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        seconds -= 1     // decrement the seconds.
        timerLabel.text = timeString(time: TimeInterval(seconds))
        
        if(initialTime/4 > seconds ) {
            updateEggImage(i: 4)
        }
        else if(initialTime/3 > seconds ) {
            updateEggImage(i: 3)
        }
        else if(initialTime/2 > seconds ) {
            updateEggImage(i: 2)
        }
        else if(initialTime - 90 > seconds ) {
            updateEggImage(i: 1)
        }
    }
    @IBAction func sliderChanged(_ sender: Any) {
        if(!isTimerRunning) {
            seconds=Int(60*timerSlider.value)
            timerLabel.text = timeString(time: TimeInterval(seconds))
        }
        
        
    }
    @IBAction func startButtonTapped(_ sender: Any) {
        if(!isTimerRunning) {
            runTimer()
        }
       
    }
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        isTimerRunning = false
        updateEggImage(i: 0)
        timer.invalidate()
        seconds = Int(60*timerSlider.value)
        timerLabel.text = timeString(time: TimeInterval(seconds))
    }
    
    func timeString(time: TimeInterval) -> String {
        let hours = Int(time) / 3600
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        return String(format: "%02i:%02i:%02i", hours, minutes, seconds)
    }
    
    
    
    



}
