/*
 Creating custom circle progress bar
 https://cemkazim.medium.com/how-to-create-animated-circular-progress-bar-in-swift-f86c4d22f74b
 */

import UIKit

class RoundProgressBarView: UIView {
        
    lazy var progressLabel = UILabel().then {
        $0.textColor = .black
        $0.font =  UIFont(name: "AvenirNext-medium", size: 30)
    }

    // CAShapeLayer: draws a cubic Bezier spline in its coordinate
    private var circleLayer = CAShapeLayer()        // Create Empty Circle
    private var progressLayer = CAShapeLayer()      // Fills Circle Layer
    
    // Default values
    public var progress: Double = 0
    public var type: RoundProgressBarType = .full
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    init(progress: Double, type: RoundProgressBarType) {
        super.init(frame: .zero)
        
        self.progress = progress
        self.type = type
        
        self.createCircularPath()
        
        self.addSubview(progressLabel)
        progressLabel.text = "\(String(format: "%.0f%", progress))%"
        progressLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
    
    func createCircularPath() {
        
        let fullPath = UIBezierPath(
            arcCenter: CGPoint(x: frame.size.width / 2.0, y: frame.size.height / 2.0),
            radius: 80, startAngle: type.startPoint,
            endAngle: type.endPoint,
            clockwise: true
        )
        circleLayer.path = fullPath.cgPath          // Draw circle
        circleLayer.fillColor = UIColor.clear.cgColor
        circleLayer.lineCap = .round
        circleLayer.lineWidth = 10.0
        circleLayer.strokeEnd = 1.0
        circleLayer.strokeColor = UIColor.lightGray.cgColor
        layer.addSublayer(circleLayer)                  // Add Layer
        
        let circularPath = UIBezierPath(
            arcCenter: CGPoint(x: frame.size.width / 2.0, y: frame.size.height / 2.0),
            radius: 80,
            startAngle: type.startPoint,
            endAngle: getEndPoint(percent: progress, type: type),
            clockwise: true
        )
        progressLayer.path = circularPath.cgPath        // Draw same circle
        progressLayer.fillColor = UIColor.clear.cgColor
        progressLayer.lineCap = .round
        progressLayer.lineWidth = 10.0
        progressLayer.strokeEnd = 0
        progressLayer.strokeColor = UIColor.green.cgColor
        layer.addSublayer(progressLayer)
    }
    
    func getEndPoint(percent: Double, type: RoundProgressBarType) -> CGFloat {
        
        switch type {
        case .full:
            return CGFloat(2 * Double.pi * percent/100) + type.startPoint
        case .semi:
            return CGFloat(Double.pi * percent/100) + type.startPoint
        }
    }
    
    func progressAnimation(duration: TimeInterval) {
        // created circularProgressAnimation with keyPath
        let circularProgressAnimation = CABasicAnimation(keyPath: "strokeEnd")
        
        // set the end time
        circularProgressAnimation.duration = duration
        circularProgressAnimation.toValue = 1.0
        circularProgressAnimation.fillMode = .forwards
        circularProgressAnimation.isRemovedOnCompletion = false
        progressLayer.add(circularProgressAnimation, forKey: "progressAnimation")
    }

}
