//
//  FiltersViewController.swift
//  Yelp
//
//  Created by Vijayalakshmi Subramanian on 9/21/15.
//  Copyright © 2015 Timothy Lee. All rights reserved.
//

import UIKit

@objc protocol FiltersViewControllerDelegate {
    optional func filtersViewController(filtersViewController : FiltersViewController, didUpdateFilters filters: [String : AnyObject])
}

class FiltersViewController: UIViewController,
        UITableViewDataSource, UITableViewDelegate, SwitchCellDelegate{

    @IBOutlet weak var tableView: UITableView!
    weak var delegate: FiltersViewControllerDelegate?
    
    var categories : [[String : String]]!
    var switchStates = [Int:Bool]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        categories = yelpCategories()
        tableView.delegate = self
        tableView.dataSource = self

        // Do any additional setup after loading the view.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("SwitchCell", forIndexPath: indexPath) as! SwitchCell
        
        cell.switchLabel.text = categories[indexPath.row]["name"]
        cell.delegate = self
        
        if switchStates[indexPath.row] != nil {
            cell.onSwitch.on = switchStates[indexPath.row]!
        }else {
            cell.onSwitch.on = false
        }
        return cell
    }
    
    func switchCell(switchCell: SwitchCell, didChangeValue value: Bool) {
        let indexPath = tableView.indexPathForCell(switchCell)!
        
        
        print("filters view controller got switch event")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func onCancelButton(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    
    @IBAction func onSearchButton(sender: AnyObject) {
        
        var filters = [String : AnyObject]()
        
        
        delegate?.filtersViewController?(self, didUpdateFilters: filters)
        
        
    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        
    }
    //
    

    
    func yelpCategories() -> [[String:String]] {
        
        return [["name" : "Afghan", "code" : "afghani"],
            ["name" : "African", "code" : "african"]]
    }

}
