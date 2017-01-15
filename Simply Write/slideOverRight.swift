//
//  slideOverRight.swift
//  Simply Write
//
//  Created by Adam Short on 6/1/17.
//  Copyright © 2017 Adam Short. All rights reserved.
//

import UIKit

class transitionFromRight: UIStoryboardSegue {
   
   override func perform() {
      
      let src = self.source
      let dst = self.destination
      let transition: CATransition = CATransition()
      let timeFunc : CAMediaTimingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
      transition.duration = 0.3
      transition.timingFunction = timeFunc
      transition.type = kCATransitionPush
      transition.subtype = kCATransitionFromRight
      
      src.view.window?.layer.add(transition, forKey: nil)
      src.present(dst, animated: false, completion: nil)
      
   }
   
   
}
