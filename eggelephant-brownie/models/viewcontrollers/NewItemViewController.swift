//
//  NewItemViewController.swift
//  eggelephant-brownie
//
//  Created by nathan on 6/27/17.
//  Copyright © 2017 nathan. All rights reserved.
//

import UIKit


protocol AddAnItemDelegate{
    func addItem(item:Item)
}

class NewItemViewController: UIViewController {
    
 
    var delegate:AddAnItemDelegate? = nil
    
    init(delegate:AddAnItemDelegate) {
        self.delegate = delegate
        super.init(nibName: "NewItemViewController", bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    @IBOutlet var nameField : UITextField?
    @IBOutlet var caloriesField : UITextField?
    
    @IBAction func addNewItem(){
        if (nameField == nil || caloriesField == nil){
            return
        }
        
        let name = nameField!.text
        let calories = NSString(string: caloriesField!.text!).doubleValue
        let item = Item(name: name!, calories: calories)
        
        if delegate == nil {
            return
        }
        delegate!.addItem(item: item)
        
        if let navigation = navigationController {
            navigation.popViewController(animated: true)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
