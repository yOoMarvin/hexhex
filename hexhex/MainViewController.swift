//
//  ViewController.swift
//  hexhex
//
//  Created by Marvin Messenzehl on 31.01.17.
//  Copyright © 2017 Marvin Messenzehl. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var hexLabel: UILabel!
    @IBOutlet weak var uiColorLabel: UILabel!
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    @IBOutlet weak var alphaLabel: UILabel!
    @IBOutlet weak var hexhexLabel: UILabel!
    
    @IBOutlet weak var hexInput: UITextField!
    
    @IBOutlet weak var redInput: UITextField!
    @IBOutlet weak var greenInput: UITextField!
    @IBOutlet weak var blueInput: UITextField!
    @IBOutlet weak var alphaInput: UITextField!
    
    
    
    //MARK: - Help Methods for resetting values and background
    func resetHexInputAndBackground() {
        hexInput.text = ""
        self.view.backgroundColor = UIColor.white
        checkColor(withUIColor: UIColor(hex: "FFFFFF")!)
    }
    
    func resetUIColorInputsAndBackground() {
        redInput.text = ""
        greenInput.text = ""
        blueInput.text = ""
        alphaInput.text = "1.00"
        self.view.backgroundColor = UIColor.white
        checkColor(withUIColor: UIColor(hex: "FFFFFF")!)
    }
    
    
    //MARK: - Help function for checking if a color is bright or dark
    //      - Update font colors
    func checkColor(withUIColor: UIColor) {
        let labels = [hexLabel, uiColorLabel, redLabel, greenLabel, blueLabel, alphaLabel, hexhexLabel]
        
        let components = withUIColor.cgColor.components
        let componentColorOne: CGFloat = components![0]
        let componentColorTwo: CGFloat = components![1]
        let componentColorThree: CGFloat = components![2]
        let brightness = ((componentColorOne * 299) + (componentColorTwo * 587) + (componentColorThree * 114))
        
        if brightness < 500 {
            print("background is dark. Brightness value is \(brightness)")
            for label in labels {
                label?.textColor = UIColor.white
            }
        }else {
            print("background is bright. Brightness value is \(brightness)")
            for label in labels {
                label?.textColor = UIColor(hex: "282828")
            }
        }
    }

    
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
        //set background color to the color and check if color is bright or dark (see function)
        self.view.backgroundColor = color
        checkColor(withUIColor: color)
        
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
        //fill background with the color and check if color is bright or dark (see function)
        self.view.backgroundColor = color
        checkColor(withUIColor: color)

        
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
    
    @IBAction func userTappedBackground(sender: AnyObject) {
        view.endEditing(true)
    }
}

