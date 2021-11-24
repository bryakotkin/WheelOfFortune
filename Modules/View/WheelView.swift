//
//  WheelView.swift
//  WheelOfFortune
//
//  Created by Nikita on 20.11.2021.
//

import UIKit

class WheelView: UIView {
    
    var numberOfTriangle: Int
    var angle: CGFloat = 0
    var width: CGFloat = 0
    var height: CGFloat = 0
    
    var triangles: [LineView] = []
    
    init(frame: CGRect = .zero, numberOfTriangle: Int) {
        self.numberOfTriangle = numberOfTriangle
        
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setupWheel() {
        angle = CGFloat(360) / CGFloat(numberOfTriangle) / CGFloat(2)
        width = bounds.midX
        height = tan(angle * .pi / 180) * width * 2
        
        
        for index in 0..<numberOfTriangle {
            let triangle = LineView(frame: CGRect(x: bounds.midX, y: bounds.midY - height / 2, width: width, height: height))
            triangle.setAnchorPoint(CGPoint(x: 0, y: 0.5))
            triangle.transform = triangle.transform.rotated(by: CGFloat(index * 2) * angle * .pi / 180)
            let color: UIColor = Int(index) == 0 ? .fromHex(hex: 0xFFE5B4) : index % 2 == 0 ? .fromHex(hex: 0xF3F4F6) : .white
            triangle.backgroundColor = color
            
            triangles.append(triangle)
            
            addSubview(triangle)
        }
        
        setupRect()
        
        transform = transform.rotated(by: (270 + CGFloat(getRandomRotationCoefficient()) * angle * 2) * .pi / 180)
    }
    
    private func setupRect() {
        let rect = CGRect(x: bounds.minX, y: bounds.minY, width: bounds.maxX, height: bounds.maxY)

        let path = UIBezierPath(roundedRect: rect, cornerRadius: width)
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        layer.mask = shapeLayer
    }
    
    private func getRandomRotationCoefficient() -> Int {
        let arr = Array(1...numberOfTriangle)
        
        return arr.randomElement()!
    }
}
