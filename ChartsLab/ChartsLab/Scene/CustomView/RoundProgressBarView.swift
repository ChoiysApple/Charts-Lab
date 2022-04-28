/*
 Creating custom circle progress bar
 https://cemkazim.medium.com/how-to-create-animated-circular-progress-bar-in-swift-f86c4d22f74b
 */

import UIKit

class RoundProgressBarView: UIView {
    
    enum RoundProgressBarType {
        case Full
        case Semi
        
        var startPoint: CGFloat {
            switch self {
            case .Full: return CGFloat(-Double.pi / 2)
            case .Semi: return CGFloat(-Double.pi)
            }
        }
    }
    
    // CAShapeLayer: draws a cubic Bezier spline in its coordinate
    private var circleLayer = CAShapeLayer()        // Create Empty Circle
    private var progressLayer = CAShapeLayer()      // Fills Circle Layer
    
    // 0 degree == xAxis
    private var startPoint = CGFloat(-Double.pi / 2)    // - 90 degree
    private var endPoint = CGFloat(3 * Double.pi / 2)   // + 270 degree

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.createCircularPath()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func createCircularPath() {
        
        let circularPath = UIBezierPath(arcCenter: CGPoint(x: frame.size.width / 2.0, y: frame.size.height / 2.0), radius: 80, startAngle: startPoint, endAngle: endPoint, clockwise: true)
        circleLayer.path = circularPath.cgPath          // Draw circle
        circleLayer.fillColor = UIColor.clear.cgColor
        circleLayer.lineCap = .round
        circleLayer.lineWidth = 20.0
        circleLayer.strokeEnd = 1.0
        circleLayer.strokeColor = UIColor.black.cgColor
        layer.addSublayer(circleLayer)                  // Add Layer
        
        progressLayer.path = circularPath.cgPath        // Draw same circle
        progressLayer.fillColor = UIColor.clear.cgColor
        progressLayer.lineCap = .round
        progressLayer.lineWidth = 10.0
        progressLayer.strokeEnd = 0
        progressLayer.strokeColor = UIColor.green.cgColor
        layer.addSublayer(progressLayer)
    }
    
    func getEndPoint(percent: Double, type: RoundProgressBarType) -> CGFloat {
        return CGFloat(2 * Double.pi * percent) + type.startPoint
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
