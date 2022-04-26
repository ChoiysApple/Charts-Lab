//
//  PercentValueFormatter.swift
//  ChartLab
//
//  Created by Daegeon Choi on 2022/04/26.
//

import Charts

//class PercentValueFormatter: AxisValueFormatter {
//
//    func stringForValue(_ value: Double, axis: AxisBase?) -> String {
//        return String(format: "%02u", value) + "%"
//    }
//}

class PercentValueFormatter: ValueFormatter {
    func stringForValue(_ value: Double, entry: ChartDataEntry, dataSetIndex: Int, viewPortHandler: ViewPortHandler?) -> String {
        return String(format: "%02u", value) + "%"
    }
}

class HideValueFormatter: ValueFormatter {
    func stringForValue(_ value: Double, entry: ChartDataEntry, dataSetIndex: Int, viewPortHandler: ViewPortHandler?) -> String {
        return ""
    }
}

