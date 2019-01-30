//
//  HorizontalGraph.swift

import Foundation
import UIKit

/**
 * 가로형 그래프를 표현하기 위해 UISlider 를 customize 함
 */
@IBDesignable
class HorizontalGraph: UISlider {
    
    @IBInspectable var trackHeight: CGFloat = 12 {
        didSet {
            setNeedsDisplay()
        }
    }
    
    @IBInspectable var minFillColor : UIColor = UIColor.init(red: 247/255.0, green: 65/255.0, blue: 100/255.0, alpha: 1.0) {
        didSet {
            setNeedsDisplay()
        }
    }
    
    @IBInspectable var maxFillColor : UIColor = UIColor.init(red: 233.0/255.0, green:  233.0/255.0, blue:  233.0/255.0, alpha: 1.0) {
        didSet {
            setNeedsDisplay()
        }
    }
    
    
    private enum SliderTrack {
        case Minimum
        case Maximum
    }
    
    
    private struct Ratios {
        static let startPosition: CGFloat = 10
        static let bezierHeight: CGFloat = 6
        static let circle: CGFloat = 6
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        self.setMinimumTrackImage(imageForRect(rect: rect, side: .Minimum), for: .normal)
        self.setMaximumTrackImage(imageForRect(rect: rect, side: .Maximum), for: .normal)
        
        self.setThumbImage(UIImage.init(), for: .normal)
    }
    
    private func imageForRect(rect: CGRect, side: SliderTrack) -> UIImage? {
        
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0);
        
        let path = UIBezierPath(rect: rect)
        
        switch side {
        case .Minimum:
            minFillColor.setStroke()
            minFillColor.setFill()
            path.fill()
            path.stroke()
            
        case .Maximum:
            maxFillColor.setStroke()
            maxFillColor.setFill()
            path.stroke()
            path.fill()
        }
        
        let selectedSide = UIGraphicsGetImageFromCurrentImageContext()?.resizableImage(withCapInsets: UIEdgeInsets.zero)
        
        UIGraphicsEndImageContext()
        
        return selectedSide
    }
}
