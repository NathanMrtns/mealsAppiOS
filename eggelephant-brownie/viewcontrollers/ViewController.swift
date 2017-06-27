//
//  ViewController.swift
//  eggelephant-brownie
//
//  Created by nathan on 6/26/17.
//  Copyright © 2017 nathan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var nameField : UITextField!
    @IBOutlet var happinessField : UITextField!
    
    @IBAction func add(){
        var name : String = nameField.text!
        var happiness : String = happinessField.text!
        print("Eaten: \(name) \(happiness)")
    }
    
}

