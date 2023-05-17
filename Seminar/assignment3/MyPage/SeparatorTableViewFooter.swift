//
//  SeparatorTableViewFooter.swift
//  SOPT_iOS_SEMINAR
//
//  Created by Minjoo Kim on 2023/05/01.
//


import UIKit
import SnapKit
import Then


class SeparatorTableViewFooter: BaseTableViewHeaderFooterView<Void> {

    lazy var separatorView = UIView().then {
        $0.backgroundColor = .gray180
    }

    override func configure() {
        super.configure()

        addSubviews()
        makeConstraints()
    }

    private func addSubviews() {
        contentView.addSubview(separatorView)
    }

    private func makeConstraints() {
        separatorView.snp.makeConstraints { maker in
            maker.height.equalTo(1)
            maker.leading.trailing.equalToSuperview().inset(8)
            maker.centerY.equalToSuperview()
        }
    }
}
