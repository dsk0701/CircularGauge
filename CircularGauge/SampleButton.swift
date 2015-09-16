//
//  SampleButton.swift
//  CircularGauge
//
//  Created by Daisuke Shiraishi on 2015/09/16.
//  Copyright (c) 2015年 Peace. All rights reserved.
//

import UIKit

@IBDesignable
class SampleButton: UIButton {

    @IBInspectable var radius: CGFloat = 1.0 {
        didSet {
            self.layer.cornerRadius = radius
        }
    }
}
