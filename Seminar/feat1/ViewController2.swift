//
//  VieController2.swift
//  project01
//
//  Created by Minjoo Kim on 2023/03/31.
//

import UIKit

class ViewController2: UIViewController {
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "이름이 무엇인가요?"
        label.font = .systemFont(ofSize: 22)
        label.textColor = UIColor(red:0.91 , green:0.50 , blue: 0.57, alpha: 1)
        label.textAlignment = .center
        return label
    }()
    private lazy var presentButton: UIButton = {
        let button = UIButton()
        button.setTitle("present!", for: .normal)
        button.backgroundColor = UIColor(red:0.95 , green:0.84 , blue: 0.88, alpha: 1)
        button.setTitleColor(UIColor.darkGray, for: .normal)
        
        button.addTarget(self,
                         action: #selector(presentButtonTapped),
                         for: .touchUpInside)
        return button
    }()
    
    private lazy var pushButton: UIButton = {
        let button = UIButton()
        button.setTitle("push!", for: .normal)
        button.backgroundColor = UIColor(red:0.95 , green:0.84 , blue: 0.88, alpha: 1)
        button.setTitleColor(UIColor.darkGray, for: .normal)
        button.addTarget(self,
                         action: #selector(pushButtonTapped),
                         for: .touchUpInside)
        return button
    }()
    
    private lazy var myButton: UIButton = {
        let button = UIButton()
        button.setTitle("눌러보든가!", for: .normal)
        button.backgroundColor = UIColor(red:0.95 , green:0.84 , blue: 0.88, alpha: 1)
        button.setTitleColor(UIColor.darkGray, for: .normal)
        button.addTarget(self,
                         action: #selector(myButtonTapped),
                         for: .touchUpInside)
        return button
    }()
    
    private let nameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "이름을 입력해주세요"
        textField.clearButtonMode = .whileEditing
        textField.layer.borderColor = UIColor.gray.cgColor
        textField.layer.borderWidth = 1
        textField.leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 16.0, height: 0.0))
        textField.leftViewMode = .always
        return textField
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        style()
        setLayout()
    }
}

private extension ViewController2 {
    
    func style() {
        
        view.backgroundColor = .white
        
    }
    func setLayout() {
        
        [nameLabel, nameTextField,
         presentButton, pushButton, myButton].forEach { make in
            make.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(make)
        }
        NSLayoutConstraint.activate([nameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 300),
                                     nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
                                     nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)])
        NSLayoutConstraint.activate([nameTextField.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20),
                                     nameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
                                     nameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
                                     nameTextField.heightAnchor.constraint(equalToConstant: 48)])
        NSLayoutConstraint.activate([presentButton.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 20),
                                     presentButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
                                     presentButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
                                     presentButton.heightAnchor.constraint(equalToConstant: 48)])
        NSLayoutConstraint.activate([pushButton.topAnchor.constraint(equalTo:presentButton.bottomAnchor, constant: 20),
                                     pushButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
                                     pushButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
                                     pushButton.heightAnchor.constraint(equalToConstant: 48)])
        NSLayoutConstraint.activate([myButton.topAnchor.constraint(equalTo:pushButton.bottomAnchor, constant: 20),
                                     myButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
                                     myButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
                                     myButton.heightAnchor.constraint(equalToConstant: 48)])
    }
    func presentToSecondViewController() {
        let secondViewController = ViewController3()
        secondViewController.modalPresentationStyle = .automatic
        secondViewController.modalTransitionStyle = .crossDissolve
        //        secondViewController.modalPresentationStyle = .fullScreen
        //        secondViewController.modalTransitionStyle = .partialCurl
        
        self.present(secondViewController, animated: true)
        //        self.navigationController?.pushViewController(secondViewController, animated: true)
    }
    func pushToSecondViewController() {
        guard let name = nameTextField.text else { return }
        let secondViewController = ViewController3()
        secondViewController.dataBind(name: name)
        self.navigationController?.pushViewController(secondViewController, animated: true)
    }
    func myToThirdViewController() {
//        guard let name = nameTextField.text else { return }
        let thirdViewController = ViewController4()
//        thirdViewController.dataBind(name: name)
        self.navigationController?.pushViewController(thirdViewController, animated: true)
    }
    
    @objc
    func presentButtonTapped() {
        presentToSecondViewController() }
    @objc
    func pushButtonTapped() {
        pushToSecondViewController() }
    @objc
    func myButtonTapped() {
        myToThirdViewController() }
}

