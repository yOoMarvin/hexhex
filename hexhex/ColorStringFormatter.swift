//
//  ColorString.swift
//  hexhex
//
//  Created by Marvin Messenzehl on 04.02.17.
//  Copyright © 2017 Marvin Messenzehl. All rights reserved.
//

import Foundation
import UIKit

func colorToString(uiColor: UIColor) -> String? {
    guard let components = uiColor.cgColor.components, components.count >= 3 else {
        return nil
    }
    
    //extract colors
    let r = String(format: "%.2f", Float(components[0]))
    let g = String(format: "%.2f", Float(components[1]))
    let b = String(format: "%.2f", Float(components[2]))
    var a = String(format: "%.2f", Float(1.0))
    
    //if there is an alpha value extract it too
    if components.count >= 4 {
        a = String(format: "%.2f", Float(components[3]))
    }
    
    //build the string
    let result = "UIColor(red:0\(r), green:\(g), blue:\(b), alpha:\(a))"
    
    return result

}


func stringToColor(withString: String) -> UIColor? {
    //String like this: UIColor(red:1.0, green:1.0, blue:1.0, alpha:1.0)
    
    var colorArray = withString.components(separatedBy: ":")
    print(colorArray)
    let r = Float(colorArray[1].components(separatedBy: ",")[0])
    let g = Float(colorArray[2].components(separatedBy: ",")[0])
    let b = Float(colorArray[3].components(separatedBy: ",")[0])
    let a = Float(colorArray[4].components(separatedBy: ")")[0])
    
    
    if (r != nil),(g != nil),(b != nil),(a != nil) {
        return UIColor(red: CGFloat(r!), green: CGFloat(g!), blue: CGFloat(b!), alpha: CGFloat(a!))
    }
    else{
        return nil
    }

}
