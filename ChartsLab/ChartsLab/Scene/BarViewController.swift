/*
<Docs>
How to Make Rounded-Cornered Bar:
https://microeducate.tech/rounded-bars-in-ios-charts/
 
Value display formatting
https://stackoverflow.com/questions/44813899/ios-charts-valueformatter
 
Chart Inspired by:
https://dribbble.com/shots/16562848-Team-Management-App-Concept
 
*/

import UIKit
import Charts
import Then
import SnapKit

class BarViewController: UIViewController {
    
    let achievementRate = [20.0, 40.0, 60.0, 30.0, 23.0, 89.0, 50.0]
    let days = ["Sun", "Mon", "Tue", "Wed", "Thr", "Fri", "Sat"]
        
    lazy var barChartView: BarChartView = {
        let chart = BarChartView()
        
        chart.doubleTapToZoomEnabled = false    // Disable tap-to-zoom
        chart.rightAxis.enabled = false         // Remove right Axis
        chart.legend.enabled = false            // Remove Legend
        chart.highlightPerTapEnabled = false
                
        // Bottom Axis
        chart.xAxis.labelPosition = .bottom
        chart.xAxis.valueFormatter = IndexAxisValueFormatter(values: days)
        chart.xAxis.removeAllLimitLines()
        chart.xAxis.drawAxisLineEnabled = false
        
        // Left Axiz
        chart.leftAxis.enabled = false
        
        // Animation
        chart.animate(yAxisDuration: 2.0)
        
        // Remove Grid
        chart.xAxis.drawGridLinesEnabled = false
        chart.leftAxis.drawGridLinesEnabled = false
        
        return chart
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(barChartView)
        
        barChartView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalToSuperview().dividedBy(2)
        }
        
        setChart(data: achievementRate)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        barChartView.animate(yAxisDuration: 2.0)
    }
        
    func setChart(data: [Double]) {
        print(#function)
        
        // Create DataEntry with data
        var dataEntries: [BarChartDataEntry] = []
        for i in 0..<data.count {
            dataEntries.append(BarChartDataEntry(x: Double(i), y: data[i]))
        }

        // Create DataSet with Index
        let chartDataSet = BarChartDataSet(entries: dataEntries, label: "Achivement")
        chartDataSet.colors = [UIColor(hex: "#6563BEFF")!]  // bar color of this date
        
        // create Value Formatter
        let percentFormatter = NumberFormatter()
        percentFormatter.numberStyle = .percent
        percentFormatter.maximumIntegerDigits = 2
        percentFormatter.multiplier = 1.0
        percentFormatter.percentSymbol = "%"
        chartDataSet.valueFormatter = PercentValueFormatter(numberFormatter: percentFormatter)
                
        // convert data into BarChart
        let chartData = BarChartData(dataSet: chartDataSet)
        chartData.barWidth = 0.5    // bar width = default * 0.5
    
        // set data to barChartView
        barChartView.data = chartData
        
    }


}
