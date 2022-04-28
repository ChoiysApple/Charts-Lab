//
//  RoundProgressBarType.swift
//  ChartsLab
//
//  Created by Daegeon Choi on 2022/04/28.
//

import Foundation
import UIKit

enum RoundProgressBarType {
    case Full
    case Semi
    
    var startPoint: CGFloat {
        switch self {
        case .Full: return CGFloat(-Double.pi / 2)
        case .Semi: return CGFloat(-Double.pi)
        }
    }
    
    var endPoint: CGFloat {
        switch self {
        case .Full: return CGFloat(3 * Double.pi / 2)
        case .Semi: return CGFloat(0)
        }
    }
}

