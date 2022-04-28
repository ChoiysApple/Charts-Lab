//
//  MarkerView.swift
//  ChartsLab
//
//  Created by Daegeon Choi on 2022/04/28.
//

import Charts
class BarMarkerView: MarkerView {
    
    lazy var dayLabel = UILabel().then {
        $0.font = UIFont(name: "AvenirNext-medium", size: UIFont.labelFontSize)
    }
    
    lazy var percentLabel = UILabel().then {
        $0.font = UIFont(name: "AvenirNext", size: UIFont.labelFontSize)
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initUI()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initUI()
    }
    
    private func initUI() {
        
        
        
    }

}
