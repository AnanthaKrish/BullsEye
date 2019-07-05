//
//  Ext+UIColor.swift
//  BullsEye
//
//  Created by Anantha Krishnan K G on 05/07/19.
//  Copyright © 2019 Ananth. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    
    /**
     Convert hex string to UIcolor
     - Parameter hexFromString : A string value in hex format `#FFFFFFF`
     - Parameter alpha : and optional alpha value for the color. Default is 1.
     */
    convenience init(hexFromString:String, alpha:CGFloat = 1.0) {
        var cString:String = hexFromString.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        var rgbValue:UInt32 = 10066329
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.count) == 6) {
            Scanner(string: cString).scanHexInt32(&rgbValue)
        }
        
        self.init(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: alpha
        )
    }
}
