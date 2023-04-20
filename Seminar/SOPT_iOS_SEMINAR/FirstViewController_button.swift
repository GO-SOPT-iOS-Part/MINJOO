//
//  FirstViewController_button.swift
//  SOPT_iOS_SEMINAR
//
//  Created by Minjoo Kim on 2023/04/08.
//

import UIKit
import SnapKit
import Then

final class FirstViewController_button: UIViewController {
    
    private let myLabel: UILabel = {
        let label = UILabel()
        label.text = "눌러주세요"
        label.font = .systemFont(ofSize: 16)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    private lazy var nextButton: UIButton = {
        let button = UIButton()
        button.setTitle("다음으로!", for: .normal)
        button.backgroundColor = .lightGray
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self,
                         action: #selector(pushToSecondViewController),
                         for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        style()
        setLayout()
    }
}

private extension FirstViewController_button {
    
    func style() {
        
        view.backgroundColor = .white
    }
    
    func setLayout() {
        
        [myLabel, nextButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        
        NSLayoutConstraint.activate([myLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                                     myLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)])
        
        
        NSLayoutConstraint.activate([nextButton.topAnchor.constraint(equalTo: myLabel.bottomAnchor, constant: 20),
                                     nextButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
                                     nextButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
                                     nextButton.heightAnchor.constraint(equalToConstant: 48)])
    }
    
    @objc
    private func pushToSecondViewController() {
        
        let secondViewController = SecondViewController_button()
        
        secondViewController.completionHandler = { [weak self] text in
            
            
            guard let self else { return }
            self.myLabel.text = String(text)
            if text == 0 {
                self.myLabel.text = "눌러주세요"
            }
            else if text > 10 && text <= 20 {
                self.myLabel.text = "벌써 이만큼을 눌렀다니 !! \(text)번 눌렀습니다"
            }
            else if text > 20 && text <= 30 {
                self.myLabel.text = "더더 많이 눌러봐요 !! " + String(text) + "번 눌렀습니다"
            }
            else if text > 30 && text <= 40 {
                self.myLabel.text = "벌써 이만큼을 눌렀다니 !! " + String(text) + "번 눌렀습니다"
            }
            else if text > 40 {
                self.myLabel.text = "우와 수고했어용 " + String(text) + "번 눌렀습니다"
            }
            else {
                self.myLabel.text = "아직 한자리수입니다 ㅋ " + String(text) + "번 눌렀습니다"
            }
            
        }
        
//        self.navigationController?.presentViewController(secondViewController, animated: true)
        self.present(secondViewController, animated: true)
    }
}
