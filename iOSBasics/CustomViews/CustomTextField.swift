//
//  TextField.swift

import Foundation
import UIKit

/*
 * TextField custom background 이미지를 변경하기 위한 TextField 상태값
 */
@objc enum CustomTextFieldState: Int {
    case normal
    case disabled
    case focused
    case error
}

/**
 * 앱 공통 TextField appearance 를 정의
 * - content inset 조정
 * - clear button 이미지 적용
 * - background 이미지 상태별 적용 
 */
@IBDesignable
class CustomTextField: UITextField {
    @IBInspectable var insetX: CGFloat = 16
    @IBInspectable var insetY: CGFloat = 12
    
    // placeholder position
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: insetX, dy: insetY)
    }
    
    // text position
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: insetX, dy: insetY)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        // custom clear button image
        let defaultClearButton = UIButton.appearance(whenContainedInInstancesOf: [UITextField.self])
        defaultClearButton.setImage(UIImage(named:"textfield_close_button"), for: .normal)
        
        // custom background image
        self.borderStyle = .none
        self.background = UIImage(named:"textfield_bg_default")
        self.disabledBackground = UIImage(named:"textfield_bg_disabled")
    }
 
    @objc func setBackground(forState state:CustomTextFieldState) {
        switch state {
        case .normal:
            self.background = UIImage(named:"textfield_bg_default")
        case .disabled:
            self.background = UIImage(named:"textfield_bg_disabled")
        case .focused:
            self.background = UIImage(named:"textfield_bg_focused")
        case .error:
            self.background = UIImage(named:"textfield_bg_error")
        }
    }
 
}
