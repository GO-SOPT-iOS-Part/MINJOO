//
//  Auth_tvingView.swift
//  SOPT_iOS_SEMINAR
//
//  Created by Minjoo Kim on 2023/04/09.
//

import UIKit
import SnapKit
import Then

@frozen
enum loginButtonStatus: String {
    
    case enable
    case unable
    
    var backgroundColor: UIColor {
            switch self {
            case .enable:
                return .tvingRed
            case .unable:
                return .tvingBlack
            }
        }
    
    var titleColor: UIColor {
        switch self {
        case .enable:
            return .tvingWhite
        case .unable:
            return .gray2
        }
    }
    
    var borderWidth: Int {
        switch self {
        case .enable:
            return 0
        case .unable:
            return 1
        }
    }
}

@frozen
enum buttonStatus: String {
    
    case show
    case notShow
    
    var hiddenState: Bool {
        switch self {
        case .show:
            return false
        case .notShow:
            return true
        }
    }
}


final class Auth_tvingView: UIViewController {
    
    public var text: String?
    
    func textFieldStatus(status: loginButtonStatus) {
        loginButton.layer.backgroundColor = status.backgroundColor.cgColor
        loginButton.setTitleColor(status.titleColor, for: .normal)
        loginButton.layer.borderWidth  = CGFloat(status.borderWidth)
    }
    
    func deleteIdButtonStatus(status: buttonStatus) {
        deleteIdButton.isHidden = status.hiddenState
    }
    
    func deletePasswordButtonStatus(status: buttonStatus) {
        deletePasswordButton.isHidden = status.hiddenState
    }
    
    func eyeButtonStatus(status: buttonStatus) {
        eyeButton.isHidden = status.hiddenState
    }
    
    private let backButton = UIButton().then {
        $0.setBackgroundImage(UIImage(named: "btn_before"), for: .normal)
    }
    
    private let nameLabel = UILabel().then {
        $0.text = "TVING ID 로그인"
        $0.font = UIFont(name: "Pretendard-Medium", size: 23)
        $0.textColor = .gray1
        $0.textAlignment = .center
        $0.attributedText = NSMutableAttributedString(string: "TVING ID 로그인", attributes: [NSAttributedString.Key.kern: -0.5])
    }
    
    private lazy var idTextField = UITextField().then {
        $0.placeholder = "아이디"
        $0.font = .tvingSemiBold(ofSize: 15)
        $0.backgroundColor = .gray4
        $0.textColor = .gray2
        $0.setLeftPaddingPoints(22)
        $0.setRightPaddingPoints(40)
        $0.setPlaceholderColor(.gray2)
        $0.makeCornerRound(radius: 3)
        $0.autocapitalizationType = .none
        $0.addTarget(self, action: #selector(textFieldDidChange),
                     for: UIControl.Event.editingChanged)
    }
    
    private lazy var passwordTextField = UITextField().then {
        $0.placeholder = "비밀번호"
        $0.font = .tvingSemiBold(ofSize: 15)
        $0.isSecureTextEntry = true
        $0.backgroundColor = .gray4
        $0.textColor = .gray2
        $0.setLeftPaddingPoints(22)
        $0.setRightPaddingPoints(84)
        $0.setPlaceholderColor(.gray2)
        $0.makeCornerRound(radius: 3)
        $0.addTarget(self, action: #selector(textFieldDidChange),
                     for: UIControl.Event.editingChanged)
    }
    
    private lazy var deleteIdButton = UIButton().then {
        $0.setImage(UIImage(named: "x-circle"), for: .normal)
        $0.addTarget(self, action: #selector(deleteId),
                     for: .touchUpInside)
        $0.isHidden = true
    }
    
    private lazy var eyeButton = UIButton().then {
        $0.setImage(UIImage(named: "eye-slash"), for: .normal)
        $0.addTarget(self, action: #selector(showPassword),
                     for: .touchUpInside)
        $0.isHidden = true
    }

    private lazy var deletePasswordButton = UIButton().then {
        $0.setImage(UIImage(named: "x-circle"), for: .normal)
        $0.addTarget(self, action: #selector(deletePassword),
                     for: .touchUpInside)
        $0.isHidden = true
    }
    
    private lazy var loginButton = UIButton().then {
        $0.setTitle("로그인하기", for: .normal)
        $0.backgroundColor = .black
        $0.setTitleColor(.gray2, for: .normal)
        $0.titleLabel?.font = .tvingSemiBold(ofSize: 14)
        $0.titleLabel?.textAlignment = .center
        $0.makeBorder(width: 1, color: .gray4)
        $0.makeCornerRound(radius: 3)
        $0.addTarget(self,
                     action: #selector(loginButtonTapped),
                     for: .touchUpInside)
    }
    
