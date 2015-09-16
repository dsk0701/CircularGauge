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
    
    var lineWidth: CGFloat = 10.0
    var lineColor: UIColor = UIColor.orangeColor()
    var fillColor: UIColor = UIColor.clearColor()
    var percentage: CGFloat = 1.0    // 0 〜 1

    private var circle: CAShapeLayer = CAShapeLayer()

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
        self.layer.addSublayer(circle)
        
        animate()
    }

    func animate() {

        // アニメーションkeyを設定
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

        // Add the animation to the circle
        circle.addAnimation(animation, forKey: "gaugeAnimation")
    }
}
