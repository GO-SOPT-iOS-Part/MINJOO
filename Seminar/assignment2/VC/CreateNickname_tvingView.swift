//
//  CreateNickname_tvingView.swift
//  SOPT_iOS_SEMINAR
//
//  Created by Minjoo Kim on 2023/04/18.
//

import UIKit
import SnapKit
import Then

protocol nicknameProtocol: AnyObject {
    func nicknameData(text: String)
}

final class CreateNickname_tvingView: UIViewController {
    
    weak var delegate: nicknameProtocol?
    
    private let nicknameView = UIView().then {
        $0.backgroundColor = .white
        $0.makeCornerRound(radius: 20)
    }
    
    private lazy var nicknameLabel = UILabel().then {
        $0.text = "닉네임을 입력해주세요"
        $0.textColor = .black
        $0.font = UIFont(name: "Pretendard-Medium", size: 23)
    }
    
    private lazy var nicknameTextField = UITextField().then {
        $0.placeholder = "닉네임"
        $0.font = UIFont(name: "Pretendard-SemiBold", size:14)
        $0.backgroundColor = .gray2
        $0.textColor = .gray4
        $0.setLeftPaddingPoints(20)
        $0.layer.cornerRadius = 3
        $0.addTarget(self, action: #selector(nicknameTextFieldDidChange),
                     for: UIControl.Event.editingChanged)
    }
    
    private lazy var deleteButton = UIButton().then {
        $0.setImage(UIImage(named: "x-circle"), for: .normal)
        $0.addTarget(self, action: #selector(deleteNickname),
                     for: .touchUpInside)
        $0.isHidden = true
    }
    
    private lazy var saveButton = UIButton().then {
        $0.setTitle("저장하기", for: .normal)
        $0.titleLabel?.font = UIFont(name: "Pretendard-SemiBold", size:14)
        $0.titleLabel?.textAlignment = .center
//        $0.setTitleColor(UIColor.tvingWhite, for: .normal)
//        $0.backgroundColor = .tvingRed
        $0.layer.cornerRadius = 12
        $0.addTarget(self, action: #selector(saveButtonAction),
                     for: .touchUpInside)
        $0.setTitleColor(UIColor.gray2, for: .normal)
        $0.backgroundColor = .tvingWhite
        $0.layer.borderWidth = 1
        $0.layer.borderColor = (UIColor.gray2.cgColor)
    }
    
    private let rectangle = UIImageView().then {
        $0.image = UIImage(named: "rectangle")
    }

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        setDelegate()
        style()
        setLayout()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first,
           touch.view == self.view {
            self.dismiss(animated: true)
        }
    }
    
    func modalNicknameView(height: CGFloat) {
        
        UIView.animate(withDuration: 0.3) {
            self.nicknameView.snp.updateConstraints {
                $0.height.equalTo(height)
                $0.leading.trailing.bottom.equalToSuperview()
            }
            self.view.layoutIfNeeded()
        }
    }
}

private extension CreateNickname_tvingView {
    
    func style() {
        view.backgroundColor = UIColor(white: 0.1, alpha: 0.5)
    }
    
    func setLayout() {
        
        view.addSubviews(nicknameView, rectangle)
        
        nicknameView.addSubview(nicknameLabel)
        nicknameView.addSubview(nicknameTextField)
        nicknameView.addSubview(deleteButton)
        nicknameView.addSubview(saveButton)

        nicknameView.snp.makeConstraints {
            $0.height.equalTo(0)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(view.safeAreaInsets)
        }
        
        nicknameLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(45)
            $0.leading.equalToSuperview().inset(20)
        }
        
        nicknameTextField.snp.makeConstraints {
            $0.top.equalToSuperview().inset(93)
            $0.height.equalTo(52)
            $0.leading.trailing.equalToSuperview().inset(20)
        }
        
        deleteButton.snp.makeConstraints {
            $0.centerY.equalTo(nicknameTextField.snp.centerY)
            $0.trailing.equalTo(nicknameTextField.snp.trailing).offset(-14)
            $0.size.equalTo(20)
        }
        
        saveButton.snp.makeConstraints {
            $0.top.equalToSuperview().inset(359.19)
            $0.height.equalTo(52)
            $0.leading.trailing.equalToSuperview().inset(22.82)
        }
        
        rectangle.snp.makeConstraints {
            $0.bottom.equalTo(nicknameView.snp.top).offset(-15)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(56)
            $0.height.equalTo(7)
        }
    }
    
    func setDelegate() {
        nicknameTextField.delegate = self
    }
    
    func gotoView1() {
        self.dismiss(animated: true)
    }
    
    @objc
    func saveButtonAction() {
        if let nickname = nicknameTextField.text {
            delegate?.nicknameData(text: nickname)
            gotoView1()
        }
    }
    
    @objc
    func deleteNickname() {
        nicknameTextField.text?.removeAll()
        deleteButton.isHidden = true
        saveButton.setTitleColor(UIColor.gray2, for: .normal)
        saveButton.backgroundColor = .tvingWhite
        saveButton.layer.borderWidth = 1
        saveButton.layer.borderColor = (UIColor.gray2.cgColor)
    }
    
    @objc func nicknameTextFieldDidChange(){
        if nicknameTextField.hasText {
            deleteButton.isHidden = false
            saveButton.setTitleColor(UIColor.tvingWhite, for: .normal)
            saveButton.backgroundColor = .tvingRed
            saveButton.layer.borderWidth = 0
            
        }
        else {
            deleteButton.isHidden = true
            saveButton.setTitleColor(UIColor.gray2, for: .normal)
            saveButton.backgroundColor = .tvingWhite
            saveButton.layer.borderWidth = 1
            saveButton.layer.borderColor = (UIColor.gray2.cgColor)
        }
    }
}

extension CreateNickname_tvingView: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        deleteButton.isEnabled = true
        deleteButton.addTarget(self, action: #selector(deleteNickname), for: .touchUpInside)
    }
}
