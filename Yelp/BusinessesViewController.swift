//
//  BusinessesViewController.swift
//  Yelp
//
//  Created by Timothy Lee on 4/23/15.
//  Copyright (c) 2015 Timothy Lee. All rights reserved.
//

import UIKit

class BusinessesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate{

    var businesses: [Business]!
    
    @IBOutlet weak var tableView: UITableView!
    
    let defaultSearch: (searchTerm: String?, sort: YelpSortMode, categories: [String], deals: Bool) = ("Restaurants", .Distance, [], false)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 150
        
        let searchBar = UISearchBar()
        searchBar.sizeToFit()
        searchBar.placeholder = "Search"
        navigationItem.titleView = searchBar
        searchBar.delegate = self

        performSearch(defaultSearch)
    }

    func performSearch(searchFilters: (searchTerm: String?, sort: YelpSortMode, categories: [String], deals: Bool)) {
        
        Business.searchWithTerm(searchFilters.searchTerm!, sort: searchFilters.sort, categories: searchFilters.categories, deals: searchFilters.deals) { (businesses: [Business]!, error: NSError!) -> Void in
            
            // TODO: handle error
            dispatch_async(dispatch_get_main_queue()) {
                self.businesses = businesses
                self.tableView.reloadData()
                
                for business in businesses! {
                    print(business.name!)
                    print(business.address!)
                }
            }
        }
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if businesses != nil {
            return businesses.count
        } else {
            return 0
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("BusinessCell", forIndexPath: indexPath) as! BusinessCell
        
        cell.business = businesses[indexPath.row]
        return cell
    }
    
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        
        // TODO: default values for sort, categories, deals for now
        let searchTerm: (searchTerm: String?, sort: YelpSortMode, categories: [String], deals: Bool) = (searchText, defaultSearch.sort, defaultSearch.categories, defaultSearch.deals)

        performSearch(searchTerm)
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
