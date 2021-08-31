//
//  UILabel.swift
//  SecretKeyManager
//
//  Created by 203 on 2021/8/31.
//

import Foundation
import UIKit

extension UILabel {
    func configTextStyle(text: String, isFirst: Bool) {
        let paragraphStyle = NSMutableParagraphStyle()
        var emptyLen = 0
        if isFirst {
            emptyLen = Int(font.pointSize * 2)
        }
        paragraphStyle.firstLineHeadIndent = CGFloat(emptyLen)
        paragraphStyle.lineSpacing = 5.0 // 行间距
        let attrText = NSAttributedString(string: text, attributes: [.paragraphStyle: paragraphStyle])
        attributedText = attrText
    }

    func obtainLabelHeight(labelStr: String, font: UIFont) -> CGFloat {
        let statusLabelText: NSString = labelStr as NSString
        let size = CGSize(width: frame.width, height: 900)
        let dic = NSDictionary(object: font, forKey: NSAttributedString.Key.font as NSCopying)
        let strSize = statusLabelText.boundingRect(
                with: size,
                options: .usesLineFragmentOrigin,
                attributes: dic as? [NSAttributedString.Key: Any],
                context: nil
        ).size
        return strSize.height
    }
}
