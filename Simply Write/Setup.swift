//
//  Setup.swift
//  Simply Write
//
//  Created by Adam Short on 30/12/16.
//  Copyright © 2016 Adam Short. All rights reserved.
//

import UIKit


class Setup: UIViewController {
   
   var wordGoal: Int = 0
   var sub: Double = 0.0
   
   override func viewDidLoad() {
      
   }
   
   @IBOutlet weak var word200: UIButton!
   @IBOutlet weak var word350: UIButton!
   @IBOutlet weak var word500: UIButton!
   @IBOutlet weak var word750: UIButton!
   @IBOutlet weak var word900: UIButton!
   @IBOutlet weak var word1200: UIButton!
   
   func activateButton(ref: UIButton) {
      print("working")
      ref.setTitleColor(UIColor.black, for: .normal)
   }
   
   func deactivateButton(ref: UIButton) {
      let grey = UIColor(red: 226 / 255.0 , green: 226 / 255.0 , blue: 226 / 255.0, alpha: 1)
      ref.setTitleColor(grey, for: .normal)
   }
   
   
   func activateLabel(ref: UILabel) {
      ref.textColor = UIColor.black
   }
   
   func deactivateLabel(ref: UILabel) {
      ref.textColor =  UIColor(red: 226 / 255.0 , green: 226 / 255.0 , blue: 226 / 255.0, alpha: 1)
   }
   
   func selectGoal(newReference: UIButton!) {
      
      deactivateButton(ref: word200)
      deactivateButton(ref: word500)
      deactivateButton(ref: word350)
      deactivateButton(ref: word750)
      deactivateButton(ref: word900)
      deactivateButton(ref: word1200)
      
      activateButton(ref: newReference)
      
   }
   
   func selectSub(newReference: UIButton!, label: UILabel) {
      deactivateButton(ref: cost099)
      deactivateButton(ref: cost199)
      deactivateButton(ref: cost299)
      
      deactivateLabel(ref: mo12)
      deactivateLabel(ref: mo6)
      deactivateLabel(ref: mo1)
      
      activateButton(ref: newReference)
      activateLabel(ref: label)
   }
   
   
   
   @IBAction func word200(_ sender: Any) {
      wordGoal = 200
      selectGoal(newReference: word200)
   }
   
   @IBAction func word350(_ sender: Any) {
      wordGoal = 350
      selectGoal(newReference: word350)
   }
   
   @IBAction func word500(_ sender: Any) {
      wordGoal = 500
      selectGoal(newReference: word500)
   }
   
   @IBAction func word750(_ sender: Any) {
      wordGoal = 750
      selectGoal(newReference: word750)
   }
   
   @IBAction func word900(_ sender: Any) {
      wordGoal = 900
      selectGoal(newReference: word900)
   }
   
   @IBAction func word1200(_ sender: Any) {
      wordGoal = 1200
      selectGoal(newReference: word1200)
   }
   
   @IBOutlet weak var cost099: UIButton!
   @IBOutlet weak var cost199: UIButton!
   @IBOutlet weak var cost299: UIButton!
   
   @IBOutlet weak var mo12: UILabel!
   @IBOutlet weak var mo6: UILabel!
   @IBOutlet weak var mo1: UILabel!
   
   
   
   @IBAction func cost099(_ sender: Any) {
      sub = 0.99
      selectSub(newReference: cost099, label: mo12)
   }
   
   @IBAction func cost199(_ sender: Any) {
      sub = 1.99
      selectSub(newReference: cost199, label: mo6)
   }
   
   @IBAction func cost299(_ sender: Any) {
      sub = 2.99
      selectSub(newReference: cost299, label: mo1)
   }
   
   // Segue Data
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      storedData.set(wordGoal, forKey: "wordGoal")
      storedData.set(sub, forKey: "currentSub")
   }
   
   
   
}