    private let findId = UIButton().then {
        $0.setTitle("아이디 찾기", for: .normal)
        $0.titleLabel?.font = UIFont(name: "Pretendard-SemiBold", size: 14)
        $0.setTitleColor(.gray2, for: .normal)
        $0.kern()
    }
    
    private let findPassword = UIButton().then {
        $0.setTitle("비밀번호 찾기", for: .normal)
        $0.titleLabel?.font = UIFont(name: "Pretendard-SemiBold", size: 14)
        $0.setTitleColor(.gray2, for: .normal)
        $0.kern()
        
    }
    
    private let makeAccount = UIButton().then {
        $0.setTitle("아직 계정이 없으신가요?", for: .normal)
        $0.titleLabel?.font = UIFont(name: "Pretendard-SemiBold", size: 14)
        $0.setTitleColor(.gray3, for: .normal)
        $0.frame = CGRect(x: 0, y: 0, width: 129, height: 22)
        $0.layer.borderColor = UIColor.gray4.cgColor
        $0.kern()
    }
    
    private lazy var makeNickname = UIButton().then {
        $0.setTitle("닉네임 만들러가기", for: .normal)
        $0.backgroundColor = .black
        $0.setTitleColor(.gray2, for: .normal)
        $0.titleLabel?.font = .tvingRegular(ofSize: 14)
        $0.titleLabel?.textAlignment = .center
        $0.setUnderline()
        $0.addTarget(self,
                     action: #selector(createNicknameButtonTapped),
                     for: .touchUpInside)
    }
    
    private let line1 = UILabel().then {
        $0.frame = CGRect(x: 0, y: 0, width: 0, height: 12)
        var stroke = UIView()
        stroke.bounds = $0.bounds.insetBy(dx: -0.5, dy: -0.5)
        stroke.center = $0.center
        $0.addSubview(stroke)
        $0.bounds = $0.bounds.insetBy(dx: -0.5, dy: -0.5)
        stroke.layer.borderWidth = 1
        stroke.layer.borderColor = UIColor.gray4.cgColor
    }
    
    private lazy var nicknameTextField = UITextField().then {
        $0.text = ""
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        idTextField.delegate = self
        passwordTextField.delegate = self
        
        style()
        setLayout()
    }
}

private extension Auth_tvingView {
    func style() {
        view.backgroundColor = .black
    }
    
    func setLayout() {
        
        view.addSubviews(nameLabel, backButton, idTextField, passwordTextField, loginButton, findId, findPassword, makeAccount, makeNickname, line1)
        idTextField.addSubview(deleteIdButton)
        passwordTextField.addSubviews(eyeButton, deletePasswordButton)
        
        nameLabel.snp.makeConstraints {
            
            $0.top.equalTo(90)
            $0.leading.equalTo(109)
            $0.width.equalTo(156)
            $0.height.equalTo(37)
        }
        
        backButton.snp.makeConstraints {
            $0.top.equalTo(77)
            $0.leading.equalTo(10)
            $0.width.equalTo(8)
            $0.height.equalTo(15)
        }
        
        idTextField.snp.makeConstraints {
            $0.top.equalTo(158)
            $0.trailing.leading.equalToSuperview().inset(20)
            $0.width.equalTo(335)
            $0.height.equalTo(52)
        }
        
        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(217)
            $0.trailing.leading.equalToSuperview().inset(20)
            $0.width.equalTo(335)
            $0.height.equalTo(52)
        }
        
        deleteIdButton.snp.makeConstraints {
            $0.centerY.equalTo(idTextField.snp.centerY)
            $0.trailing.equalToSuperview().offset(-20)
            $0.size.equalTo(20)
        }
        
        deletePasswordButton.snp.makeConstraints {
            $0.centerY.equalTo(passwordTextField.snp.centerY)
            $0.trailing.equalToSuperview().offset(-56)
            $0.size.equalTo(20)
        }
        
        eyeButton.snp.makeConstraints {
            $0.centerY.equalTo(passwordTextField.snp.centerY)
            $0.trailing.equalToSuperview().offset(-20)
            $0.size.equalTo(22)
        }
        
        loginButton.snp.makeConstraints {
            $0.top.equalTo(290)
            $0.trailing.leading.equalToSuperview().inset(20)
            $0.width.equalTo(335)
            $0.height.equalTo(52)
        }
        
        findId.snp.makeConstraints {
            $0.top.equalTo(373)
            $0.leading.equalTo(85)
            $0.width.equalTo(62)
            $0.height.equalTo(22)
        }
        
        findPassword.snp.makeConstraints {
            $0.top.equalTo(373)
            $0.leading.equalTo(216)
            $0.width.equalTo(73)
            $0.height.equalTo(22)
        }
        
