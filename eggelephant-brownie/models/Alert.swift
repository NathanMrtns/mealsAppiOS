//
//  Alert.swift
//  eggelephant-brownie
//
//  Created by nathan on 6/28/17.
//  Copyright © 2017 nathan. All rights reserved.
//

import UIKit

class Alert {
    
    let controller : UIViewController
    init(controller:UIViewController){
        self.controller = controller
    }
    
    func show(message:String = "Unexpected error.") {
        let details = UIAlertController(title: "Sorry",
                                        message: message,
                                        preferredStyle: UIAlertControllerStyle.alert)
        let cancel = UIAlertAction(title: "Understood",
                                   style: UIAlertActionStyle.cancel,
                                   handler: nil)
        details.addAction(cancel)
        controller.present(
            details, animated: true, completion: nil)
    }
}
