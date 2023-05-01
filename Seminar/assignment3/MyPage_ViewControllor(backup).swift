////
////  MyPage_ViewControllor(backup).swift
////  SOPT_iOS_SEMINAR
////
////  Created by Minjoo Kim on 2023/04/28.
////
//
//
//
//import UIKit
//import SnapKit
//import Then
//
//
//final class MyPage_ViewController_backup: tvingBaseViewController {
//
//    public var text: String?
//
//
//    private let section1 = UIView()
//    private lazy var backButton = UIButton().then {
//        $0.setBackgroundImage(UIImage(named: "btn_before"), for: .normal)
//        $0.addTarget(self,
//                     action: #selector(goToAuthView),
//                     for: .touchUpInside)
//    }
//    private lazy var arlertButton = UIButton().then {
//        $0.setBackgroundImage(UIImage(named: "MyPage_bell"), for: .normal)
//        $0.tintColor = .tvingWhite
//    }
//    private lazy var settingsButton = UIButton().then {
//        $0.setBackgroundImage(UIImage(named: "MyPage_settings"), for: .normal)
//    }
//
//    private let section2 = UIView()
//    private let profileImage = UIButton().then {
//        $0.setBackgroundImage(UIImage(named: "profileImage"), for: .normal)
//        $0.layer.cornerRadius = 11
//    }
//    private let nameLabel = UIButton().then {
//        $0.setTitle("", for: .normal)
//    }
//    private let section3 = UITableView().then {
//        $0.backgroundColor = .tvingBlack
//    } // tableView
//
//
//    private let section4 = UITableView() // tableView
//
//    private let dummy1 = MyPage.dummy1()
//    private let dummy2 = MyPage.dummy2()
//
//    private let line1 = UIView().then {
//        $0.frame = CGRect(x: 0, y: 0, width: 1000, height: 0)
////        $0.backgroundColor = .tvingRed
//
//        var stroke = UIView()
//        stroke.bounds = $0.bounds.insetBy(dx: -0.5, dy: -0.5)
//        stroke.center = $0.center
//        $0.addSubview(stroke)
//        $0.bounds = $0.bounds.insetBy(dx: -0.5, dy: -0.5)
//        stroke.layer.borderWidth = 1
//        stroke.layer.borderColor = UIColor.yellow.cgColor
////        stroke.layer.borderColor = UIColor.gray180.cgColor
//    }
//
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
////        navigationController?.isNavigationBarHidden = true
//        section3.separatorStyle = .none
//    }
//
//    override func setStyle() {
//
//        //        view.backgroundColor = .tvingRed
//        section3.do {
//            $0.register(MyPage_TableViewCell.self, forCellReuseIdentifier: MyPage_TableViewCell.identifier)
//            $0.addSubview(line1)
//            $0.register(MyPage_TableViewCell2.self, forCellReuseIdentifier: MyPage_TableViewCell2.identifier)
//            $0.rowHeight = 54
//            $0.delegate = self
//            $0.dataSource = self
//        }
//
//
//    }
//
//    override func setLayout() {
//        section1.addSubview(backButton)
//        section1.addSubview(arlertButton)
//        section1.addSubview(settingsButton)
//
//        // 네비게이션 바 ... 만들어보자 ...
//        self.navigationItem.rightBarButtonItems = [UIBarButtonItem(image: UIImage(named: "MyPage_settings"), style:.plain, target: self, action: #selector(onClickMessageButton)),
//                                                   UIBarButtonItem(image:UIImage(named: "profileImage"), style:.plain, target: self, action: #selector(onClickMessageButton))]
//
//        view.addSubview(section1)
//        section2.addSubview(profileImage)
//        view.addSubview(section2)
//        view.addSubview(line1)
//        view.addSubview(section3)
//        view.addSubview(section4)
//        backButton.snp.makeConstraints {
//            $0.top.equalTo(73)
//            $0.leading.equalTo(10)
//            $0.width.equalTo(8)
//            $0.height.equalTo(15)
//        }
//        arlertButton.snp.makeConstraints {
//            $0.centerY.equalTo(self.backButton.snp.bottom)
//            $0.trailing.equalToSuperview().inset(67)
//            $0.width.equalTo(23)
//            $0.height.equalTo(23)
//        }
//        settingsButton.snp.makeConstraints {
//            $0.centerY.equalTo(self.backButton.snp.bottom)
//            $0.trailing.equalToSuperview().inset(20)
//            $0.width.equalTo(23)
//            $0.height.equalTo(23)
//        }
//
//        section1.snp.makeConstraints {
//            $0.top.equalToSuperview()
//            $0.height.equalTo(100)
//            $0.width.equalToSuperview()
//
//        }
//
//        section2.snp.makeConstraints {
//            $0.top.equalTo(self.section1.snp.bottom)
//            $0.height.equalTo(100)
//            $0.width.equalToSuperview()
//
//        }
//        profileImage.snp.makeConstraints {
//            $0.centerY.equalTo(self.section2.snp.centerY)
//            $0.leading.equalTo(10)
//            $0.width.equalTo(72)
//            $0.height.equalTo(74)
//        }
//        line1.snp.makeConstraints {
//            $0.top.equalTo(self.section3.snp.bottom)
//            $0.width.equalToSuperview()
//        }
//        section3.snp.makeConstraints {
//            $0.top.equalTo(self.section2.snp.bottom)
//            $0.leading.trailing.equalToSuperview()
//        }
//
//        section4.snp.makeConstraints {
//            $0.top.equalTo(self.section3.snp.bottom)
//            $0.bottom.leading.trailing.equalToSuperview()
//        }
//    }
//}
//extension MyPage_ViewController_backup {
//    @objc
//    func goToMainPage() {
//        let mainViewController = MainPage_ViewController()
//        self.navigationController?.pushViewController(mainViewController, animated: true)
//    }
//    @objc
//    func backButtonTapped() {
//        if self.navigationController == nil {
//            self.dismiss(animated: true, completion: nil)
//        } else {
//            self.navigationController?.popViewController(animated: true)
//        }
//    }
//    @objc
//    func goToAuthView() {
//        let mainViewController = MainPage_ViewController()
//        self.navigationController?.pushViewController(mainViewController, animated: true)
//    }
//
//    @objc func onClickMessageButton() {
//
//    }
//}
//
//extension MyPage_ViewController_backup: UITableViewDelegate {  }
//
//extension MyPage_ViewController_backup: UITableViewDataSource {
//
//    func numberOfSections(in tableView: UITableView) -> Int {
//
//        return 2
//
//    }
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//
//        switch section {
//        case 0: return dummy1.count
//        case 1: return dummy2.count
//        default:
//            return 0
//        }
//
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
//        switch indexPath.section {
//        case 0:
//            guard let cell = tableView.dequeueReusableCell(withIdentifier: MyPage_TableViewCell.identifier, for: indexPath) as? MyPage_TableViewCell else { return UITableViewCell() }
//            cell.configureCell(dummy1[indexPath.row])
//            return cell
//        case 1:
//            guard let cell = tableView.dequeueReusableCell(withIdentifier: MyPage_TableViewCell2.identifier, for: indexPath) as? MyPage_TableViewCell2 else { return UITableViewCell() }
//            cell.configureCell2(dummy2[indexPath.row])
//            return cell
//        default: return UITableViewCell()
//        }
//    }
//}
