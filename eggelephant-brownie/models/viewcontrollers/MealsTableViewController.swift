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
    var mymeal : Meal = Meal(name:"Teste", happiness:5)
    var it = Item(name: "Feijao", calories: 5.0)
    var it2 = Item(name: "Arroz", calories: 3.0)
    
    override func viewDidLoad() {
        mymeal.items.append(it)
        mymeal.items.append(it2)
        meals.append(mymeal)
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
            
            var message = "Happiness: \(meal.happiness)"
            
            let details = UIAlertController(title: meal.name, message: meal.details(),
                preferredStyle: UIAlertControllerStyle.alert)
            let ok = UIAlertAction(title: "Ok",
                                   style: UIAlertActionStyle.cancel,
                                   handler: nil)
            details.addAction(ok);
            present(details, animated: true, completion: nil)
        }
    }
}
