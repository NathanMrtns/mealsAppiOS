//: Playground - noun: a place where people can play

import UIKit

class Item {
    var name:String
    var calories:Double
    init(name: String, calories: Double) {
        self.name = name
        self.calories = calories
    }
}

class Meal {
    var name:String
    var happiness:Int
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
}



let item1 = Item(name:"Cookie", calories:3.1)
let item2 = Item(name:"Coffee", calories:1.0)
let breakfast = Meal(name:"Breakfast", happiness:3)

breakfast.items.append(item1)
breakfast.items.append(item2)

print(breakfast.name)
print(breakfast.happiness)
print(breakfast.allCalories())