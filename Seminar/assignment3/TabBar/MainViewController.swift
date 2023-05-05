//
//  TabBarViewController.swift
//  SOPT_iOS_SEMINAR
//
//  Created by Minjoo Kim on 2023/05/04.
//


import UIKit
import SnapKit

class MainViewController: UIViewController {

    let categoryTitleList = [ "홈", "실시간", "TV프로그램", "영화", "파라마운트+", "키즈" ]
    
    private lazy var pagingTabBar = PagingTabBar(categoryTitleList: categoryTitleList)
    private lazy var pagingView = PagingView(categoryTitleList: categoryTitleList, pagingTabBar: pagingTabBar)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
    }
}

private extension MainViewController {
    func setupLayout() {
        [
            pagingTabBar,
            pagingView
        ].forEach { view.addSubview($0) }
        
        pagingTabBar.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(pagingTabBar.cellHeight)
        }
        pagingView.snp.makeConstraints { make in
            make.top.equalTo(pagingTabBar.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
}
