//
//  internals.swift
//  Simply Write
//
//  Created by Adam Short on 28/12/16.
//  Copyright © 2016 Adam Short. All rights reserved.
//

import UIKit



func activateButton(ref: UIButton) {
   ref.setTitleColor(UIColor.white, for: .normal)
}

func deactivateButton(ref: UIButton) {
   let grey = UIColor(red: 97 / 255.0 , green: 95 / 255.0 , blue: 96 / 255.0, alpha: 1)
   ref.setTitleColor(grey, for: .normal)
}

func activateLabel(ref: UILabel) {
   ref.textColor = UIColor.white
}

func deactivateLabel(ref: UILabel) {
   ref.textColor = UIColor(red: 97 / 255.0 , green: 95 / 255.0 , blue: 96 / 255.0, alpha: 1)
}



//Handling Streak Functionality
var streak: Int = 0

var goalAchievedToday = false

func getDay(date: Date = Date()) -> Int {
   let currentCal = Calendar.current
   return currentCal.component(.day, from: date)
   
}


func getMonth(date: Date = Date()) -> Int {
   let currentCal = Calendar.current
   return currentCal.component(.month, from: date)
}

func getComparisonParameters(date: Date = Date()) -> (day: Int, month: Int) {
   return (getDay(date: date), getMonth(date: date))
}


func isANewDay(old: Date) -> Bool {
   let lastTime = getComparisonParameters(date: old)
   let currentTime = getComparisonParameters()
   
   return lastTime.day < currentTime.day || lastTime.month < currentTime.month
}


// Random Array Selector 

func randomIndex<T>(forArray: Array<T>) -> Int {
   let bound = UInt32(forArray.count)
   let index: UInt32 = arc4random_uniform(bound)
   return Int(index)
}

func randomItem<T>(inArray: Array<T>) -> T {
   let rIndex = randomIndex(forArray: inArray)
   
   return inArray[rIndex]
}


// Templater

func process(_ input: String, values: [String:Int]) -> String {
   var newStr = input
   for (key,value) in values {
      newStr = input.replacingOccurrences(of: "#"+key, with: "\(value)")
   }
   return newStr
}



