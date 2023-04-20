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
}
