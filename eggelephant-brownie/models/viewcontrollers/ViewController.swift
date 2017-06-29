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

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, AddAnItemDelegate {
    
    @IBOutlet var nameField : UITextField!
    @IBOutlet var happinessField : UITextField!
    @IBOutlet var tableView : UITableView?
    
    var delegate:AddMealDelegate?
    
    var selectedItems = Array<Item>()
    
    var items = Array<Item>()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath)
        -> UITableViewCell {
            let row = indexPath.row
            let item = items[ row ]
            let cell = UITableViewCell(style:
                UITableViewCellStyle.default,reuseIdentifier: nil)
            cell.textLabel?.text = item.name
            return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)!
        
        if (cell.accessoryType == UITableViewCellAccessoryType.none) {
            cell.accessoryType = UITableViewCellAccessoryType.checkmark
            selectedItems.append(items[indexPath.row])
        } else {
            cell.accessoryType = UITableViewCellAccessoryType.none
            if let position = selectedItems.index(of: items[indexPath.row]){
                selectedItems.remove(at: position)
            }
        }
    }
    
    
    func getMealFromForm() -> Meal? {
        if nameField == nil || happinessField == nil {
            return nil }
        let name = nameField!.text
        let happiness = Int(happinessField!.text!)
        if happiness == nil {
            return nil }
        let meal = Meal(name: name!, happiness: happiness!)
        meal.items = selectedItems
        print("eaten: \(meal.name) \(meal.happiness) \(meal.items)")
        return meal
    }
    
    @IBAction func add() {
        if let meal = getMealFromForm() {
            if let meals = delegate {
                meals.addMeal(meal: meal)
                if let navigation = self.navigationController {
                    navigation.popViewController(animated: true)
                }else{
                    Alert(controller: self).show(message:"Unexpected error, but meal was added.")
                }
                return
            }
        }
        Alert(controller:self).show()
    }
    
    func addItem(item: Item) {
        items.append(item)
        let dir = getUserDirectory()
        Dao().save(items:items)
        if let table = tableView{
            table.reloadData()
        } else {
            Alert(controller:self).show(message:"Unexpected error, but the item was added.")
        }
    }
    
    override func viewDidLoad() {
        let newItemButton = UIBarButtonItem(title: "new item",
                                            style: UIBarButtonItemStyle.plain,
                                            target: self,
                                            action: #selector(ViewController.showNewItem))
        navigationItem.rightBarButtonItem = newItemButton
        
        items=Dao().loadItems()
    }
    
    @IBAction func showNewItem() {
        let newItem = NewItemViewController(delegate:self)
        if let navigation = navigationController{
            navigationController?.pushViewController(newItem, animated: true)
        }else{
            Alert(controller:self).show()
        }
    }
    
    func getUserDirectory() -> String{
        let userDir = NSSearchPathForDirectoriesInDomains(
            FileManager.SearchPathDirectory.documentDirectory,
            FileManager.SearchPathDomainMask.userDomainMask,
            true)
        return userDir[0] as String
    }
}
