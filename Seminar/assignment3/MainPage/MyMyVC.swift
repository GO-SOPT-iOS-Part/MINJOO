//
//  MyMyVC.swift
//  SOPT_iOS_SEMINAR
//
//  Created by Minjoo Kim on 2023/05/09.
//


import UIKit
import SnapKit

class MyMyVC: UIViewController {
    private let flowLayout = UICollectionViewFlowLayout().then {
        $0.scrollDirection = .horizontal
        $0.minimumInteritemSpacing = 8.0
        $0.itemSize = CGSize(width: 115, height: 150)
    }
    
    private var dataSource = getSampleImages()

    var movieList: [Result] = [] {
        didSet {
            collectionView.reloadData()
        }
    }
 
    private lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: self.flowLayout).then {
        
        $0.isScrollEnabled = true
        $0.showsHorizontalScrollIndicator = false
        $0.showsVerticalScrollIndicator = true
        $0.contentInset = .zero
        $0.backgroundColor = .systemPink
        $0.clipsToBounds = true
        $0.register(MyCell.self, forCellWithReuseIdentifier: "MyCell")
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        test()
        self.view.addSubview(self.collectionView)
        
        
        
        
        collectionView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.height.equalTo(200)
            $0.trailing.equalToSuperview()
        }
        
        self.collectionView.dataSource = self
    }
}

extension MyMyVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.movieList.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyCell.id, for: indexPath) as! MyCell
        cell.configureCell(movieList[indexPath.item])
        return cell
    }
}

func getSampleImages() -> [UIImage?] {
    (1...20).map { _ in return UIImage(named: "poster") }
}


extension MyMyVC {
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
