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
    let result = "UIColor(r: \(r), g:\(g), b:\(b), a:\(a))"
    
    return result

}
