//
//  CATransition.swift
//  SOPT_iOS_SEMINAR
//
//  Created by Minjoo Kim on 2023/05/02.
//

import UIKit

extension CATransition {
    func segueFromBottom() -> CATransition {
        duration = 0.375 //set the duration to whatever you'd like.
        timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        type = .moveIn
        subtype = .fromTop
        return self
    }
    
    func segueFromTop() -> CATransition {
        duration = 0.375 //set the duration to whatever you'd like.
        timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        type = .moveIn
        subtype = .fromBottom
        return self
    }
    
    func segueFromLeft() -> CATransition {
        duration = 0.1 //set the duration to whatever you'd like.
        timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        type = .moveIn
        subtype = .fromLeft
        return self
    }
    
    func popFromRight() -> CATransition {
        duration = 0.1 //set the duration to whatever you'd like.
        timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        type = .reveal
        subtype = .fromRight
        return self
    }
    
    func popFromLeft() -> CATransition {
        duration = 0.1 //set the duration to whatever you'd like.
        timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        type = .reveal
        subtype = .fromLeft
        return self
    }
}
