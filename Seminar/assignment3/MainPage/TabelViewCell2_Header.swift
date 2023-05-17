//
//  TabelViewCell2_Header.swift
//  SOPT_iOS_SEMINAR
//
//  Created by Minjoo Kim on 2023/05/10.
//

import UIKit

import SnapKit
import Then


import UIKit
import SnapKit
import Then


class TableViewCell2_Header: BaseTableViewHeaderFooterView<Void> {

    lazy var view = UIView().then {
        $0.backgroundColor = .clear
    }
    let category = UILabel().then {
        $0.text = "티빙에서 꼭 봐야하는 콘텐츠"
        $0.font = UIFont(name: "Pretendard-semibold", size: 15)
        $0.textColor = .tvingWhite
    }
    let more = UIButton().then {
        $0.setTitle("전체보기 >", for: .normal)
        $0.titleLabel?.font = UIFont(name: "Pretendard-Medium", size: 13)
        $0.setTitleColor(.gray490, for: .normal)
    
    }
    override func configure() {
        super.configure()

        addSubviews()
        makeConstraints()
    }

    private func addSubviews() {
        view.addSubviews(category, more)
        contentView.addSubview(view)
    }

    private func makeConstraints() {
        category.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.centerY.equalToSuperview()
        }
        more.snp.makeConstraints {
            $0.trailing.equalToSuperview()
            $0.centerY.equalToSuperview()
        }
        view.snp.makeConstraints {
            $0.height.equalTo(14)
            $0.leading.trailing.equalToSuperview().inset(10)
            $0.bottom.equalToSuperview().inset(10)
            $0.centerY.equalToSuperview()
        }
    }
}
