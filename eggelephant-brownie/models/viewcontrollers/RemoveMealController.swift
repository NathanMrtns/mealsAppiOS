//
//  RemoveMealController.swift
//  eggelephant-brownie
//
//  Created by nathan on 6/28/17.
//  Copyright © 2017 nathan. All rights reserved.
//
import UIKit

class RemoveMealController {
    let controller:UIViewController
    
    init(controller:UIViewController) {
        self.controller = controller
    }
    
    func show(meal:Meal, handler:@escaping (UIAlertAction!) -> Void) {
        let details = UIAlertController(title: meal.name,
                                        message: meal.details(),
                                        preferredStyle: UIAlertControllerStyle.alert)
        let remove = UIAlertAction(title: "Remove",
                                   style: UIAlertActionStyle.destructive,
                                   handler: handler)
        
        details.addAction(remove)
        
        let cancel = UIAlertAction(title: "Cancel",
                                   style: UIAlertActionStyle.cancel,
                                   handler: nil)
        
        details.addAction(cancel)
        
        controller.present(
            details, animated: true, completion: nil)
    }
}
