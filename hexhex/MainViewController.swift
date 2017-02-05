//
//  ViewController.swift
//  hexhex
//
//  Created by Marvin Messenzehl on 31.01.17.
//  Copyright © 2017 Marvin Messenzehl. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    
    
    //Text change action
    //-
    // hex to UIColor
    /*
    @IBAction func hexInputEditingChanged(_ sender: AnyObject) {
        
        guard let hexString = hexInput.text else {
            print("No hex input")
            return
        }
        
        let color = UIColor(hex: hexString)
        
        if hexString.characters.count > 5 {
            self.view.backgroundColor = color
            guard let colorString = colorToString(uiColor: color!) else {
                return
            }
            uicolorInput.text = colorString
        } else {
            self.view.backgroundColor = UIColor.white
            uicolorInput.text = "UIColor(red:? ,green:? ,blue:? ,alpha:?)"
        }
        
        
    }
    
    //Text change action
    //-
    //UIColor to hex
    @IBAction func uiColorInputEditingChanged(_ sender: AnyObject) {
        
        guard let uiColorString = uicolorInput.text else {
            print("no UIColor input")
            return
        }
        
        guard let color = stringToColor(withString: uiColorString) else {
            print("error gettig color object")
            return
        }
        
        self.view.backgroundColor = color
        guard let hexString = color.hexString() else {
            return
        }
        hexInput.text = hexString
        
    }
    */
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

}

