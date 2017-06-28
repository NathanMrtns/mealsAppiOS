//
//  Item.swift
//  eggelephant-brownie
//
//  Created by nathan on 6/26/17.
//  Copyright © 2017 nathan. All rights reserved.
//

class Item : Equatable {
    let name:String
    let calories:Double
    init(name: String, calories: Double) {
        self.name = name
        self.calories = calories
    }

}

func ==(first:Item, second:Item) -> Bool {
    return first.name == second.name &&
        first.calories == second.calories
}
