//
//  ViewController.swift
//  Xcode_Session_1
//
//  Created by RicherTecMac Pro on 2016/9/9.
//  Copyright © 2016年 KJSA. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var display: UILabel?
    
    var  userIsInTheMiddleOfTyping  = false
    
    
    @IBAction func touchDigit(sender: UIButton  )  {
                    let digit  = sender.currentTitle!
        if userIsInTheMiddleOfTyping   {
                    let textCurrentlyInDisplay = display!.text!
                    display!.text = textCurrentlyInDisplay + digit
        }
                   print("touched   \(digit)  Digit")
            
        }




}

