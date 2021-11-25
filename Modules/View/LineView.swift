//
//  LineView.swift
//  WheelOfFortune
//
//  Created by Nikita on 20.11.2021.
//

import UIKit

class LineView: UIView {
    
    var subTitle: UILabel = {
        let subTitle = UILabel()
        subTitle.text = "?"
        return subTitle
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(subTitle)
        
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        
        guard let context = UIGraphicsGetCurrentContext() else { return }
        
        let points = [
            CGPoint(x: bounds.minX, y: bounds.minY + bounds.height / 2),
            CGPoint(x: bounds.width, y: bounds.minY),
            CGPoint(x: bounds.width, y: bounds.height),
        ]
        
        context.beginPath()
        context.addLines(between: points)
        context.closePath()
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = context.path
        layer.mask = shapeLayer
    }
    
    private func setupConstraints() {
        subTitle.translatesAutoresizingMaskIntoConstraints = false
        
        let subTitleConstraint = [
            subTitle.rightAnchor.constraint(equalTo: rightAnchor, constant: -20),
            subTitle.centerYAnchor.constraint(equalTo: centerYAnchor)
        ]
        
        NSLayoutConstraint.activate(subTitleConstraint)
    }
}
