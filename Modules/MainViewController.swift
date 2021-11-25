//
//  MainViewController.swift
//  WheelOfFortune
//
//  Created by Nikita on 19.11.2021.
//

import UIKit

class MainViewController: UIViewController {
    
    var points = Array(1...10)
    
    var mainView: MainView {
        return view as! MainView
    }
    
    override func loadView() {
        let view = MainView()
        self.view = view
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        mainView.wheel.points = points
        mainView.wheel.setupWheel()
    }
}

