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

    private lazy var tableview = UITableView(frame: .zero, style: .grouped).then {
        $0.backgroundColor = .tvingBlack
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func setStyle() {
        tableview.do {
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
        view.addSubview(tableview)
        
        tableview.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
            $0.height.equalToSuperview()
        }
    }
    
    
    // MARK : navigation Bar
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationBar()
    }
    
    func navigationBar() {
        UINavigationBar.appearance().isTranslucent = false
        UINavigationBar.appearance().barTintColor = .tvingBlack

            func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
                let newNavBarAppearance = UINavigationBarAppearance()
                    
                let appearance = UINavigationBar.appearance()
                appearance.scrollEdgeAppearance = newNavBarAppearance
                appearance.compactAppearance = newNavBarAppearance
                appearance.standardAppearance = newNavBarAppearance
                if #available(iOS 15.0, *) {
                    appearance.compactScrollEdgeAppearance = newNavBarAppearance
                }
                return true
        }
        
        self.navigationController?.isNavigationBarHidden = false
        
        lazy var backButton = UIButton().then {
            $0.setImage(UIImage(named: "btn_before"), for: .normal)
            $0.addTarget(self, action: #selector(goToMainPage), for: .touchUpInside)
        }
        let back = UIBarButtonItem(customView: backButton)
        
        lazy var alarmButton = UIButton().then {
            $0.setImage(UIImage(named: "MyPage_bell")?.withRenderingMode(.alwaysTemplate), for: .normal)
            $0.tintColor = UIColor.gray490
        }
        
        lazy var settingButton = UIButton().then {
            $0.setImage(UIImage(named: "MyPage_settings")?.withRenderingMode(.alwaysTemplate), for: .normal)
            $0.tintColor = UIColor.gray490
        }
        
        backButton.snp.makeConstraints {
            $0.width.equalTo(8)
            $0.height.equalTo(15)
        }
        
        alarmButton.snp.makeConstraints {
            $0.width.equalTo(30)
            $0.height.equalTo(42)
        }
        settingButton.snp.makeConstraints {
            $0.width.equalTo(33)
            $0.height.equalTo(31)
        }
        
        let righthStackview = UIStackView.init(arrangedSubviews: [alarmButton, settingButton]).then {
            $0.distribution = .equalSpacing
            $0.axis = .horizontal
            $0.alignment = .center
            $0.spacing = 10
            
            let rightStackBarButtonItem = UIBarButtonItem(customView: $0)
            navigationItem.leftBarButtonItem = back
            navigationItem.rightBarButtonItem = rightStackBarButtonItem
        }
    }
    
    @objc
    func goToMainPage() {
        let transition = CATransition().then {
            $0.duration = 0.25
            $0.type = .push
            $0.subtype = .fromLeft
            $0.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        }
        view.window?.layer.add(transition, forKey: kCATransition)
        dismiss(animated: false)
        let mainViewController = MainPage_ViewController()
        self.navigationController?.pushViewController(mainViewController, animated: false)
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
        return section == 0 ? 280 : 0
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return section == 1 ? 100 : 33
    }
}