        makeAccount.snp.makeConstraints {
            $0.top.equalTo(423)
            $0.leading.equalTo(51)
            $0.width.equalTo(130)
            $0.height.equalTo(22)
        }
        
        makeNickname.snp.makeConstraints {
            $0.top.equalTo(426)
            $0.leading.equalTo(197)
            $0.width.equalTo(128)
            $0.height.equalTo(22)
        }
        
        line1.snp.makeConstraints {
            $0.top.equalTo(378)
            $0.leading.equalTo(180)
        }
    }
    
    @objc
    func deleteId() {
        idTextField.text?.removeAll()
        deleteIdButton.isHidden = true
        textFieldStatus(status: .unable)
    }
    
    @objc
    func deletePassword() {
        passwordTextField.text?.removeAll()
        deletePasswordButton.isHidden = true
        textFieldStatus(status: .unable)
    }
    
    // MARK: textField를 검사해서 deleteButton을 표시/삭제 하고, 로그인하기 버튼을 활성화한다.
    @objc func textFieldDidChange(textField: UITextField){
        guard let idText = self.idTextField.text  else {return}
        guard let pwText = self.passwordTextField.text  else {return}
        
        switch textField {
        case idTextField:
            if idText.isEmpty{
                deleteIdButton.isHidden = true
            }
            else {
                deleteIdButton.isHidden = false
            }
        case passwordTextField:
            if pwText.isEmpty {
                deletePasswordButton.isHidden = true
            }
            else {
                deletePasswordButton.isHidden = false
            }
        default: break
        }
        
        if !idText.isEmpty && !pwText.isEmpty {
            textFieldStatus(status: .enable)
        } else {
            textFieldStatus(status: .unable)
            

    }
}
    // MARK: 패스워드 보이기
    @objc
    func showPassword() {
        passwordTextField.isSecureTextEntry.toggle()
        if passwordTextField.isSecureTextEntry {
            eyeButton.setImage(UIImage(named: "eye-slash"), for: .normal)
        } else {
            eyeButton.setImage(UIImage(named: "eye"), for: .normal)
        }
    }
    
    // MARK: 로그인버튼
    
    @objc
    func loginButtonTapped() {
        lazy var text = nicknameTextField.text
        if (self.nicknameTextField.text?.isEmpty ?? true) {
            text = idTextField.text
        }
        let SecondViewController = Welcome_tvingView()
        SecondViewController.text = text
        SecondViewController.modalPresentationStyle = .fullScreen
        self.present(SecondViewController, animated: true)
        passwordTextField.makeBorder(width: 0, color: .gray3)
    }
    
    @objc
    func createNicknameButtonTapped() {
        let thirdViewController = CreateNickname_tvingView()
        thirdViewController.delegate = self
        thirdViewController.modalPresentationStyle = .overCurrentContext
        self.present(thirdViewController, animated: false) {
            thirdViewController.modalNicknameView(height: UIScreen.main.bounds.height * 0.5)
        }
    }
}

extension Auth_tvingView: nicknameProtocol {
    
    func nicknameData(text: String) {
        nicknameTextField.text = text
    }
}

extension Auth_tvingView: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        guard let id = idTextField.text else { return }
        guard let password = passwordTextField.text else { return }
        
        if !id.isEmpty && !password.isEmpty {
            textFieldStatus(status: .enable)
        } else {
            textFieldStatus(status: .unable)
        }
        
        textField.becomeFirstResponder()
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.gray2.cgColor
        
        if textField == idTextField && !textField.text!.isEmpty {
            deleteIdButtonStatus(status: .show)
        }
        if textField == passwordTextField && !textField.text!.isEmpty {
            deletePasswordButtonStatus(status: .show)
            eyeButtonStatus(status: .show)
        }
        else if textField == passwordTextField && textField.text!.isEmpty {
            eyeButtonStatus(status: .show)
        }
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.layer.borderWidth = 0
        
        deleteIdButtonStatus(status: .notShow)
        deletePasswordButtonStatus(status: .notShow)
        eyeButtonStatus(status: .notShow)
        
        if idTextField.hasText && passwordTextField.hasText {
            textFieldStatus(status: .enable)
        } else {
            textFieldStatus(status: .unable)
        }
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        
        deleteIdButtonStatus(status: .show)
        deletePasswordButtonStatus(status: .show)
        eyeButtonStatus(status: .show)
        
        return true
    }
    
    func textFieldShouldReturn(_ idTextField: UITextField) -> Bool {
        idTextField.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        super.touchesBegan(touches, with: event) //
        self.view.endEditing(true)
        deleteIdButtonStatus(status: .notShow)
        deletePasswordButtonStatus(status: .notShow)
        eyeButtonStatus(status: .notShow)
    }

}

