// TimerViewController.swift

import UIKit
import AVFoundation

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
        if i == 1 {
            newImage = UIImage(named: "StageOne")!
        }
        
        if i == 2 {
            newImage = UIImage(named:"StageTwo")!
        }
        
        if i == 3 {
            newImage = UIImage(named: "StageThree")!
        }
        
        if i == 4 {
            newImage = UIImage(named: "StageFour")!
        }
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
        else if initialTime/3 > seconds {
            updateEggImage(i: 3)
        }
        else if initialTime/2 > seconds {
            updateEggImage(i: 2)
        }
        else if (initialTime/2+initialTime/4) > seconds {
            updateEggImage(i: 1)
        }
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
        isTimerRunning = false
        timerSlider.isUserInteractionEnabled = true
        seconds = Int(timerSlider.value * 60)
        updateEggImage(i:0)
        timerLabel.text = timeString(time: Double(timerSlider.value) * 60)
        let newAnimal = Animal.randomAnimal()
        delegate?.timerDidCompleteWithNewAnimal(newAnimal)
        // Show alert
        showAlert()
        print("alart should have been shown")

        // Play sound
        playSound()
        
    }
    
    private func showAlert() {
        let alertController = UIAlertController(title: "New Animal!",
                                                message: "You've got a new animal!",
                                                preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
                // Stop the sound when OK is pressed
            self.stopSound()
            }
        alertController.addAction(okAction)
        
        present(alertController, animated: true, completion: nil)
        
    }
    var audioPlayer: AVAudioPlayer?
    
    // Play sound method
    private func playSound() {
        guard let soundURL = Bundle.main.url(forResource: "alarm", withExtension: "mp3") else {
                print("Error: Sound file not found")
                return
            }

        do {
            audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
            audioPlayer?.play()
        } catch {
            print("Error playing sound: \(error.localizedDescription)")
        }
    }
    
    private func stopSound() {
        audioPlayer?.stop()
        audioPlayer = nil // Release the audio player to free up resources
    }
    
}
