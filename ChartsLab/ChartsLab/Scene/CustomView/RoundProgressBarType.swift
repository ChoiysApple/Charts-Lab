//
//  RoundProgressBarType.swift
//  ChartsLab
//
//  Created by Daegeon Choi on 2022/04/28.
//

import Foundation
import UIKit

enum RoundProgressBarType {
    case full
    case semi
    
    var startPoint: CGFloat {
        switch self {
        case .full: return CGFloat(-Double.pi / 2)
        case .semi: return CGFloat(-Double.pi)
        }
    }
    
    var endPoint: CGFloat {
        switch self {
        case .full: return CGFloat(3 * Double.pi / 2)
        case .semi: return CGFloat(0)
        }
    }
}
