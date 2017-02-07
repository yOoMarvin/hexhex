//
//  ViewController.swift
//  hexhex
//
//  Created by Marvin Messenzehl on 31.01.17.
//  Copyright © 2017 Marvin Messenzehl. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    //MARK: - Help Methods for resetting values and background
    func resetHexInputAndBackground() {
        hexInput.text = ""
        self.view.backgroundColor = UIColor.white
    }
    
    func resetUIColorInputsAndBackground() {
        redInput.text = ""
        greenInput.text = ""
        blueInput.text = ""
        alphaInput.text = "1.00"
        self.view.backgroundColor = UIColor.white

    }

    
    
    //MARK: - Outlets & Actions
    
    @IBOutlet weak var hexInput: UITextField!
    
    @IBOutlet weak var redInput: UITextField!
    @IBOutlet weak var greenInput: UITextField!
    @IBOutlet weak var blueInput: UITextField!
    @IBOutlet weak var alphaInput: UITextField!
    
    //MARK: - Button action. Convert from HEX to UIColor
    @IBAction func hexToUIColorAction(_ sender: Any) {
        
        guard let hexString = hexInput.text else {
            print("no hex input")
            resetUIColorInputsAndBackground()
            return
        }
        
        guard let color = UIColor(hex: hexString) else {
            print("cannot build the uicolor with this string: \(hexString)")
            ////reset values and window color
            resetUIColorInputsAndBackground()
            return
        }
        
        //at this point UIColor Object was created successfully
        //set background color to the color
        self.view.backgroundColor = color
        
        //create an String Array with values for the input fields
        guard let colorStringArray = uiColorToString(withUIColor: color) else {
            print("cannot create colors")
            return
        }
        
        redInput.text = colorStringArray[0]
        greenInput.text = colorStringArray[1]
        blueInput.text = colorStringArray[2]
        
        if colorStringArray.count > 3 {
            alphaInput.text = colorStringArray[3]
        }
    }
    
    
    
    //MARK: - Button action. Convert from UIColor to HEX
    @IBAction func uiColorToHexAction(_ sender: Any) {
        let fields = [redInput, greenInput, blueInput, alphaInput]
        var colorStringArray: [String] = []
        
        //iterate through fields and append elements to array with color strings
        for field in fields {
            guard let color = field?.text else {
                print("cannot read input field")
                resetHexInputAndBackground()
                return
            }
            colorStringArray.append(color)
        }
        
        guard let color = stringArrayToUIColor(withColorStringArray: colorStringArray) else{
            print("no ui color")
            //reset background and value of hexInput
            resetHexInputAndBackground()
            return
        }
        
        //at this point a uicolor object was created
        //fill background with the color
        self.view.backgroundColor = color
        
        //check the alpha value and call method with or without the parameter
        if colorStringArray[3] == "1.0" {
            guard let hexString = color.hexString() else {
                print("cannot create hex string")
                //reset background and value of hexInput
                resetHexInputAndBackground()
                return
            }
            hexInput.text = hexString

        }else{
            guard let hexString = color.hexString(alpha: true) else {
                print("cannot create hex string")
                //reset background and value of hexInput
                resetHexInputAndBackground()
                return
            }
            hexInput.text = hexString

        }
        
        
    }
    
    
    
    
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        let fields = [hexInput, redInput, greenInput, blueInput,alphaInput]
        
        for field in fields {
            let bottomLine = CALayer()
            bottomLine.frame = CGRect(x:0.0, y:(field?.frame.height)! - 0.1, width:(field?.frame.width)!, height:0.4)
            bottomLine.backgroundColor = UIColor(hex: "282828")?.cgColor
            field?.borderStyle = UITextBorderStyle.none
            field?.layer.addSublayer(bottomLine)
        }
        //MARK: - Border styles for input fields
        

        
    }
    
    
    
}

