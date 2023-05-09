//
//  MyCell.swift
//  SOPT_iOS_SEMINAR
//
//  Created by Minjoo Kim on 2023/05/09.
//


import UIKit
import SnapKit
import Kingfisher

final class MyCell: UICollectionViewCell {
    static let id = "MyCell"
    
    // MARK: UI
    private let imageView = UIImageView().then {
        $0.image = UIImage(named: "Image")
        $0.backgroundColor = .tvingWhite
        $0.contentMode = .scaleAspectFill
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.makeCornerRound(radius: 5)
    }
    private lazy var label = UILabel().then {
        $0.text = "우리가 사랑했던 모든 것"
        
        $0.font = UIFont(name: "Pretendard-Medium", size: 12)
        $0.textColor = .tvingWhite
        $0.textAlignment = .left
        
    }
    
    // MARK: Initializer
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.contentView.addSubview(self.imageView)
        self.contentView.addSubview(self.label)
        imageView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.height.equalTo(150)
            $0.width.equalTo(115)
        }
        label.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.bottom).inset(-8)
            $0.height.equalTo(13)
            $0.width.equalTo(imageView.snp.width)
        }
    }

    func configureCell(_ result: Result) {
        let url = URL(string: "https://image.tmdb.org/t/p/original/\(result.posterPath)")
        imageView.kf.setImage(with: url)
        label.text = result.title
    }
}
