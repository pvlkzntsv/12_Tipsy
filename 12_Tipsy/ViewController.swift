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
        view.contentMode = .scaleToFill
        
        return view
    }()
    
    private let selectingContentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 26
        stackView.distribution = .fillEqually
        stackView.contentMode = .scaleToFill
        stackView.alignment = .center
        return stackView
    }()
    
    private let selectTipLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Select Tip"
        return label
    }()
    
    private let percentButtonsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        stackView.alignment = .center
        return stackView
    }()
    
    func makePercentButtons() {
        let array = ["10%", "20%", "30%"]
        for i in array {
            let button = UIButton(type: .system)
            button.translatesAutoresizingMaskIntoConstraints = false
            button.setTitle(i, for: .normal)
            percentButtonsStackView.addArrangedSubview(button)
            
        }
    }
    
    private let chooseSplitLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Choose split"
        return label
    }()
    
    private let stepperStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var splitNumberLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "2"
        return label
    }()
    
    private lazy var splitNumberStepper: UIStepper = {
        let stepper = UIStepper()
        stepper.translatesAutoresizingMaskIntoConstraints = false
        stepper.minimumValue = 2
        stepper.maximumValue = 25
        stepper.tintColor = #colorLiteral(red: 0.001213123207, green: 0.6911759377, blue: 0.4189120829, alpha: 1)
        return stepper
    }()
    
    private lazy var calculateButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Calculate", for: .normal)
        return button
    }()
    
    
//MARK: setupUI
    func setupUI() {
        view.backgroundColor = .white
        billStackView.addArrangedSubview(enterBillTotalLabel)
        billStackView.addArrangedSubview(billTextField)
        
        stepperStackView.addArrangedSubview(splitNumberLabel)
        stepperStackView.addArrangedSubview(splitNumberStepper)
        
        selectingView.addSubview(selectingContentStackView)
        selectingContentStackView.addArrangedSubview(selectTipLabel)
        selectingContentStackView.addArrangedSubview(percentButtonsStackView)
        selectingContentStackView.addArrangedSubview(chooseSplitLabel)
        selectingContentStackView.addArrangedSubview(stepperStackView)
        
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
            
            enterBillTotalLabel.leadingAnchor.constraint(equalTo: billStackView.leadingAnchor, constant: 50),
            enterBillTotalLabel.trailingAnchor.constraint(equalTo: billStackView.trailingAnchor, constant: -50),
            
            billTextField.leadingAnchor.constraint(equalTo: billStackView.leadingAnchor),
            billTextField.trailingAnchor.constraint(equalTo: billStackView.trailingAnchor),

            selectingView.topAnchor.constraint(equalTo: billStackView.bottomAnchor, constant: 20),
            selectingView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            selectingView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            selectingView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            
            calculateButton.topAnchor.constraint(equalTo: selectingView.bottomAnchor, constant: 100),
            calculateButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            calculateButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setConstraints()
        // Do any additional setup after loading the view.
    }


}

