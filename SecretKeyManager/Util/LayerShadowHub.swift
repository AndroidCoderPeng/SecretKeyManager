//
//  LayerShadowHub.swift
//  SecretKeyManager
//
//  Created by 203 on 2021/9/2.
//

import UIKit

class LayerShadowHub {
    public static var shared = LayerShadowHub()

    func setViewShadow(view: UIView, sColor: UIColor, radius: Float) {
        // 设置阴影颜色
        view.layer.shadowColor = sColor.cgColor
        // 设置阴影半径
        view.layer.shadowRadius = CGFloat(radius)
        // 设置圆角边框
        view.layer.cornerRadius = 10
    }

    func setLabelShadow(view: UILabel, sColor: UIColor, radius: Float) {
        view.layer.backgroundColor = sColor.cgColor
        view.layer.cornerRadius = CGFloat(radius)
        view.clipsToBounds = true
    }
}
