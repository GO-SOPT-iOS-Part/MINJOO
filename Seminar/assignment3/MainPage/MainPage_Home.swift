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
    
    private lazy var tableview = UITableView(frame: .zero, style: .grouped).then {
        $0.backgroundColor = .systemYellow
        $0.contentInsetAdjustmentBehavior = .never
        
    }
    
    
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
    
    
    @IBOutlet weak var topConstraint: NSLayoutConstraint!
    var topPadding:CGFloat = 0.0
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
        setDelegate()
        setTimer()
        setLayout()
        if #available(iOS 13.0, *) {
            let window = UIApplication.shared.windows.first
            
            let topPadding = window?.safeAreaInsets.top
            
            let statusBar = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: topPadding ?? 0.0))
            
            statusBar.backgroundColor = .clear
            
            UIApplication.shared.windows.filter {$0.isKeyWindow}.first?.addSubview(statusBar)
            
        }
        
        bannerViews.insert(bannerViews[bannerViews.count-1], at: 0)
        bannerViews.append(bannerViews[1])
        //        navigationController?.setNavigationBarHidden(true, animated: true)
        //
        //        self.navigationController!.navigationBar.setBackgroundImage(UIImage(), for: .default)
        //        self.navigationController!.navigationBar.shadowImage = UIImage()
        //        self.navigationController!.navigationBar.isTranslucent = true
        //
        //        topConstraint.constant = -64
        //        if #available(iOS 11.0, *) {
        //            let window = UIApplication.shared.keyWindow
        //            topPadding = (window?.safeAreaInsets.top)!
        //            topConstraint.constant = -(64+topPadding)
        //        }
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
            cell.backgroundColor = .systemBlue
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
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0
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
//        if collectionView.frame.size.width != 0 {
//            let value = (collectionView.contentOffset.x / collectionView.frame.width)
//            TableViewCell().pageControl.currentPage = Int(round(value))
//        }
        
        
        if collectionView == TableViewCell().myCollectionView {
        }else{
            let translatedPoint = collectionView.panGestureRecognizer.translation(in: collectionView)
            print(translatedPoint.x)
            if translatedPoint.x < 0 {
                swipeLeft()
            }else{
                swipeRight()
            }
        }
        let x = collectionView.contentOffset.x
                let w = collectionView.bounds.size.width
                currentPage = Int(ceil(x/w))
                print(currentPage)
    }
    
    
}



