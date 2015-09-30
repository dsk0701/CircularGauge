//
//  ViewController.swift
//  CircularGauge
//
//  Created by Daisuke Shiraishi on 2015/09/13.
//  Copyright (c) 2015年 Peace. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let cgView = CircularGaugeView()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)

        drawGaugeViews()
    }

    @IBAction func onTapDrawButton(sender: UIButton) {
        clearGaugeViews()
        drawGaugeViews()
    }

    private func clearGaugeViews() {

        for view in self.view.subviews {
            if view is CircularGaugeView {
                view.removeFromSuperview()
            }
        }
    }

    private func drawGaugeViews() {

        let frame = CGRectMake(0, 0, 80, 80)

        let cgv1 = CircularGaugeView(frame: frame)
        cgv1.center = CGPointMake(self.view.frame.width * 1 / 4, self.view.center.y)
        cgv1.percentage = 0.2222
        cgv1.lineColor = UIColor.orangeColor()
        cgv1.draw()
        self.view.addSubview(cgv1)

        let cgv2 = CircularGaugeView(frame: frame)
        cgv2.center = CGPointMake(self.view.frame.width * 2 / 4, self.view.center.y)
        cgv2.percentage = 0.55555
        cgv2.lineColor = UIColor.redColor()
        cgv2.draw()
        self.view.addSubview(cgv2)

        let cgv3 = CircularGaugeView(frame: frame)
        cgv3.center = CGPointMake(self.view.frame.width * 3 / 4, self.view.center.y)
        cgv3.percentage = 0.88888
        cgv3.lineColor = UIColor.purpleColor()
        cgv3.draw()
        self.view.addSubview(cgv3)
    }
}

