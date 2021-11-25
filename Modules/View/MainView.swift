//
//  MainView.swift
//  WheelOfFortune
//
//  Created by Nikita on 19.11.2021.
//

import UIKit

class MainView: UIView {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 34, weight: .bold)
        label.text = "WheelOfFortune"
        label.textAlignment = .center
        label.textColor = .white
        
        return label
    }()
    
    let wheel: WheelView = {
        let wheel = WheelView()
        return wheel
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(titleLabel)
        addSubview(wheel)
        
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        wheel.translatesAutoresizingMaskIntoConstraints = false
        
        var constraints = [NSLayoutConstraint]()
        
        let titleLabel = [
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: wheel.topAnchor)
        ]
        
        let wheelConstraint = [
            wheel.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
            wheel.rightAnchor.constraint(equalTo: rightAnchor, constant: -20),
            wheel.heightAnchor.constraint(equalTo: wheel.widthAnchor),
            wheel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ]
        
        constraints.append(contentsOf: titleLabel)
        constraints.append(contentsOf: wheelConstraint)
        
        NSLayoutConstraint.activate(constraints)
    }
}
