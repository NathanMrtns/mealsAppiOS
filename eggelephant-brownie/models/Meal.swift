//
//  Meal.swift
//  eggelephant-brownie
//
//  Created by nathan on 6/26/17.
//  Copyright © 2017 nathan. All rights reserved.
//

import Foundation

class Meal : NSObject, NSCoding{
    let name:String
    let happiness:Int
    var items = Array<Item>()
    
    init(name:String, happiness:Int){
        self.name = name
        self.happiness = happiness
    }
    
    required init(coder aDecoder: NSCoder) {
        self.name = aDecoder.decodeObject(forKey: "name") as! String
        self.happiness =
            aDecoder.decodeInteger(forKey: "happiness")
        self.items =
            aDecoder.decodeObject(forKey: "items") as! Array<Item>
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.name, forKey: "name")
        aCoder.encode(self.happiness, forKey: "happiness")
        aCoder.encode(self.items, forKey: "items")
    }

    func allCalories() -> Double {
        var total = 0.0
        for i in items {
            total += i.calories
        }
        return total
    }
    
    func details() -> String {
        var message = "Happiness: \(self.happiness)"
        for item in self.items {
            message
                += "\n * \(item.name) - calories: \(item.calories)"
        }
        return message
    }
}
