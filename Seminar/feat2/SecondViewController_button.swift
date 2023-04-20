//
//  SecondViewController_button.swift
//  SOPT_iOS_SEMINAR
//
//  Created by Minjoo Kim on 2023/04/08.
//


import UIKit
import SnapKit
import Then

final class SecondViewController_button: UIViewController {
    
    var count: Int = 0
    
    typealias handler = ((Int) -> (Void))
    var completionHandler: handler?

    private lazy var pushButton: UIButton = {
        let button = UIButton()
        button.setTitle("눌러줘!", for: .normal)
        button.backgroundColor = UIColor(red: 0.1, green: 0.7, blue: 0.9, alpha: 1)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self,
                         action: #selector(countButtonTapped),
                         for: .touchUpInside)
        return button
    }()
    
    private lazy var backButton: UIButton = {
        let button = UIButton()
        button.setTitle("뒤로가기!", for: .normal)
        button.backgroundColor = UIColor(red: 0.1, green: 0.7, blue: 0.9, alpha: 1)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self,
                         action: #selector(popSecondViewController),
                         for: .touchUpInside)
        return button
    }()
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        style()
        setLayout()
    }
}

private extension SecondViewController_button {
    
    func style() {
        
        view.backgroundColor = .white
    }
    
    func setLayout() {
        
        [pushButton, backButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        
        NSLayoutConstraint.activate([pushButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 300),
                                     pushButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
                                     pushButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)])
        NSLayoutConstraint.activate([backButton.topAnchor.constraint(equalTo: pushButton.bottomAnchor, constant: 20),
                                     backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
                                     backButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
                                     backButton.heightAnchor.constraint(equalToConstant: 48)])
    }

    @objc
        func countButtonTapped() {
            count += 1
            self.pushButton.animateButton()
//            guard var count = count else { return }
            
        }
    @objc
    func popSecondViewController() {
//        self.navigationController?.popViewController(animated: true)
        dismiss(animated: true)
        completionHandler?(count)
    }
}
