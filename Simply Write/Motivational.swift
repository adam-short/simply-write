//
//  LockedCounter.swift
//  Simply Write
//
//  Created by Adam Short on 28/12/16.
//  Copyright © 2016 Adam Short. All rights reserved.
//

import UIKit

class Motivational: UIViewController {
   
   @IBOutlet weak var streaklabel: UILabel!
   
   @IBOutlet weak var phraseHeader: UILabel!
   @IBOutlet weak var phraseBody: UILabel!
   
   let phraseHeaderPossibiliti = ["You did it!", "Check it off!"]
   let phraseBodyPossibilities = ["Congratulations! You’re #DYS days into an unstoppable achievement chain. At #WRDS words a day, that’s #TTAL words! Keep it up!"]
   
   
   //The pairs are in order of appearance - sequentially shown as a user progresses.
   let displayPairs: [(header: String, body: String)] = [
      ("The Start", "Today you began a journey towards a better you. The only way to get better at communication (in all of its forms) is through practise -  and the written word is the easiest. Let's see how long you can go!"),
      ("Bringing it back!", "Congratulations! The second day is always the hardest. It's easy to call it quits - but you didn't. Thankfully, for each day that you write, it gets easier to write the day after. Achievement chaining, baby!"),
      ("Congratulations!", "You may not feel like it, but you've already written #TTAL words in the last 3 days. Keep it rolling!")
   ]
   
   let currentStreak = storedData.integer(forKey: "streak")
   let wordGoal = storedData.integer(forKey: "wordGoal")
   
   override func viewDidLoad() {
      
      let userInformation = [
         "DYS" : currentStreak,
         "WRDS" : wordGoal,
         "TTAL" : currentStreak * wordGoal
      ]
      
      streaklabel.text = "\(currentStreak) DAY STREAK"
      phraseHeader.text = displayPairs[currentStreak == 0 ? 0 : currentStreak-1].header
      phraseBody.text = process(displayPairs[currentStreak == 0 ? 0 : currentStreak-1].body, values: userInformation)
      
   }
   
   override func didReceiveMemoryWarning() {
      
   }
   
   @IBOutlet weak var accidentButton: UIButton!
   @IBAction func cancelCompletion(_ sender: Any) {
      accidentButton.backgroundColor = UIColor.white
      UIView.animate(withDuration: 0.3, animations: {
         self.accidentButton.transform = CGAffineTransform(scaleX: 9, y: 40)
      }, completion: { (Bool) -> () in
         storedData.set(self.currentStreak-1, forKey: "streak")
         storedData.set(false, forKey: "goalAchievedToday")
         
         self.performSegue(withIdentifier: "rewindAccident", sender: nil)
      })
   }
   
   
   
}
