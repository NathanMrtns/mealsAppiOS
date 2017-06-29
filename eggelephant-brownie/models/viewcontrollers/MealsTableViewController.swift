//
//  MealsTableViewController.swift
//  eggelephant-brownie
//
//  Created by nathan on 6/26/17.
//  Copyright © 2017 nathan. All rights reserved.
//

import UIKit

class MealsTableViewController: UITableViewController, AddMealDelegate {
    
    var meals = Array<Meal>()
    
    override func viewDidLoad() {
        let dir = getUserDirectory()
        let archive =  "\(dir)/eggplant-brownie-meals"
        meals = Dao().loadMeals()
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        let meal = meals[ row ]
        let cell = UITableViewCell(style: UITableViewCellStyle.default,reuseIdentifier: nil)
        cell.textLabel?.text = meal.name
       
        
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(MealsTableViewController.showDetails(recognizer:)))
        cell.addGestureRecognizer(longPress)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals.count
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "addMeal"){
            let view = segue.destination as! ViewController
            view.delegate =  self
        }
    }
    
    func addMeal(meal:Meal){
        meals.append(meal)
        Dao().save(meals:meals)
        tableView.reloadData()
    }
    
    func showDetails(recognizer: UILongPressGestureRecognizer){
        if recognizer.state == UIGestureRecognizerState.began{
            let cell = recognizer.view
            let indexPath = tableView.indexPath(for: cell as! UITableViewCell)
            if indexPath == nil {
                return
            }
            let row = indexPath!.row
            let meal = meals[row]
            
            RemoveMealController(controller: self).show(meal: meal, handler: { action in
                                                            self.meals.remove(at: row)
                                                            self.tableView.reloadData()
            })
            
            func removeSelected(action:UIAlertAction!){
                meals.remove(at: row)
                tableView.reloadData()
            }
            
            show(meal:meal, handler:{ action in
                self.meals.remove(at: row)
                self.tableView.reloadData()
            })
        }
    }
    
    func show(meal:Meal, handler:@escaping (UIAlertAction!)->Void){
                let details = UIAlertController(title: meal.name, message: meal.details(),
                                        preferredStyle: UIAlertControllerStyle.alert)
        
        let remove = UIAlertAction(title: "Remove",
                                   style: UIAlertActionStyle.destructive,
                                   handler: handler)
        details.addAction(remove)
        
        let cancel = UIAlertAction(title: "Cancel",
                                   style: UIAlertActionStyle.cancel,
                                   handler: nil)
        details.addAction(cancel)
        present(details, animated: true, completion: nil)
    }
    
    func getUserDirectory() -> String{
        let userDir = NSSearchPathForDirectoriesInDomains(
            FileManager.SearchPathDirectory.documentDirectory,
            FileManager.SearchPathDomainMask.userDomainMask,
            true)
        return userDir[0] as String
    }
    

}
