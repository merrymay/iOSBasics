//
//  Slider.swift

import Foundation
import UIKit
import QuartzCore

/**
 * 기본 스타일 UISlider - 높이만 기본 4로 정해놓음. IB에서 직접 지정해서 사용할수 있음
 */
@IBDesignable
class CustomSlider: UISlider {
    
    @IBInspectable var trackHeight: CGFloat = 4
    @IBInspectable var thumbImage: String?
    
    override func awakeFromNib() {
        super.awakeFromNib()

        if let imageString = thumbImage {
            self.setThumbImage(UIImage(named: imageString), for: UIControl.State.normal)
            self.setThumbImage(UIImage(named: imageString), for: UIControl.State.highlighted)
        }
    }
    
    override func trackRect(forBounds bounds: CGRect) -> CGRect {
        // Use properly calculated rect
        var newRect = super.trackRect(forBounds: bounds)
        newRect.size.height = trackHeight
        return newRect
    }
    
    /*
    override func setThumbImage(_ image: UIImage?, for state: UIControl.State) {
        self.setThumbImage(UIImage(named: thumbImage), for: UIControl.State.normal)
        self.setThumbImage(UIImage(named: thumbImage), for: UIControl.State.highlighted)
    }
    */
}
