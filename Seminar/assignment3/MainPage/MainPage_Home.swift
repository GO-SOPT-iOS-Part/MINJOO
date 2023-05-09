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

class MainPage_Home: UIViewController {
    
    
    let fullSizeWidth = UIScreen.main.bounds.width
//    var bannerViews: [UIImageView] = []
    
    
    var timer = Timer()
    var xOffset: CGFloat = 0
    var currentPage = 0 {
        didSet{
            xOffset = fullSizeWidth * CGFloat(self.currentPage)
            tableview.reloadData()
        }
    }
    private lazy var tableview = UITableView(frame: .zero, style: .grouped).then {
        $0.backgroundColor = .tvingBlack
        $0.contentInsetAdjustmentBehavior = .never
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
        setDelegate()
        setTimer()
        setLayout()
    }
    
    
    func registerCell() {
        tableview.register(TableViewCell.self, forCellReuseIdentifier:  TableViewCell.identifier)
        tableview.register(TableViewCell2.self, forCellReuseIdentifier: TableViewCell2.identifier)
    }
    
    func setDelegate() {
        tableview.delegate = self
        tableview.dataSource = self
    }
    
    func setLayout() {
        view.addSubview(tableview)
        
        tableview.snp.makeConstraints {
            $0.edges.equalToSuperview()
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
            
            self.bannerViews = cell.bannerViews
            cell.myCollectionView.delegate = self
            cell.pageControl.currentPage = self.currentPage
            cell.myCollectionView.contentOffset.x = self.xOffset
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
}



extension MainPage_Home: UICollectionViewDelegate {
    func scrollViewWillBeginDragging(_ collectionView: UICollectionView) {
        timer.invalidate()
    }
    
    func scrollViewDidEndDragging(_ collectionView: UICollectionView, willDecelerate decelerate: Bool) {
        setTimer()
    }
    
    func scrollViewDidEndDecelerating(_ collectionView: UICollectionView) {
        
        if collectionView == tableview {
        }else{
            let translatedPoint = collectionView.panGestureRecognizer.translation(in: collectionView)
            print(translatedPoint.x)
            if translatedPoint.x < 0 {
                swipeLeft()
            }else{
                swipeRight()
            }
        }
    }
}



