//
//  ResultViewController.swift
//  12_Tipsy
//
//  Created by pvl kzntsv on 21.02.2023.
//

import UIKit


class ResultViewController: UIViewController {
    
    let totalPerPersonView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.8434641361, green: 0.9779344201, blue: 0.9207237363, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .center
        return view
    }()
    
    let totalPerPersonLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Total for person"
        label.font = .systemFont(ofSize: 30)
        label.textColor = .systemGray
        return label
    }()
    
    let totalLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "56.32"
        label.font = .systemFont(ofSize: 45, weight: .bold)
        label.textColor = #colorLiteral(red: 0.001213123207, green: 0.6911759377, blue: 0.4189120829, alpha: 1)
        return label
    }()
    
    let splitBetweenLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Split between 2 people with 10% tip"
        label.font = .systemFont(ofSize: 25)
        label.textColor = .systemGray
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = false
        label.textAlignment = .center
        return label
    }()
    
    let recalculateButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Recalculate", for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.001213123207, green: 0.6911759377, blue: 0.4189120829, alpha: 1)
        button.titleLabel?.font = .systemFont(ofSize: 35)
        button.layer.cornerRadius = 10
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    func setupUI() {
        view.backgroundColor = .white
        view.addSubview(totalPerPersonView)
        view.addSubview(splitBetweenLabel)
        view.addSubview(recalculateButton)
        totalPerPersonView.addSubview(totalPerPersonLabel)
        totalPerPersonView.addSubview(totalLabel)

    }
    
    func setConstraints() {
        
        NSLayoutConstraint.activate([
            
            totalPerPersonView.topAnchor.constraint(equalTo: view.topAnchor),
            totalPerPersonView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            totalPerPersonView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            totalPerPersonView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.4),
            
            totalPerPersonLabel.centerXAnchor.constraint(equalTo: totalPerPersonView.centerXAnchor),
            totalPerPersonLabel.centerYAnchor.constraint(equalTo: totalPerPersonView.centerYAnchor),
            
            
            totalLabel.centerXAnchor.constraint(equalTo: totalPerPersonView.centerXAnchor),
            totalLabel.topAnchor.constraint(equalTo: totalPerPersonLabel.bottomAnchor),
            
            splitBetweenLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            splitBetweenLabel.topAnchor.constraint(equalTo: totalPerPersonView.bottomAnchor, constant: 50),
            splitBetweenLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50),
            splitBetweenLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50),
            
            recalculateButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            recalculateButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            recalculateButton.widthAnchor.constraint(equalToConstant: 255),
            recalculateButton.heightAnchor.constraint(equalToConstant: 55)
            
        ])
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setConstraints()
    }
    
    
}














   
    

