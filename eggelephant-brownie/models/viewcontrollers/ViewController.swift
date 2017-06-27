//
//  ViewController.swift
//  eggelephant-brownie
//
//  Created by nathan on 6/26/17.
//  Copyright © 2017 nathan. All rights reserved.
//

import UIKit

protocol AddMealDelegate{
    func addMeal(meal:Meal)
}

class ViewController: UIViewController {
    
    @IBOutlet var nameField : UITextField!
    @IBOutlet var happinessField : UITextField!
    var delegate:AddMealDelegate?
    
    @IBAction func add() {
        if nameField == nil || happinessField == nil {
            return
        }

        let name = nameField!.text
        let happiness = Int(happinessField!.text!)
        
        if happiness == nil {
            return
        }
        
        let meal = Meal(name: name!, happiness: happiness!)
        
        if(delegate == nil){
            return
        }
        
        delegate!.addMeal(meal: meal)

        print("eaten: \(meal.name) \(meal.happiness)")
        
        if let navigation = self.navigationController {
            navigation.popViewController(animated: true)
        }
    }
    
}

