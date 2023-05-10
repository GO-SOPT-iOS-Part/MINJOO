//
//  TabelViewCell2_Header.swift
//  SOPT_iOS_SEMINAR
//
//  Created by Minjoo Kim on 2023/05/10.
//

import UIKit

import SnapKit
import Then


class TableViewCell2_Header: UITableViewHeaderFooterView {
    
    static let identifier = "category"

    lazy var separatorView = UIView().then {
        $0.backgroundColor = .gray180
    }
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)

        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {

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
