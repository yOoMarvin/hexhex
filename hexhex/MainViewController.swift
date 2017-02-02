//
//  ViewController.swift
//  hexhex
//
//  Created by Marvin Messenzehl on 31.01.17.
//  Copyright © 2017 Marvin Messenzehl. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var hexInput: UITextField!
    @IBOutlet weak var uicolorInput: UITextField!
    
    @IBAction func hexInputEditingChanged(_ sender: AnyObject) {
        print("hexInput: \(hexInput.text)")
        
        guard let hexString = hexInput.text else {
            print("No hex input")
            return
        }
        
        let color = UIColor(hex: hexString)
        
        if hexString.characters.count > 5 {
            self.view.backgroundColor = color
        } else {
            self.view.backgroundColor = UIColor.white
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

}

