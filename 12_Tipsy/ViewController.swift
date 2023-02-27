//
//  ViewController.swift
//  12_Tipsy
//
//  Created by pvl kzntsv on 15.02.2023.
//

import UIKit

class ViewController: UIViewController {
    
// MARK: UI Elements:
    
    private let billStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.spacing = 5
        stackView.alignment = .center
        return stackView
    }()
    
    private let enterBillTotalLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Helvetica", size: 25)
        label.textColor = .lightGray
        label.textAlignment = .left
        label.text = "Enter bill total"
        return label
    }()
    
    private lazy var billTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.font = UIFont(name: "Helvetica", size: 40)
        textField.placeholder = "e.g 123.56"
        textField.textAlignment = .center
        return textField
    }()
    
    // MARK: view
    
    private let selectingView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = #colorLiteral(red: 0.8434641361, green: 0.9779344201, blue: 0.9207237363, alpha: 1)
//        view.contentMode = .scaleToFill
//        view.contentMode = .center
        
        return view
    }()
    
    private let selectingContentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 26
        stackView.distribution = .fillProportionally
//        stackView.contentMode = .center
        stackView.alignment = .center
        return stackView
    }()
    
    private let selectTipLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Helvetica", size: 25)
        label.textColor = .lightGray
        label.textAlignment = .left
        label.contentMode = .scaleAspectFill
        label.text = "Select Tip"
        
        return label
    }()
    
    private let percentButtonsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fillEqually
        stackView.spacing = 30
        stackView.alignment = .center
        return stackView
    }()
    
    func makePercentButtons() {
        let array = ["10%", "20%", "30%"]
        for i in array {
            let button = UIButton(type: .system)
            button.translatesAutoresizingMaskIntoConstraints = false
            button.titleLabel?.font = UIFont(name: "Helvetica", size: 35)
            button.setTitle(i, for: .normal)
            button.tintColor = #colorLiteral(red: 0.001213123207, green: 0.6911759377, blue: 0.4189120829, alpha: 1)
            button.titleLabel?.textColor = #colorLiteral(red: 0.001213123207, green: 0.6911759377, blue: 0.4189120829, alpha: 1)
            button.isSelected = true
            percentButtonsStackView.addArrangedSubview(button)
            
        }
    }
    
    private let chooseSplitLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Helvetica", size: 25)
        label.textColor = .lightGray
        label.textAlignment = .left
        label.contentMode = .scaleAspectFill
        label.text = "Choose split"
        return label
    }()
    
    private let stepperStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 10
//        stackView.contentMode = .center
//        stackView.alignment = .center
//        stackView.distribution = .fill
        return stackView
    }()
    
    private lazy var splitNumberLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 35)
//        label.textAlignment = .center
        label.text = "2"
        label.textColor = #colorLiteral(red: 0.001213123207, green: 0.6911759377, blue: 0.4189120829, alpha: 1)
        return label
    }()
    
    private lazy var splitNumberStepper: UIStepper = {
        let stepper = UIStepper()
        stepper.translatesAutoresizingMaskIntoConstraints = false
        stepper.minimumValue = 2
        stepper.maximumValue = 25
        stepper.tintColor = #colorLiteral(red: 0.001213123207, green: 0.6911759377, blue: 0.4189120829, alpha: 1)
//        stepper.autorepeat = true
//        stepper.isContinuous = true
        return stepper
    }()
    
    private lazy var calculateButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Calculate", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 35)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        button.backgroundColor = #colorLiteral(red: 0.001213123207, green: 0.6911759377, blue: 0.4189120829, alpha: 1)
        return button
    }()
    
    
//MARK: setupUI
    func setupUI() {
        view.backgroundColor = .white
        billStackView.addArrangedSubview(enterBillTotalLabel)
        billStackView.addArrangedSubview(billTextField)
        
        stepperStackView.addArrangedSubview(splitNumberLabel)
        stepperStackView.addArrangedSubview(splitNumberStepper)
        
        
        selectingContentStackView.addArrangedSubview(selectTipLabel)
        selectingContentStackView.addArrangedSubview(percentButtonsStackView)
        selectingContentStackView.addArrangedSubview(chooseSplitLabel)
        selectingContentStackView.addArrangedSubview(stepperStackView)
        selectingView.addSubview(selectingContentStackView)
        
        makePercentButtons()
        
        view.addSubview(billStackView)
        view.addSubview(selectingView)
        view.addSubview(calculateButton)
    }
    
//MARK: constraints
    func setConstraints() {
        NSLayoutConstraint.activate([
            billStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            billStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            billStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            billStackView.bottomAnchor.constraint(equalTo: selectingView.topAnchor, constant: -20),
            billStackView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.2),
            
            enterBillTotalLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            enterBillTotalLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            
            billTextField.leadingAnchor.constraint(equalTo: billStackView.leadingAnchor),
            billTextField.trailingAnchor.constraint(equalTo: billStackView.trailingAnchor),

            selectingView.topAnchor.constraint(equalTo: billStackView.bottomAnchor, constant: 20),
            selectingView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            selectingView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            selectingView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            selectingContentStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            selectingContentStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            selectingContentStackView.topAnchor.constraint(equalTo: selectingView.topAnchor, constant: 20),
           
            selectTipLabel.leadingAnchor.constraint(equalTo: selectingContentStackView.leadingAnchor, constant: 30),
            selectTipLabel.trailingAnchor.constraint(equalTo: selectingContentStackView.trailingAnchor, constant: -30),
            
            chooseSplitLabel.leadingAnchor.constraint(equalTo: selectingContentStackView.leadingAnchor, constant: 30),
            chooseSplitLabel.trailingAnchor.constraint(equalTo: selectingContentStackView.trailingAnchor, constant: -30),
            

            calculateButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            calculateButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            calculateButton.widthAnchor.constraint(equalToConstant: 200),
            calculateButton.heightAnchor.constraint(equalToConstant: 55)
        ])
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setConstraints()
        // Do any additional setup after loading the view.
    }


}

