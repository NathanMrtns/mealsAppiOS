//
//  Meal.swift
//  eggelephant-brownie
//
//  Created by nathan on 6/26/17.
//  Copyright © 2017 nathan. All rights reserved.
//

class Meal {
    let name:String
    let happiness:Int
    var items = Array<Item>()
    init(name:String, happiness:Int){
        self.name = name
        self.happiness = happiness
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
