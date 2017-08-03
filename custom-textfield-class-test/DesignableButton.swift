//
//  DesignableButton.swift
//  GGolf
//
//  Created by Miguel Angel on 4/27/17.
//  Copyright © 2017 Thorcode. All rights reserved.
//

import UIKit

class DesignableButton: BounceButton {

    @IBInspectable var borderWidth: CGFloat = 0.0 {
        didSet {
            self.layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var borderColor: UIColor = UIColor.clear {
        didSet {
            self.layer.borderColor = borderColor.cgColor
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat = 0.0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
    
}
