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
        $0.scrollDirection = .horizontal
        $0.minimumInteritemSpacing = 8.0
        $0.itemSize = CGSize(width: 115, height: 150)
    }
    
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
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
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
            $0.height.equalTo(200)
            $0.trailing.equalToSuperview()
        }
        
        self.collectionView.dataSource = self
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



extension TableViewCell2: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list[section].items.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: MyPage_TableViewCell.cellIdentifier, for: indexPath) as? MyPage_TableViewCell else { return UITableViewCell() }
            cell.configureCell(list[0].items[indexPath.row])
            return cell

        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: MyPage_TableViewCell.cellIdentifier, for: indexPath) as? MyPage_TableViewCell else { return UITableViewCell() }
            cell.configureCell(list[1].items[indexPath.row])
            return cell
        default: return UITableViewCell()
            
        }
    }
    

    // MARK : Header, Footer
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        switch section {
        case 0: return tableView.dequeueReusableHeaderFooterView(withIdentifier: "SeparatorTableViewFooter")
        case 1: return tableView.dequeueReusableHeaderFooterView(withIdentifier: "LogOutButtonFooter")
        default: return nil
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard section == 0, let headerCell = tableView.dequeueReusableHeaderFooterView(withIdentifier: "MyTableViewHeader") as? MyTableViewHeader else { return nil }
        
        let tapGesture = UITapGestureRecognizer()
        headerCell.addGestureRecognizer(tapGesture)
        return headerCell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return section == 0 ? 310 : 0
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return section == 1 ? 100 : 33
    }
}
