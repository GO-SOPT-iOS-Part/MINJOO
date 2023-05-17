//
//  TableViewCell2.swift
//  SOPT_iOS_SEMINAR
//
//  Created by Minjoo Kim on 2023/05/09.
//


import UIKit
import SnapKit
import Then


class TableViewCell2: UITableViewCell {
    static let identifier = "section1"
    let fullSize = UIScreen.main.bounds
    private let flowLayout = UICollectionViewFlowLayout().then {
        $0.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        $0.scrollDirection = .horizontal
        $0.minimumInteritemSpacing = 8.0
        $0.itemSize = CGSize(width: 123, height: 190)
        $0.minimumLineSpacing = 0.0 // 상하간격
//        $0.minimumInteritemSpacing = 8
    }
    
    var movieList: [Result] = [] {
        didSet {
            collectionView.reloadData()
        }
    }
 
    private lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: self.flowLayout).then {
        
        $0.isScrollEnabled = true
        $0.showsHorizontalScrollIndicator = false
        $0.contentInset = .zero
        $0.backgroundColor = .tvingBlack
        $0.register(MyCell.self, forCellWithReuseIdentifier: "MyCell")
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.contentView.backgroundColor = .tvingBlack
        setSubviews()
        setLayouts()
        test()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setSubviews() {
        contentView.addSubview(collectionView)
    }
    
    //MARK: - Set Layouts
    func setLayouts() {
        collectionView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.height.equalTo(170)
            $0.trailing.equalToSuperview()
        }
        
        self.collectionView.dataSource = self
        self.selectionStyle = .none
    }
    
    
}

extension TableViewCell2: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.movieList.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyCell.id, for: indexPath) as! MyCell
        cell.configureCell(movieList[indexPath.item])
        return cell
    }
}




extension TableViewCell2 {
    func test () {
        MovieService.shared.getNowPlaying() { response in
            switch response {
            case .success(let data):
                guard let data = data as? MovieResponse else { return }
                self.movieList = data.results
                dump(data)
            default: return
            }
        }
    }
}


