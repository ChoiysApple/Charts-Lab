//
//  ProgressViewController.swift
//  ChartsLab
//
//  Created by Daegeon Choi on 2022/04/27.
//

import UIKit

class ProgressViewController: UIViewController {
    
    lazy var fullProgressView = RoundProgressBarView(progress: Double.random(in: 0...100), type: .full)
    lazy var semiProgressView = RoundProgressBarView(progress: Double.random(in: 0...100), type: .semi)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(fullProgressView)
        fullProgressView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().dividedBy(2)
        }
        
        view.addSubview(semiProgressView)
        semiProgressView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().dividedBy(0.75)
        }

    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        fullProgressView.progressAnimation(duration: 1.5)
        semiProgressView.progressAnimation(duration: 1.5)
    }
    
}
