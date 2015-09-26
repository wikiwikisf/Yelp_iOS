//
//  FiltersViewController.swift
//  Yelp
//
//  Created by Vicki Chun Grospe on 9/26/15.
//  Copyright © 2015 Vicki Chun Grospe. All rights reserved.
//

import UIKit

class FiltersViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    // TODO: Should we create subviews here or have this view controller implement a table?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Setup Cancel button in navigation bar
        let cancelButton = UIBarButtonItem()
        cancelButton.title = "Cancel"
        cancelButton.action = Selector("cancelFilter")
        cancelButton.target = self
        navigationItem.leftBarButtonItem = cancelButton
        
        // Setup Search button in navigation bar
        let searchButton = UIBarButtonItem()
        searchButton.title = "Search"
        searchButton.action = Selector("searchWithFilter")
        searchButton.target = self
        navigationItem.rightBarButtonItem = searchButton
        
        navigationItem.title = "Filter"

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func cancelFilter() {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func searchWithFilter() {
        // TODO: search
        dismissViewControllerAnimated(true, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
