//
//  MainTabBarController.swift
//  FocusFarm
//
//  Created by Jacob Martinage on 11/12/23.
//

import UIKit

import UIKit

class MainTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()

        // Setup your view controllers
        let timerViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TimerViewController") as! TimerViewController
        let farmViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "FarmViewController") as! FarmViewController

        // Set the delegate for TimerViewController
        timerViewController.delegate = farmViewController

        // Set the view controllers for the tab bar
        self.viewControllers = [farmViewController, timerViewController]
    }
}
