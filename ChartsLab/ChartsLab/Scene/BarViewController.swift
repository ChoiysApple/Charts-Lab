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
        
        let valFormatter = NumberFormatter()
        valFormatter.numberStyle = .percent
        valFormatter.maximumFractionDigits = 2
        
        chart.xAxis.labelPosition = .bottom
        chart.xAxis.valueFormatter = IndexAxisValueFormatter(values: days)
        chart.xAxis.removeAllLimitLines()
        chart.xAxis.drawAxisLineEnabled = false
        
        chart.leftAxis.enabled = false
//        chart.leftAxis.axisMaximum = 100.0
//        chart.leftAxis.axisMinimum = 0.0
//        chart.leftAxis.removeAllLimitLines()
//        chart.leftAxis.drawAxisLineEnabled = false
        
        
        
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
        
//        setChartBackground()
        setChart(data: achievementRate)
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
        chartDataSet.colors = [UIColor(hex: "#6563BEFF")!]  // bar color of this data

        // convert data into BarChart
        let chartData = BarChartData(dataSet: chartDataSet)
        chartData.barWidth = 0.5     // bar width of this data
        
//        let valFormatter = NumberFormatter()
//        valFormatter.numberStyle = .percent
//        valFormatter.maximumFractionDigits = 0
//        valFormatter.maximumIntegerDigits = 2
//        valFormatter.minimumIntegerDigits = 0
//        valFormatter.minimumFractionDigits = 0
//        valFormatter.percentSymbol = "%"
//
//        let format = NumberFormatter()
//        format.numberStyle = .percent
                
        chartData.setValueFormatter(PercentValueFormatter())
        
        
//        chartData.setValueFormatter(PercentValueFormatter())
        
    
        // set data to barChartView
        barChartView.data = chartData
        
    }
    
    func setChartBackground() {
        // Create DataEntry with data
        var dataEntries: [BarChartDataEntry] = []
        for i in 0..<7 {
            dataEntries.append(BarChartDataEntry(x: Double(i), y: 100.0))
        }

        // Create DataSet with Index
        let chartDataSet = BarChartDataSet(entries: dataEntries, label: "")
        chartDataSet.colors = [.systemGray]  //

        // convert data into BarChart
        let chartData = BarChartData(dataSet: chartDataSet)
        chartData.barWidth = 0.5     // bar width of this data
        chartData.setValueFormatter(HideValueFormatter())
        
        barChartView.data = chartData
    }


}
