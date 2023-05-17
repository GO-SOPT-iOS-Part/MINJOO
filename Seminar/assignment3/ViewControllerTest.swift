//
//  ViewControllerTest.swift
//  SOPT_iOS_SEMINAR
//
//  Created by Minjoo Kim on 2023/04/28.
//

import UIKit

class ViewControllerTest: UIViewController {
    
    let list = SettingSection.generateData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @objc func switchChanged(_ sender: UISwitch) {
        print(sender.isOn, sender.tag)
    }
}

extension ViewControllerTest: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return list.count
    } // 섹션 숫자
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list[section].items.count
    } // 셀 숫자
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let target = list[indexPath.section].items[indexPath.row] // 셀에 표시할 데이터를 가져옴
        let cell = tableView.dequeueReusableCell(withIdentifier: target.type.rawValue, for: indexPath)
        
        switch target.type { // 타입별로 값을 설정
        case .detailTitle:
            cell.textLabel?.text = target.title
            cell.detailTextLabel?.text = target.subTitle
        case .switch:
            cell.textLabel?.text = target.title
            if let switchView = cell.accessoryView as? UISwitch {
                switchView.isOn = target.on
                switchView.addTarget(self, action: #selector(switchChanged(_:)), for: .valueChanged)
                switchView.tag = indexPath.section
            }
        case .rightDetail:
            cell.textLabel?.text = target.title
            cell.detailTextLabel?.text = target.RightDetail
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return list[section].header
    }
}
