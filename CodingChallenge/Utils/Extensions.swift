//
//  Extensions.swift
//  CodingChallenge
//
//  Created by Hesham Donia on 18/02/2022.
//

import UIKit

extension UIView {
    
    @IBInspectable var cornerRadius: CGFloat {
        get { return layer.cornerRadius}
        set { layer.cornerRadius =  newValue
            layer.masksToBounds = newValue > 0}
    }
}
