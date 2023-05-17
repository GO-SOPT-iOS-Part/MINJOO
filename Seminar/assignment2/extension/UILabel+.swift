//
//  UILabel+.swift
//  SOPT_iOS_SEMINAR
//
//  Created by Minjoo Kim on 2023/04/18.
//

import UIKit

extension UILabel {

    func setLineSpacing(spacing: CGFloat) {
        guard let text = text else { return }

        let attrString = NSMutableAttributedString(string: text)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = spacing
        attrString.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, attrString.length))
        attributedText = attrString
    }
}
