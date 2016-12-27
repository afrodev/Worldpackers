//
//  CustomTextField.swift
//  moip-app
//
//  Created by Humberto Vieira on 11/12/16.
//  Copyright © 2016 Humberto Vieira. All rights reserved.
//

import UIKit

class CustomTextField: UITextField {
    let inset: CGFloat = 50
    var leftImage: UIImage?
    let padding = UIEdgeInsets(top: 0, left: 40, bottom: 0, right: 0);

    
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        self.leftViewMode = .always
        
        let imageView = UIImageView()
        imageView.frame = CGRect(x: 0, y: 0, width: 35, height: 35)
        imageView.image = UIImage(named: "search_icon")
        self.leftView = imageView
        
        
//        setBottomBorder(.white)
        
//        self.attributedPlaceholder = NSAttributedString(string: self.placeholder!, attributes: [NSForegroundColorAttributeName : UIColor.gray])
    }
    
//    
//    func setBottomBorder(_ borderColor: UIColor)
//    {
//        self.borderStyle = UITextBorderStyle.none
//        self.backgroundColor = UIColor.clear
//        let width = 0.3
//        
//        let borderLine = UIView()
//        borderLine.frame = CGRect(x: 0, y: Double(self.frame.height) - width, width: Double(self.frame.width), height: width)
//        
//        borderLine.backgroundColor = borderColor
//        self.addSubview(borderLine)
//    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding)
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding)
    }
    
    
    
    
    
    
    
    
}















