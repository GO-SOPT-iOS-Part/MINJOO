//
//  CollectionViewController.swift
//  SOPT_iOS_SEMINAR
//
//  Created by Minjoo Kim on 2023/05/03.
//

import UIKit

class CollectionViewController: BaseViewController {
    private var dummyCase = Poster.dummy() {
        didSet {
            self.collectionView.reloadData()
        }
    }
    
    private lazy var collectionView = UICollectionView(frame: .zero,
                                                       collectionViewLayout: flowLayout)
    
    private let flowLayout = UICollectionViewFlowLayout()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func setStyle() {
        
        view.backgroundColor = .white
        
        collectionView.do {
            $0.register(PosterCell.self, forCellWithReuseIdentifier: PosterCell.identifier)
            $0.showsVerticalScrollIndicator = false
            $0.delegate = self
            $0.dataSource = self
        }
        
        flowLayout.do {
            $0.itemSize = CGSize(width: (UIScreen.main.bounds.width - 6) / 3 , height: UIScreen.main.bounds.width / 3)
            $0.minimumLineSpacing = 3
            $0.minimumInteritemSpacing = 3
        }
    }
    
    override func setLayout() {
        
        view.addSubview(collectionView)
        
        collectionView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
}

extension CollectionViewController: UICollectionViewDelegate {}

extension CollectionViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return dummyCase.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PosterCell.identifier, for: indexPath) as? PosterCell else { return UICollectionViewCell() }
        
        return cell
    }
}
