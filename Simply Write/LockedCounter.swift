//
// PROFILE SCREEN
//
//  ViewController.swift
//  Simply Write
//
//  Created by Adam Short on 24/12/16.
//  Copyright © 2016 Adam Short. All rights reserved.
//

import UIKit

let storedData = UserDefaults.standard


class LockedCounter: UIViewController {
   var streak = storedData.integer(forKey: "streak")
   
   override func viewDidLoad() {
      print("Loaded Locked Screen")
      goalLabel.text = "\(storedData.integer(forKey: "wordGoal"))"
      streakCounter.text = "\(storedData.integer(forKey: "streak")) DAY STREAK"
   }

   
   @IBOutlet weak var streakCounter: UILabel!
   @IBOutlet weak var goalLabel: UILabel!
   
   
   @IBOutlet weak var completeButton: UIButton!
   
   @IBAction func completeGoal(_ sender: Any) {
      print("Calling button")
      self.completeButton.backgroundColor = UIColor(red: 86 / 255.0, green: 150 / 255.0, blue: 220 / 255.0, alpha: 1)
      completeButton.layer.cornerRadius = 12
      UIView.animate(withDuration: 0.3, animations: {
         self.completeButton.transform = CGAffineTransform(scaleX: 8, y: 15)
         self.completeButton.layer.cornerRadius = 20
      }, completion: { (Bool) -> () in
         storedData.setValue(true, forKey: "goalAchievedToday")
         storedData.setValue(self.streak + 1, forKey: "streak")
         self.performSegue(withIdentifier: "toMotivational", sender: nil)
      })
   }
}

