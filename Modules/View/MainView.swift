//
//  MainView.swift
//  WheelOfFortune
//
//  Created by Nikita on 19.11.2021.
//

import UIKit

class MainView: UIView {
    
    let wheel: WheelView = {
        let wheel = WheelView(numberOfTriangle: 21)
        return wheel
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(wheel)
        
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        wheel.translatesAutoresizingMaskIntoConstraints = false
        
        let wheelConstraint = [
            wheel.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
            wheel.rightAnchor.constraint(equalTo: rightAnchor, constant: -20),
            wheel.heightAnchor.constraint(equalTo: wheel.widthAnchor),
            wheel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ]
        
        NSLayoutConstraint.activate(wheelConstraint)
    }
}
