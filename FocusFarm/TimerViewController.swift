// TimerViewController.swift

import UIKit

protocol TimerViewControllerDelegate: AnyObject {
    func timerDidCompleteWithNewAnimal(_ newAnimal: Animal)
}

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
    
    weak var delegate: TimerViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        print(timerSlider.value)
        seconds = Int(60 * timerSlider.value)
        timerLabel.text = timeString(time: TimeInterval(seconds))
    }
    
    func updateEggImage(i: Int) {
        var newImage = UIImage()
        if i == 0 {
            newImage = UIImage(named: "fullEgg")!
        }
        // ... your existing code ...
        eggImage.image = newImage
    }
    
    func runTimer() {
        initialTime = seconds
        timerSlider.isUserInteractionEnabled = false
        isTimerRunning = true
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        seconds -= 1
        timerLabel.text = timeString(time: TimeInterval(seconds))
        
        if seconds <= 0 {
            timer.invalidate()
            timerOver()
        }
        
        if initialTime/4 > seconds {
            updateEggImage(i: 4)
        }
        // ... your existing code ...
    }
    
    @IBAction func sliderChanged(_ sender: Any) {
        if !isTimerRunning {
            seconds = Int(60 * timerSlider.value)
            timerLabel.text = timeString(time: TimeInterval(seconds))
        }
    }
    
    @IBAction func startButtonTapped(_ sender: Any) {
        if !isTimerRunning {
            runTimer()
        }
    }
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        isTimerRunning = false
        timerSlider.isUserInteractionEnabled = true
        updateEggImage(i: 0)
        timer.invalidate()
        seconds = Int(60 * timerSlider.value)
        timerLabel.text = timeString(time: TimeInterval(seconds))
    }
    
    func timeString(time: TimeInterval) -> String {
        let hours = Int(time) / 3600
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        return String(format: "%02i:%02i:%02i", hours, minutes, seconds)
    }
    
    func timerOver() {
        print("timer ended")
        let newAnimal = Animal.randomAnimal()
        delegate?.timerDidCompleteWithNewAnimal(newAnimal)
    }
}
