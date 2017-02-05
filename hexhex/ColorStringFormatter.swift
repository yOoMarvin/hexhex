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





func stringToUIColor(withString: String) -> UIColor? {
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
