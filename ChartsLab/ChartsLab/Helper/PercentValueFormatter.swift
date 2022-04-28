//
//  PercentValueFormatter.swift
//  ChartLab
//
//  Created by Daegeon Choi on 2022/04/26.
//

import Foundation
import Charts

class PercentValueFormatter: NSObject, ValueFormatter {
    
    fileprivate var numberFormatter: NumberFormatter?

    convenience init(numberFormatter: NumberFormatter) {
        self.init()
        self.numberFormatter = numberFormatter
    }
    
    func stringForValue(_ value: Double, entry: ChartDataEntry, dataSetIndex: Int, viewPortHandler: ViewPortHandler?) -> String {
        
        guard let numberFormatter = numberFormatter else { return "" }
               
        return numberFormatter.string(for: value)!
        
    }
}


