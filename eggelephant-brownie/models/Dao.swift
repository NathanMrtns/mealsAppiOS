//
//  Dao.swift
//  eggelephant-brownie
//
//  Created by nathan on 6/28/17.
//  Copyright © 2017 nathan. All rights reserved.
//

import Foundation

class Dao{
    let mealsArchive: String
    let itemsArchive: String
    
    init(){
        let userDir = NSSearchPathForDirectoriesInDomains(
            FileManager.SearchPathDirectory.documentDirectory,
            FileManager.SearchPathDomainMask.userDomainMask,
            true)
        let dir = userDir[0] as String
        mealsArchive = "\(dir)/eggplant-brownie-meals"
        itemsArchive = "\(dir)/eggplant-brownie-items"
    }
    
    func save(meals: Array<Meal>){
        NSKeyedArchiver.archiveRootObject(
            meals, toFile: mealsArchive)
    }
    
    func loadMeals() -> Array<Meal> {
        if let loaded = NSKeyedUnarchiver.unarchiveObject(withFile: mealsArchive) {
            return loaded as! Array
        }
        return Array<Meal>()
    }
    
    func save(items: Array<Item>){
        NSKeyedArchiver.archiveRootObject(
            items, toFile: itemsArchive)
    }
    
    func loadItems() -> Array<Item> {
        if let loaded =
            NSKeyedUnarchiver.unarchiveObject(withFile: itemsArchive) {
            return loaded as! Array
        }
        return Array<Item>()
    }
}
