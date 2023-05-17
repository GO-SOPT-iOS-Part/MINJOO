//
//  BaseViewHeaderFooter.swift
//  SOPT_iOS_SEMINAR
//
//  Created by Minjoo Kim on 2023/05/05.
//

import UIKit
import SnapKit
import Then

class BaseTableViewHeaderFooterView<T>: UITableViewHeaderFooterView {
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)

        configure()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    var model: T? {
        didSet {
            if let model = model {
                bind(model)
            }
        }
    }
    func configure() {}
    func bind(_ model: T) {}
}
