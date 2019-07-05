//
//  Ext+UIButton.swift
//  BullsEye
//
//  Created by Anantha Krishnan K G on 05/07/19.
//  Copyright © 2019 Ananth. All rights reserved.
//

import Foundation
import UIKit

extension UIButton {
    
    func animate() {
        
        UIView.animateKeyframes(withDuration: 0.5, delay: 0, options: .calculationModeCubic, animations: {
            
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.1, animations: {
                 self.transform = CGAffineTransform(rotationAngle:.pi/18)
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.1, relativeDuration: 0.1, animations: {
                self.transform = CGAffineTransform(rotationAngle:-.pi/18)
            })
            UIView.addKeyframe(withRelativeStartTime: 0.2, relativeDuration: 0.1, animations: {
                self.transform = CGAffineTransform(rotationAngle:.pi/18)
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.3, relativeDuration: 0.1, animations: {
                self.transform = CGAffineTransform(rotationAngle:-.pi/18)
            })
            UIView.addKeyframe(withRelativeStartTime: 0.4, relativeDuration: 0.1, animations: {
                self.transform = .identity
            })
        })
    }
}
