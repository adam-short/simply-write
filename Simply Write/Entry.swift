//
//  LockedCounter.swift
//  Simply Write
//
//  Created by Adam Short on 28/12/16.
//  Copyright © 2016 Adam Short. All rights reserved.
//

import UIKit


class Entry: UIViewController {
   
   override func viewDidAppear(_ animated: Bool) {
      var lastTime: Date = Date()
      let goalAchievedToday = storedData.bool(forKey: "goalAchievedToday")
      
      print("Opened app.")

      if storedData.bool(forKey: "returning") == false  {
         performSegue(withIdentifier: "firstTime", sender: self)
         storedData.set(true, forKey: "returning")
      }
      // Get lastTime from NSUSerDefaults, if not there set to current time
      if let timeInDefaults = storedData.object(forKey: "lastTime") as? Date {
         lastTime = timeInDefaults
         print("Found lastTime in NSDefaults")
      } else {
         storedData.setValue(lastTime, forKey: "lastTime")
         print("Couldn't find lastTime in NSDefaults, initalising value.")
      }
      
      // If it's a new day
      if isANewDay(old: lastTime) {
         print("Today is a new day")
         if goalAchievedToday == false {
            print("Goal has not been achieved")
            storedData.set(0, forKey: "streak")
            storedData.set(Date(), forKey: "lastTime")
            // perform segue to locked counter
            performSegue(withIdentifier: "toLockedScreen", sender: self)
         } else {
            print("Goal has been achieved")
            storedData.set(Date(), forKey: "lastTime")
            storedData.set(false, forKey: "goalAchievedToday")
            performSegue(withIdentifier: "toLockedScreen", sender: self)
         }
      } else {
         print("Today is not a new day.")
         if goalAchievedToday {
            print("Goal has been achieved")
            // perform segue to motivational screen
            self.performSegue(withIdentifier: "toMotivationalScreen", sender: nil)
         } else {
            print("Goal has not been achieved")
            // perform segue to locked counter
            self.performSegue(withIdentifier: "toLockedScreen", sender: nil)
         }
      }
   }
   
   
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      if (segue.identifier == "toLockedScreen") {
         print("Seguing asap.")
      }
   }
   
   
}
