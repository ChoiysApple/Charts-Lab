//
//  ProgressViewController.swift
//  ChartsLab
//
//  Created by Daegeon Choi on 2022/04/27.
//

import UIKit

class ProgressViewController: UIViewController {
    
    lazy var progressBarView = RoundProgressBarView()
    
    lazy var progressLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(progressBarView)
        view.addSubview(progressLabel)
        
        progressBarView.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        progressLabel.snp.makeConstraints { make in
            make.center.equalTo(progressBarView.center)
        }
        progressLabel.text = "100%"
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        progressBarView.progressAnimation(duration: 2.0)
    }
    

}
