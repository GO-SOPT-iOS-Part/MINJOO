//
//  MyPage_ViewControllor.swift
//  SOPT_iOS_SEMINAR
//
//  Created by Minjoo Kim on 2023/04/28.
//


import UIKit
import SnapKit
import Then


final class MyPage_ViewController: tvingBaseViewController, UITableViewDelegate {
    
    
    
    let list = SettingSection.dummy()
    
    
    
    
    
  
    
    
    
    
    
    
    
    private let section = UITableView(frame: .zero, style: .grouped).then {
        $0.backgroundColor = .tvingBlack
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    override func setStyle() {
        section.do {
            $0.register(MyPage_TableViewCell.self, forCellReuseIdentifier: MyPage_TableViewCell.identifier)
            $0.rowHeight = 54
            $0.delegate = self
            $0.dataSource = self
            $0.register(MyTableViewHeader.self, forHeaderFooterViewReuseIdentifier: "MyTableViewHeader")
            $0.register(SeparatorTableViewFooter.self, forHeaderFooterViewReuseIdentifier: "SeparatorTableViewFooter")
            $0.register(LogOutButtonFooter.self, forHeaderFooterViewReuseIdentifier: "LogOutButtonFooter")
        }
    }
    override func setLayout() {
        view.addSubview(section)
        section.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(5000)
        }
    }
}

extension MyPage_ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list[section].items.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: MyPage_TableViewCell.identifier, for: indexPath) as? MyPage_TableViewCell else { return UITableViewCell() }
            cell.configureCell(list[0].items[indexPath.row])
            
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: MyPage_TableViewCell.identifier, for: indexPath) as? MyPage_TableViewCell else { return UITableViewCell() }
            cell.configureCell(list[1].items[indexPath.row])
            return cell
        default: return UITableViewCell()
            
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return list[section].header
        
    }
    
    
    
    
    
    
    
 
    
    
    
    
    // MARK : seperator (First Section's Footer)
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
            // 마지막 section은 footer 미표출

//        guard section != 1 else {
//            return nil
//        }
        switch section {
        case 0: return tableView.dequeueReusableHeaderFooterView(withIdentifier: "SeparatorTableViewFooter")
        case 1: return tableView.dequeueReusableHeaderFooterView(withIdentifier: "LogOutButtonFooter")
        default: return nil
        }
//        return tableView.dequeueReusableHeaderFooterView(withIdentifier: "SeparatorTableViewFooter")
    }
//
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
            guard section == 0, let headerCell = tableView.dequeueReusableHeaderFooterView(withIdentifier: "MyTableViewHeader") as? MyTableViewHeader else { return nil }

            let tapGesture = UITapGestureRecognizer()
            headerCell.addGestureRecognizer(tapGesture)
//            tapGesture.rx.event
//                .asDriver()
//                .drive(onNext: { _ in
//                    print("did tap first header")
//                }).disposed(by: headerCell.disposeBag)

            return headerCell
        }
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
            // Header 영역 크기 = 140(separator 상단) + 12(separator 하단)

            return section == 0 ? 300 : 0
        }

    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        // footer 영역 크기 = 12 (마지막 section의 footer 크기는 0)

        return section == 1 ? 55 : 33
    }

    
    
    
    
    
    
    
}
