//
//  ViewController4.swift
//  project01
//
//  Created by Minjoo Kim on 2023/04/04.
//

import UIKit
final class ViewController4: UIViewController {
    
    private let myStepper: UIStepper = {
        let stepper = UIStepper()
        stepper.minimumValue = 0
        stepper.maximumValue = 28
        stepper.value = 1
        return stepper
    }()
    
    private let myLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.textAlignment = .center
        label.text = "Attaboy!\n잘했습니다 짝짝"
        label.font = .boldSystemFont(ofSize: 20)
        return label
    }()
    
    private var value = 0
    
    
    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        style()
        setLayout()
    }
    
    @IBAction func stepperValueChanged(sender: UIStepper)
    {
        valueLabel.text = Int(sender.value).description
    }
}

private extension ViewController4 {
    func style() {
        view.backgroundColor = .white
    }
    func setLayout() {
        
        [myLabel, myStepper].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        
        NSLayoutConstraint.activate([myLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                                     myLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)])
        NSLayoutConstraint.activate([myStepper.topAnchor.constraint(equalTo: myLabel.bottomAnchor, constant: 20),
                                     myStepper.centerXAnchor.constraint(equalTo: myLabel.centerXAnchor),
                                     myStepper.heightAnchor.constraint(equalToConstant: 48)])
    }
    @objc
    func myButtonTapped() {
        if self.navigationController == nil {
            self.dismiss(animated: true, completion: nil)
        } else {
            self.navigationController?.popViewController(animated: true)
        }
    }
}

