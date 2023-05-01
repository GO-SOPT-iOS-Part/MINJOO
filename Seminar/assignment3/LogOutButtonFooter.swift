//
//  LogOutButtonFooter.swift
//  SOPT_iOS_SEMINAR
//
//  Created by Minjoo Kim on 2023/05/01.
//


import UIKit
import SnapKit
import Then


class LogOutButtonFooter: BaseTableViewHeaderFooterView<Void> {

    lazy var LogoutButton = UIButton().then {
        $0.setTitle("로그아웃", for: .normal)
        $0.titleLabel?.font = UIFont(name: "Pretendard-Medium", size: 14)
        $0.titleLabel?.textColor = .gray612
        $0.layer.borderColor = UIColor.gray180.cgColor
        $0.layer.borderWidth = 1
    }

    override func configure() {
        super.configure()

        addSubviews()
        makeConstraints()
    }

    private func addSubviews() {
        contentView.addSubview(LogoutButton)
    }

    private func makeConstraints() {
        LogoutButton.snp.makeConstraints {
            $0.top.equalToSuperview().inset(23)
            $0.height.equalTo(55)
            $0.leading.trailing.equalToSuperview().inset(8)
            $0.centerY.equalToSuperview()
        }
    }
}
