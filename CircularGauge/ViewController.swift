//
//  ViewController.swift
//  CircularGauge
//
//  Created by Daisuke Shiraishi on 2015/09/13.
//  Copyright (c) 2015年 Peace. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        let redView = UIView(frame: CGRectMake(0, 0, 100, 100))
        redView.backgroundColor = UIColor.redColor()
        redView.center = self.view.center
        // self.view.addSubview(redView)
        
        let cgView = CircularGaugeView(frame: CGRectMake(0, 0, 100, 100))
        cgView.center = self.view.center
        cgView.percentage = 0.8
        cgView.drawCircle()
        self.view.addSubview(cgView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

