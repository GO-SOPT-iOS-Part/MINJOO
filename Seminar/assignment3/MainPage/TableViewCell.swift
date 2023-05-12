//
//  TableViewCell.swift
//  SOPT_iOS_SEMINAR
//
//  Created by Minjoo Kim on 2023/05/09.
//

import UIKit
import SnapKit
import Then


class TableViewCell: UITableViewCell{
    static let identifier = "bannerCell"
    let fullSize = UIScreen.main.bounds
    var bannerViews: [UIImageView] {
        var bannerView = [UIImageView]()
        var imageView = UIImageView()
        for i in 0 ... 4 {
            imageView = UIImageView (image: UIImage(named: "poster_\(i)"))
            imageView.frame = CGRect(x: fullSize.width * CGFloat(i), y: 0, width: fullSize.width, height: 700)
            bannerView.append(imageView)
            
        }
//        imageView = UIImageView (image: UIImage(named: "poster_\(4)"))
//        imageView.frame = CGRect(x: fullSize.width * CGFloat(0), y: 0, width: fullSize.width, height: 700)
//        bannerView.insert(imageView, at: 0)
//
//        imageView = UIImageView (image: UIImage(named: "poster_\(1)"))
//        imageView.frame = CGRect(x: fullSize.width * CGFloat(6), y: 0, width: fullSize.width, height: 700)
//        bannerView.append(imageView)
        return bannerView
    }
    
    let layout = UICollectionViewFlowLayout().then {
        $0.scrollDirection = .vertical
        $0.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    lazy var myCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout).then {
        $0.contentSize = CGSize(width: Int(fullSize.width) * bannerViews.count, height: 600)
        
//        print(Int(fullSize.width) * bannerViews.count)
        $0.isPagingEnabled = true
        $0.isScrollEnabled = true
        $0.showsHorizontalScrollIndicator = false
        $0.showsVerticalScrollIndicator = true
        
        $0.clipsToBounds = true
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.contentInsetAdjustmentBehavior = .never
        for banner in bannerViews {
            $0.addSubview(banner)
        }
//        $0.backgroundColor = .systemOrange
        
    }
    lazy var pageControl = UIPageControl().then {
        
        $0.currentPageIndicatorTintColor = .tvingWhite
        $0.pageIndicatorTintColor = .gray
        
        $0.transform = CGAffineTransform(scaleX: 0.6, y: 0.6)
        $0.numberOfPages = bannerViews.count
        $0.currentPage = 0
        $0.isUserInteractionEnabled = true
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setSubviews()
        setLayouts()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Add Subviews
    func setSubviews() {
        contentView.addSubview(myCollectionView)
        contentView.addSubview(pageControl)
    }
    
    func setLayouts() {
        myCollectionView.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(600)
        }
        
        pageControl.snp.makeConstraints { (make) in
            make.bottom.equalTo(myCollectionView.snp.bottom)
            make.height.equalTo(20)
            make.leading.equalToSuperview().inset(-50)
        }
    }
}
