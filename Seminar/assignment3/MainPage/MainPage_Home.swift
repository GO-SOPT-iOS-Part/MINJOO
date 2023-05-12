//
//  MainPage_Home.swift
//  SOPT_iOS_SEMINAR
//
//  Created by Minjoo Kim on 2023/05/04.
//

import UIKit
import SnapKit
import Then


extension MainPage_Home {
    @frozen
    enum MySections: CaseIterable {
        case banner, section1, section2, section3
    }
}

class MainPage_Home: UIViewController, UICollectionViewDelegate {
    
    private lazy var tableview = UITableView(frame: .zero, style: .grouped).then {
        $0.backgroundColor = .tvingBlack
       
        $0.contentInsetAdjustmentBehavior = .never
        
    }
    
    private var scrollToEnd: Bool = false
    private var scrollToBegin: Bool = false
    
    let fullSizeWidth = UIScreen.main.bounds.width
    var bannerViews = TableViewCell().bannerViews
    
    var timer = Timer()
    var xOffset: CGFloat = 0
    var currentPage = 0 {
        didSet{
            xOffset = fullSizeWidth * CGFloat(self.currentPage)
            tableview.reloadData()
        }
    }
    
    
    weak var topConstraint: NSLayoutConstraint!
    var topPadding:CGFloat = 0.0
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
        setDelegate()
        setTimer()
        setLayout()
        
//        bannerViews.insert(bannerViews[bannerViews.count-1], at: 0)
//        bannerViews.append(bannerViews[1])
        
        if #available(iOS 15.0, *) {
            let window = UIApplication.shared.windows.first
            
            let topPadding = window?.safeAreaInsets.top
            
            let statusBar = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: topPadding ?? 0.0))
            
            statusBar.backgroundColor = .clear
            
            UIApplication.shared.windows.filter {$0.isKeyWindow}.first?.addSubview(statusBar)
            
        }
        func viewDidLayoutSubviews() {
            super.viewDidLayoutSubviews()
            TableViewCell().myCollectionView.setContentOffset(.init(x: fullSizeWidth, y: TableViewCell().myCollectionView.contentOffset.y), animated: false)
        }
    }
    
    
    func registerCell() {
        tableview.register(TableViewCell.self, forCellReuseIdentifier:  TableViewCell.identifier)
        tableview.register(TableViewCell2.self, forCellReuseIdentifier: TableViewCell2.identifier)
        
        tableview.register(TableViewCell2_Header.self, forHeaderFooterViewReuseIdentifier: "header")
    }
    
    func setDelegate() {
        tableview.delegate = self
        tableview.dataSource = self
        TableViewCell().myCollectionView.delegate = self
        
    }
    
    func setLayout() {
        view.addSubview(tableview)
        tableview.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
    func setTimer() {
        timer = Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(swipeLeft), userInfo: nil, repeats: true)
    }
    
    @objc func swipeLeft() {
        self.currentPage += 1
        if self.currentPage > bannerViews.count - 1 {
            self.currentPage = 0
        }
    }
    
    func swipeRight() {
        self.currentPage -= 1
        if currentPage < 0 {
            currentPage = bannerViews.count - 1
        }
    }
    
    @objc func pageControlDidTap() {
        timer.invalidate()
        swipeLeft()
    }
    
}

extension MainPage_Home: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return MySections.allCases.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sectionType = MySections.allCases[section]
        switch sectionType {
        case .banner: return 1
        case .section1: return 1
        case .section2: return 1
        case .section3: return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let setctionType = MySections.allCases[indexPath.section]
        switch setctionType {
        case .banner:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identifier, for: indexPath) as? TableViewCell
            else { return UITableViewCell() }
            
            cell.myCollectionView.delegate = self
            cell.pageControl.currentPage = self.currentPage
            cell.myCollectionView.contentOffset.x = self.xOffset
            cell.selectionStyle = .none
            //            cell.backgroundColor = .systemBlue
            return cell
        case .section1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell2.identifier, for: indexPath) as? TableViewCell2
            else { return UITableViewCell() }
            
            return cell
        case .section2:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell2.identifier, for: indexPath) as? TableViewCell2
            else { return UITableViewCell() }
            
            return cell
        case .section3:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell2.identifier, for: indexPath) as? TableViewCell2
            else { return UITableViewCell() }
            
            return cell
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let setctionType = MySections.allCases[indexPath.section]
        switch setctionType {
        case .banner: return 600
        case .section1: return 200
        case .section2: return 200
        case .section3: return 200
            
        }
    }
    
    // MARK : Header, Footer
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let sectionType = MySections.allCases[section]
        
        switch sectionType {
            
        case .banner: return nil
        case .section1: return tableView.dequeueReusableHeaderFooterView(withIdentifier: "header")
        case .section2: return tableView.dequeueReusableHeaderFooterView(withIdentifier: "header")
        case .section3: return tableView.dequeueReusableHeaderFooterView(withIdentifier: "header")
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        let sectionType = MySections.allCases[section]
        switch sectionType {
        case .banner:
            return 0
        case .section1, .section2, .section3: return 20.0
            
        }
    }
}

extension MainPage_Home: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView == TableViewCell().myCollectionView {
            let width = scrollView.bounds.size.width
            // 좌표보정을 위해 절반의 너비를 더해줌
            let x = scrollView.contentOffset.x + (width/2)
            
            let newPage = Int(x / width)
            if TableViewCell().pageControl.currentPage != newPage {
                TableViewCell().pageControl.currentPage = newPage
            }
        }
    }
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        timer.invalidate()
    }
    internal func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if scrollView == TableViewCell().myCollectionView { setTimer() }
    }
}
