//
//  LockedCounter.swift
//  Simply Write
//
//  Created by Adam Short on 28/12/16.
//  Copyright © 2016 Adam Short. All rights reserved.
//

import UIKit


class Manage: UIViewController {
    
   
   var wordGoal: Int = storedData.integer(forKey: "wordGoal")
   
   var currentSubscription: Double = storedData.double(forKey: "currentSubscription")
   
   
   override func viewDidLoad() {
      super.viewDidLoad()
      // Do any additional setup after loading the view, typically from a nib.
      
      switch (currentSubscription) {
      case 0.0:
         break
      case 0.99:
         activateButton(ref: cost099)
         activateLabel(ref: mo12)
      case 1.99:
         activateButton(ref: cost199)
         activateLabel(ref: mo6)
      case 2.99:
         activateButton(ref: cost299)
         activateLabel(ref: mo1)
      default:
         print("currentSubscription value is set incorrectly.")
         break
      }
      
      switch (wordGoal) {
      case 200:
         activateButton(ref: words200)
      case 350:
         activateButton(ref: words350)
      case 500:
         activateButton(ref: words500)
      case 750:
         activateButton(ref: words750)
      case 900:
         activateButton(ref: words900)
      case 1200:
         activateButton(ref: words1200)
      default:
         print("wordGoal value is set incorrectly")
         break
      }
   }
   
   
   override func didReceiveMemoryWarning() {
      super.didReceiveMemoryWarning()
      // Dispose of any resources that can be recreated.
   }
   
   func selectGoal(newReference: UIButton!) {
      
      deactivateButton(ref: words200)
      deactivateButton(ref: words500)
      deactivateButton(ref: words350)
      deactivateButton(ref: words750)
      deactivateButton(ref: words900)
      deactivateButton(ref: words1200)
      
      activateButton(ref: newReference)
      
   }
   
   func selectSub(newReference: UIButton!, newLabel: UILabel!) {
      deactivateButton(ref: cost099)
      deactivateLabel(ref: mo12)
      
      deactivateButton(ref: cost199)
      deactivateLabel(ref: mo6)
      
      deactivateButton(ref: cost299)
      deactivateLabel(ref: mo1)
      
      activateButton(ref: newReference)
      activateLabel(ref: newLabel)
   }
   
   
   //Word Goal Buttons
   
   @IBOutlet weak var words200: UIButton!
   @IBOutlet weak var words350: UIButton!
   @IBOutlet weak var words500: UIButton!
   @IBOutlet weak var words750: UIButton!
   @IBOutlet weak var words900: UIButton!
   @IBOutlet weak var words1200: UIButton!
   
   
   
   @IBAction func words200(_ sender: Any) {
      wordGoal = 200
      selectGoal(newReference: words200)
   }
   
   @IBAction func words350(_ sender: Any) {
      wordGoal = 350
      selectGoal(newReference: words350)
   }
   
   @IBAction func words500(_ sender: Any) {
      wordGoal = 500
      selectGoal(newReference: words500)
   }
   
   
   @IBAction func words750(_ sender: Any) {
      wordGoal = 750
      selectGoal(newReference: words750)
   }
   
   @IBAction func words900(_ sender: Any) {
      wordGoal = 900
      selectGoal(newReference: words900)
   }
   
   @IBAction func words1200(_ sender: Any) {
      wordGoal = 1200
      selectGoal(newReference: words1200)
   }
   
   
   //Subscription Buttons
   @IBOutlet weak var cost099: UIButton!
   @IBOutlet weak var cost199: UIButton!
   @IBOutlet weak var cost299: UIButton!
   
   @IBOutlet weak var mo12: UILabel!
   @IBOutlet weak var mo6: UILabel!
   @IBOutlet weak var mo1: UILabel!
   
   
   
   
   @IBAction func cost099(_ sender: Any) {
      currentSubscription = 0.99
      selectSub(newReference: cost099, newLabel: mo12)
      
   }
   
   @IBAction func cost199(_ sender: Any) {
      currentSubscription = 1.99
      selectSub(newReference: cost199, newLabel: mo6)
   }
   
   @IBAction func cost299(_ sender: Any) {
      currentSubscription = 2.99
      selectSub(newReference: cost299, newLabel: mo1)
   }
   
   
   // Closing Button
   
   @IBAction func closeScreen(_ sender: Any) {
      
      
   }
   
   
   
   // Segue Data
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      storedData.set(wordGoal, forKey: "wordGoal")
      storedData.set(currentSubscription, forKey: "current")
   }

   
}
