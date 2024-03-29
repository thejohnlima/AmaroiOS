//
//  Extensions.swift
//  Amaro
//
//  Created by John Lima on 01/02/17.
//  Copyright © 2017 limadeveloper. All rights reserved.
//

import UIKit

extension CGFloat {
    
    static func heightWithConstrainedWidth(string: String, width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = string.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSFontAttributeName: font], context: nil)
        return boundingBox.height
    }
}

extension UIAlertController {
    
    static func createAlert(title: String? = nil, message: String? = nil, style: UIAlertControllerStyle, actions: [UIAlertAction]?, target: AnyObject?, isPopover: Bool = false, buttonItem: UIBarButtonItem? = nil) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: style)
        
        if let actions = actions {
            for action in actions {
                alert.addAction(action)
            }
        }
        
        if isPopover {
            alert.modalPresentationStyle = .popover
            let popover = alert.popoverPresentationController
            popover?.barButtonItem = buttonItem
            popover?.sourceRect = CGRect(x: 0, y: 10, width: 0, height: 0)
            popover?.backgroundColor = .white
        }
        
        target?.present(alert, animated: true, completion: nil)
    }
}

extension UILabel {
    
    
    /// Use this function to insert a horizontal line inside the label
    ///
    /// - Parameter color: The line color
    func addLine(color: UIColor = .white) {
        let line = UIView(frame: CGRect(x: 0, y: self.bounds.size.height/2, width: self.bounds.size.width, height: 1))
        line.backgroundColor = color
        self.addSubview(line)
    }
}

extension UIImageView {
    
    func addBlurEffect(style: UIBlurEffectStyle = .light) {
        let blurEffect = UIBlurEffect(style: style)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = self.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight] // for supporting device rotation
        self.addSubview(blurEffectView)
    }
}

extension UIView {
    
    func setShadow(enable: Bool, shadowOffset: CGSize = .zero, shadowColor: UIColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), shadowRadius: CGFloat = 4, shadowOpacity: Float = 0.25, masksToBounds: Bool = false, clipsToBounds: Bool = false) {
        if enable {
            self.layer.shadowOffset = shadowOffset
            self.layer.shadowColor = shadowColor.cgColor
            self.layer.shadowRadius = shadowRadius
            self.layer.shadowOpacity = shadowOpacity
            self.layer.masksToBounds = masksToBounds
            self.clipsToBounds = clipsToBounds
        }else {
            self.layer.shadowOffset = .zero
            self.layer.shadowColor = UIColor.clear.cgColor
            self.layer.shadowRadius = 0
            self.layer.shadowOpacity = 0
        }
    }
}

extension Double {
    
    static func currencyNumberFrom(string: String) -> Double? {
        let string = string.replacingOccurrences(of: " ", with: "")
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale(identifier: "pt_BR")
        if let number = formatter.number(from: string) {
            let amount = number.doubleValue
            return amount
        }
        return nil
    }
    
    static func currencyStringFrom(value: Double) -> String? {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale(identifier: "pt_BR")
        if let string = formatter.string(from: NSNumber(value: value)) {
            return string
        }
        return nil
    }
}
