//
//  ViewController.swift
//  hexhex
//
//  Created by Marvin Messenzehl on 31.01.17.
//  Copyright © 2017 Marvin Messenzehl. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    //MARK: - Outlets & Actions
    
    @IBOutlet weak var hexInput: UITextField!
    
    @IBOutlet weak var redInput: UITextField!
    @IBOutlet weak var greenInput: UITextField!
    @IBOutlet weak var blueInput: UITextField!
    @IBOutlet weak var alphaInput: UITextField!
    
    @IBAction func hexToUIColorAction(_ sender: Any) {
        guard let hexString = hexInput.text else {
            print("no hex input")
            self.view.backgroundColor = UIColor.white
            return
        }
        
        guard let color = UIColor(hex: hexString) else {
            print("cannot build the uicolor with this string: \(hexString)")
            self.view.backgroundColor = UIColor.white
            return
        }
        
        self.view.backgroundColor = color
        
        guard let colors = uiColorToString(withUIColor: color) else {
            print("cannot create colors")
            return
        }
        
        redInput.text = colors[0]
        greenInput.text = colors[1]
        blueInput.text = colors[2]
        
        if colors.count > 3 {
            alphaInput.text = colors[3]
        }
    }
    
    
    
    
    @IBAction func uiColorToHexAction(_ sender: Any) {
    }
    
}

