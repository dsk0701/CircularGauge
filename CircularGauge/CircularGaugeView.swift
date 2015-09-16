//
//  CircularGaugeView.swift
//  CircularGauge
//
//  Created by Daisuke Shiraishi on 2015/09/13.
//  Copyright (c) 2015年 Peace. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class CircularGaugeView: UIView {
    
    var lineWidth: CGFloat = 5.0
    var lineColor: UIColor = UIColor.orangeColor()
    var fillColor: UIColor = UIColor.clearColor()
    var percentage = 1.0    // 0 〜 1
    var label: UILabel = UILabel()
    var timer: NSTimer?

    private let percentageFormat = "%.0f%%"
    private var circle: CAShapeLayer = CAShapeLayer()
    private var animation: CABasicAnimation?
    private var progress = 0.01

    override func animationDidStart(anim: CAAnimation!) {

        timer = NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: "updateLabel", userInfo: nil, repeats: true)
    }

    override func animationDidStop(anim: CAAnimation!, finished flag: Bool) {
        timer?.invalidate()
        drawLabel(percentage)
    }

    func updateLabel() {
        progress += 0.01
        let currentPercentage = progress * percentage
        drawLabel(currentPercentage)
    }

    func draw() {

        drawCircle()
    }

    func drawLabel(percentage: Double) {

        let labelWidth = self.frame.width
        label.frame = CGRectMake(0, 0, labelWidth, labelWidth)
        label.center = CGPointMake(self.frame.width / 2, self.frame.width / 2)
        label.text = String(format: percentageFormat, percentage * 100)
        label.textAlignment = NSTextAlignment.Center
        label.font = UIFont(name: "HiraKakuProN-W6", size: labelWidth / 5)
        self.addSubview(label)
    }

    func drawCircle() {

        // 円の直径(枠線が frame より外に出ないように直径を算出)
        let diameter = self.frame.size.width - lineWidth

        // 円の描画path設定
        circle.path = UIBezierPath(roundedRect: CGRectMake(0, 0, diameter, diameter), cornerRadius: diameter / 2).CGPath

        // 円のポジション設定(枠線の太さ分位置を調整)
        circle.position = CGPointMake(lineWidth / 2, lineWidth / 2)

        // 塗りの色を設定
        circle.fillColor = fillColor.CGColor

        // 線の色を設定
        circle.strokeColor = lineColor.CGColor

        // 線の幅を設定
        circle.lineWidth = lineWidth

        // 該当のUIViewのlayerにsublayerとしてCALayerを追加
        animation = createAnimation()
        circle.addAnimation(animation, forKey: "drawAnimation")

        self.layer.addSublayer(circle)
    }

    private func createAnimation() -> CABasicAnimation {

        // CAShapeLayer の strokeEnd プロパティをアニメーションさせます.
        let animation = CABasicAnimation(keyPath: "strokeEnd")

        // アニメーション間隔の指定
        animation.duration = 1.0

        // 繰り返し回数の指定
        animation.repeatCount = 1.0  // Animate only once..

        // 起点と目標点の変化比率を設定 (0.0 〜 1.0)
        animation.fromValue = 0.0
        animation.toValue = percentage

        // イージングを決定
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)

        // アニメ完了時の描画を保持
        animation.removedOnCompletion = false;
        animation.fillMode = kCAFillModeForwards;

        // 逆再生の指定
        animation.autoreverses = false

        // デリゲート設定
        animation.delegate = self

        return animation
    }
}
