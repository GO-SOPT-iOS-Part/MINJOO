//
//  PageViewController.swift
//  SOPT_iOS_SEMINAR
//
//  Created by Minjoo Kim on 2023/05/05.
//
//

import UIKit
import SnapKit

class MainPage_ViewController: UIViewController {
    
    public var text: String?
    private lazy var tvingLogo = UIImageView().then {
        $0.image = UIImage(named: "tving_logo")
    }
    
    private lazy var profileButton = UIButton().then {
        $0.setImage(UIImage(named: "profileImage"), for: .normal)
        $0.addTarget(self, action: #selector(goToProfile),
                     for: .touchUpInside)
    }
    var categoryTitleList = [ "홈", "실시간", "TV프로그램", "영화", "파라마운트+", "키즈" ]
    
    private lazy var pagingTabBar = PagingTabBar(categoryTitleList: categoryTitleList)

    lazy var pageViewController: UIPageViewController = {
        let vc = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)

        return vc
    }()
//    let newViewController = MViewController()
    lazy var vc1: UIViewController = {
        let vc = UIViewController()
        vc.view.backgroundColor = .blue
//        vc.view.addSubview(HomeView)
//        vc.addChild(newViewController)
//        vc.view.addSubview(newViewController.view)
//        vc.view.addConstraints(newViewController.view.constraints)
//        newViewController.didMove(toParent: self)
        
        
        return vc
    }()
    lazy var main = MainPage_Home()

    lazy var vc2: UIViewController = {
        let vc = UIViewController()
        vc.view.backgroundColor = .green

        return vc
    }()

    lazy var vc3: UIViewController = {
        let vc = UIViewController()
        vc.view.backgroundColor = .blue

        return vc
    }()
    lazy var vc4: UIViewController = {
        let vc = UIViewController()
        vc.view.backgroundColor = .systemPink

        return vc
    }()
    lazy var vc5: UIViewController = {
        let vc = UIViewController()
        vc.view.backgroundColor = .systemYellow

        return vc
    }()
    lazy var vc6: UIViewController = {
        let vc = UIViewController()
        vc.view.backgroundColor = .systemMint

        return vc
    }()

    
    lazy var dataViewControllers: [UIViewController] = {
        return [main, vc2, vc3, vc4, vc5, vc6]
    }()
    
    private lazy var pagingView = PagingView(categoryTitleList: categoryTitleList, pagingTabBar: pagingTabBar)
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        setupLayout()

        setupDelegate()

//        configure()

        if let firstVC = dataViewControllers.first {
            pageViewController.setViewControllers([firstVC], direction: .forward, animated: true, completion: nil)
        }

    }

    private func setupDelegate() {
        pageViewController.dataSource = self
        pageViewController.delegate = self
        pagingTabBar.collectionView.dataSource = self
        pagingTabBar.collectionView.delegate = self
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        currentPage = 0
    }
    
    
    var isSelected: Int? {
            didSet {
                guard let isSelected else { return }
                pagingTabBar.collectionView.selectItem(at: IndexPath(item: isSelected, section: 0), animated: true, scrollPosition: .centeredHorizontally)
                
            }
        }
    
    var currentPage: Int = 0 {
           didSet {
               bind(oldValue: oldValue, newValue: currentPage)
           }
       }
    private func bind(oldValue: Int, newValue: Int) {
            let direction: UIPageViewController.NavigationDirection = oldValue < newValue ? .forward : .reverse
            pageViewController.setViewControllers([dataViewControllers[currentPage]], direction: direction, animated: true, completion: nil)
            self.isSelected = newValue
        }
    
}

extension MainPage_ViewController: UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let index = dataViewControllers.firstIndex(of: viewController) else { return nil }
        let previousIndex = index - 1
        if previousIndex < 0 {
            return nil
        }
        return dataViewControllers[previousIndex]
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let index = dataViewControllers.firstIndex(of: viewController) else { return nil }
        let nextIndex = index + 1
        if nextIndex == dataViewControllers.count {
            return nil
        }
        return dataViewControllers[nextIndex]
    }
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
           guard let currentVC = pageViewController.viewControllers?.first,
                 let currentIndex = dataViewControllers.firstIndex(of: currentVC) else { return }
           currentPage = currentIndex
       }
    
}
extension MainPage_ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard pagingTabBar.collectionView.cellForItem(at: IndexPath(item: isSelected!, section: 0)) is PagingTabBarCell else { return }
            currentPage = indexPath.item
        }
    
}

private extension MainPage_ViewController {
    func setupLayout() {
        view.addSubviews(tvingLogo, profileButton)
            addChild(pageViewController)
        [
            pagingTabBar,
            pageViewController.view
        ].forEach { view.addSubview($0) }
//        view.sendSubviewToBack(main.view)
        tvingLogo.snp.makeConstraints {
            $0.top.equalTo(58)
            $0.leading.equalTo(11)
            $0.width.equalTo(99)
            $0.height.equalTo(25)
        }
        profileButton.snp.makeConstraints {
            $0.centerY.equalTo(tvingLogo)
            $0.trailing.equalToSuperview().offset(-9)
            $0.width.equalTo(33)
            $0.height.equalTo(31)
        }
        pagingTabBar.snp.makeConstraints {
            $0.top.equalTo(tvingLogo.snp.bottom).inset(-10)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(pagingTabBar.cellHeight)
        }
        pageViewController.view.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.bottom.equalToSuperview()
        }
        
        self.view.sendSubviewToBack(pageViewController.view)
        pageViewController.didMove(toParent: self)
        
        
        
    }
    @objc
    func goToProfile() {
        let MyPageViewController = MyPage_ViewController()
        MyPageViewController.text = text
        self.navigationController?.pushViewController(MyPageViewController, animated: false)
    }
    
}

extension MainPage_ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoryTitleList.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PagingTabBarCell.identifier, for: indexPath) as? PagingTabBarCell else { return UICollectionViewCell() }
        
        cell.setupView(title: categoryTitleList[indexPath.row])
        return cell
    }

}

extension MainPage_ViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let name = self.categoryTitleList[indexPath.row]

        let attributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 17)]

        let nameSize = (name as NSString).size(withAttributes: attributes as [NSAttributedString.Key: Any])
        return CGSize(width: nameSize.width + 20, height: 50)
    }
}
