//
//  ColorConvert.swift
//  hexhex
//
//  Created by Marvin Messenzehl on 02.02.17.
//  Copyright © 2017 Marvin Messenzehl. All rights reserved.
//

import Foundation
import UIKit

typealias HexadecimalString = String

extension UIColor {
    
    //MARK: - Initialization
    
    convenience init?(hex: HexadecimalString) {
        //prepare the hex string
        var hexProcessed = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexProcessed = hexProcessed.replacingOccurrences(of: "#", with: "")
        
        //set up variables
        //-
        //unsigned integer
        var rgb: UInt32 = 0
        var r: CGFloat = 0.0
        var g: CGFloat = 0.0
        var b: CGFloat = 0.0
        //alpha default = 1.0
        var a: CGFloat = 1.0
        let length = hexProcessed.characters.count
        
        //Scanning the string with scanner for unsigned values
        guard Scanner(string: hexProcessed).scanHexInt32(&rgb) else {
            return nil
        }
        
        //extract colors based on hex lenght
        if length == 6 {
            r = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
            g = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
            b = CGFloat(rgb & 0x0000FF) / 255.0
        } else if length == 8 {
            r = CGFloat((rgb & 0xFF000000) >> 24) / 255.0
            g = CGFloat((rgb & 0x00FF0000) >> 16) / 255.0
            b = CGFloat((rgb & 0x0000FF00) >> 8) / 255.0
            a = CGFloat(rgb & 0x000000FF) / 255.0
        } else {
            return nil
        }
        
        //Creating UIColor instance with extracted values
        self.init(red: r, green: g, blue: b, alpha: a)
    }
    
    
    // MARK: - Computed Properties
    
    var hexString: HexadecimalString? {
        return hexString()
    }
    
    // MARK: - From UIColor to Hex String
    
    //One param: indicates if alpha value is included or not (bool)
    
    func hexString(alpha: Bool = false) -> HexadecimalString? {
        
        //Safely unwrapping because components property is type [CGFloat]?
        //Also mage sure that it contains a minimum of 3 components
        guard let components = cgColor.components, components.count >= 3 else {
            return nil
        }
        
        //extract colors
        let r = Float(components[0])
        let g = Float(components[1])
        let b = Float(components[2])
        var a = Float(1.0)
        
        //if there is an alpha value extract it too
        if components.count >= 4 {
            a = Float(components[3])
        }
        
        //create return string, round values with lroundf
        //REMEMBER: - String formats:
        // % defines the format specifier
        // 02 defines the length of the string
        // l casts the value to an unsigned long
        // X prints the value in hexadecimal
        if alpha {
            return String(format: "%02lX%02lX%02lX%02lX", lroundf(r * 255), lroundf(g * 255), lroundf(b * 255), lroundf(a * 255))
        }
        return String(format: "%02lX%02lX%02lX", lroundf(r * 255), lroundf(g * 255), lroundf(b * 255))
    }
    
    
    // MARK: - Get inverse color
    
    func inverse () -> UIColor {
        var r:CGFloat = 0.0; var g:CGFloat = 0.0; var b:CGFloat = 0.0; var a:CGFloat = 0.0;
        if self.getRed(&r, green: &g, blue: &b, alpha: &a) {
            return UIColor(red: 1.0-r, green: 1.0 - g, blue: 1.0 - b, alpha: a)
        }
        return self
    }
}


// MARK: - Debugging
//
//let green = UIColor(hex: "12FF10")
//let greenWithAlpha = UIColor(hex: "12FF10AC")
//
//UIColor.blue.hexString
//UIColor.orange.hexString()
