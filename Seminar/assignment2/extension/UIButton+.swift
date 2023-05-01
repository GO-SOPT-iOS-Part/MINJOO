//
//  UIButton+.swift
//  SOPT_iOS_SEMINAR
//
//  Created by Minjoo Kim on 2023/04/20.
//

import UIKit

extension UIButton {
    
    func setUnderline() {
        guard let title = title(for: .normal) else { return }
        let attributedString = NSMutableAttributedString(string: title)
        attributedString.addAttribute(.underlineStyle,
                                      value: NSUnderlineStyle.single.rawValue,
                                      range: NSRange(location: 0, length: title.count)
        )
        setAttributedTitle(attributedString, for: .normal)
    }
    
    func kern() {
        self.titleLabel?.attributedText = NSMutableAttributedString(string: self.currentTitle!, attributes: [NSAttributedString.Key.kern: -0.5])
    }
    func setLineSpacing(spacing: CGFloat) {
        guard let text = title(for: .normal) else { return }
        
        let attributeString = NSMutableAttributedString(string: text)
        let style = NSMutableParagraphStyle()
        style.lineSpacing = spacing
        attributeString.addAttribute(.paragraphStyle,
                                     value: style,
                                     range: NSRange(location: 0, length: attributeString.length))
        setAttributedTitle(attributeString, for: .normal)
    }
    func alignVerticalCenter(padding: CGFloat = 7.0) {
        guard let imageSize = imageView?.frame.size, let titleText = titleLabel?.text, let titleFont = titleLabel?.font else {
            return
        }
        
        let titleSize = (titleText as NSString).size(withAttributes: [.font: titleFont])
        print(titleSize)
        let total = imageSize.height + titleSize.height + padding
        imageEdgeInsets = UIEdgeInsets(top: -(total - imageSize.height), left: 0, bottom: 0, right: -titleSize.width)
        titleEdgeInsets = UIEdgeInsets(top: 0, left: -imageSize.width, bottom: -(total - titleSize.height), right: 0)
    }
}

