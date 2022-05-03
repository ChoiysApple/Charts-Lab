//
//  PieViewController.swift
//  ChartsLab
//
//  Created by Daegeon Choi on 2022/04/26.
//

import UIKit
import Charts

class PieViewController: UIViewController {
    
    // MARK: Instance
    let category = ["work", "hobby", "study", "rest"]
    let rate = [60.0, 80.0, 26.0, 30.0]
    
    let dataColors: [UIColor] = [
        UIColor(hex: "#125B50FF")!,
        UIColor(hex: "#F8B400FF")!,
        UIColor(hex: "#85586FFF")!,
        UIColor(hex: "#FF6363FF")!
    ]
    
    lazy var pieChartView: PieChartView = {
        let chart = PieChartView()
        
        chart.legend.enabled = false
        chart.entryLabelFont = UIFont(name: "AvenirNext-Bold", size: 20)
        
        chart.animate(yAxisDuration: 2.0)
         
        return chart
    }()

    // MARK: ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(pieChartView)
        
        pieChartView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalToSuperview().dividedBy(2)
        }

        setData(dataPoints: category, values: rate)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        pieChartView.animate(yAxisDuration: 2.0)
    }
    
    // MARK: Set Data to BarChart
    func setData(dataPoints: [String], values: [Double]) {
        var dataEntries: [ChartDataEntry] = []
        for i in 0..<dataPoints.count {
          let dataEntry = PieChartDataEntry(value: values[i], label: dataPoints[i], data: dataPoints[i] as AnyObject)
          dataEntries.append(dataEntry)
        }
        
        let pieChartDataSet = PieChartDataSet(entries: dataEntries, label: "Complete")
        pieChartDataSet.colors = dataColors
        
        // create Value Formatter
        let percentFormatter = NumberFormatter()
        percentFormatter.numberStyle = .percent
        percentFormatter.maximumIntegerDigits = 3
        percentFormatter.multiplier = 1.0
        percentFormatter.percentSymbol = "%"
        pieChartDataSet.valueFormatter = PercentValueFormatter(numberFormatter: percentFormatter)
        
        let pieChartData = PieChartData(dataSet: pieChartDataSet)
        
        pieChartView.data = pieChartData
    }

}
