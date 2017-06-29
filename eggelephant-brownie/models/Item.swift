//
//  Item.swift
//  eggelephant-brownie
//
//  Created by nathan on 6/26/17.
//  Copyright © 2017 nathan. All rights reserved.
//
import Foundation

class Item : NSObject, NSCoding {
    let name:String
    let calories:Double
    
    init(name: String, calories: Double) {
        self.name = name
        self.calories = calories
    }
    
    required init(coder aDecoder: NSCoder) {
        self.name = aDecoder.decodeObject(forKey: "name") as! String
        self.calories = aDecoder.decodeDouble(forKey: "calories")
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.name, forKey: "name")
        aCoder.encode(self.calories, forKey: "calories")
    }

}

func ==(item1:Item, item2:Item) -> Bool {
    return item1.name == item2.name && item1.calories == item2.calories
}
