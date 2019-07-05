//
//  Ext+Anchors.swift
//  BullsEye
//
//  Created by Anantha Krishnan K G on 05/07/19.
//  Copyright © 2019 Ananth. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    func pinEdgesToSuperview(_ offset: CGFloat = 0.0) {
        guard let superview = self.superview else {
            return
        }
        self.leftAnchor.constraint(equalTo: superview.leftAnchor, constant: offset).isActive = true
        self.rightAnchor.constraint(equalTo: superview.rightAnchor, constant: offset).isActive = true
        self.bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: offset).isActive = true
        self.topAnchor.constraint(equalTo: superview.topAnchor, constant: offset).isActive = true
    }
    
    @discardableResult
    func constraintWidth(_ toConstant: CGFloat) -> NSLayoutConstraint? {
        let constraint = self.widthAnchor.constraint(equalToConstant: toConstant)
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult
    func constraintHeight(_ toConstant: CGFloat) -> NSLayoutConstraint? {
        let constraint = self.heightAnchor.constraint(equalToConstant: toConstant)
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult
    func centerVertically(_ offset: CGFloat = 0.0) -> NSLayoutConstraint? {
        guard let superview = self.superview else {
            return nil
        }
        
        let constraint = self.centerYAnchor.constraint(equalTo: superview.centerYAnchor, constant: offset)
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult
    func centerHorizontally(_ offset: CGFloat = 0.0) -> NSLayoutConstraint? {
        guard let superview = self.superview else {
            return nil
        }
        let constraint = self.centerXAnchor.constraint(equalTo: superview.centerXAnchor, constant: offset)
        constraint.isActive = true
        return constraint
        
    }
    
}
