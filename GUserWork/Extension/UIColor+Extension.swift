//
//  UIColor+Extension.swift
//  GUserWork
//
//  Created by 蕭文安的M1 on 2023/3/9.
//

import UIKit

extension UIColor {
    
    convenience init(withIntRed red: Int, green: Int, blue: Int, alpha: CGFloat = 1.0) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: alpha)
    }
    
    convenience init(hex: Int, alpha: CGFloat = 1.0) {
        self.init(
            withIntRed: (hex >> 16) & 0xFF,
            green: (hex >> 8) & 0xFF,
            blue: hex & 0xFF,
            alpha: alpha
        )
    }
    
    convenience init(colors: (red: Int, green: Int, blue: Int), alpha: CGFloat = 1.0) {
        self.init(withIntRed: colors.red, green: colors.green, blue: colors.blue, alpha: alpha)
    }
    
}
