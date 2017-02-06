//
//  ColorString.swift
//  hexhex
//
//  Created by Marvin Messenzehl on 04.02.17.
//  Copyright © 2017 Marvin Messenzehl. All rights reserved.
//

import Foundation
import UIKit


func uiColorToString(withUIColor: UIColor) -> [String]? {
    guard let components = withUIColor.cgColor.components, components.count >= 3 else {
        print("No UIColor")
        return nil
    }
    
    //array vor colors values
    var colors: [String] = []
    
    //iterate through components array and append it to string color array
    for component in components {
        colors.append(String(format: "%.2f", Float(component)))
    }
    
    return colors
}





func stringArrayToUIColor(withColorStringArray: [String]) -> UIColor? {
    //String like this: UIColor(red:1.0, green:1.0, blue:1.0, alpha:1.0)
    
    var colorValueArray: [Float] = []
    
    for color in withColorStringArray {
        colorValueArray.append(Float(color)!)
    }
    
    let result = UIColor(red: CGFloat(colorValueArray[0]), green: CGFloat(colorValueArray[1]), blue: CGFloat(colorValueArray[2]), alpha: CGFloat(colorValueArray[3]))

    return result
    
    
}
