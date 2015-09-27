//
//  BusinessesViewController.swift
//  Yelp
//
//  Created by Vicki Chun Grospe on 9/24/15.
//  Copyright © 2015 Vicki Chun Grospe. All rights reserved.
//

import UIKit

class BusinessesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
  
  var businesses: [Business]!
  
  @IBOutlet weak var tableView: UITableView!
  
  let defaultSearch: (searchTerm: String?, sort: YelpSortMode, categories: [String], deals: Bool) = ("Restaurants", .Distance, [], false)
  
  /*
  let defaultSearch : [String: AnyObject] =
  [ "searchTerm" : "Restaurants",
  "sortBy" : .Distance,
  "categories" : [],
  "deals" :
  ]
  */
  var savedSearchTerm: String = ""
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    tableView.dataSource = self
    tableView.delegate = self
    tableView.rowHeight = UITableViewAutomaticDimension
    tableView.estimatedRowHeight = 150
    
    // Setup search bar in navigation bar
    let searchBar = UISearchBar()
    searchBar.sizeToFit()
    searchBar.placeholder = "Search"
    navigationItem.titleView = searchBar
    searchBar.delegate = self
    
    // Setup filter button in navigation bar
    let filterButton = UIBarButtonItem()
    filterButton.title = "Filter"
    filterButton.action = Selector("showFilterView")
    filterButton.target = self
    // filterButton.setTitleTextAttributes(, forState: UIControlState.Element)
    navigationItem.leftBarButtonItem = filterButton
    
    performSearch(defaultSearch)
  }
  
  func showFilterView() {
    performSegueWithIdentifier("filterSegue", sender: self)
  }
  
  func performSearch(searchFilters: (searchTerm: String?, sort: YelpSortMode, categories: [String], deals: Bool)) {
    Business.searchWithTerm(searchFilters.searchTerm!, sort: searchFilters.sort, categories: searchFilters.categories, deals: searchFilters.deals) { (businesses: [Business]!, error: NSError!) -> Void in
      
      // TODO: handle error
      dispatch_async(dispatch_get_main_queue()) {
        self.businesses = businesses
        self.tableView.reloadData()
        
        if businesses != nil {
          for business in businesses {
            print(business.name!)
            print(business.address!)
          }
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
  
  // MARK: - UIViewController
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    let navigationController = segue.destinationViewController as! UINavigationController
    let filtersViewController = navigationController.topViewController as! FiltersViewController
    
    filtersViewController.delegate = self
    
    // Pass the selected object to the new view controller.
  }
}

// MARK: - UISearchBarDelegate
extension BusinessesViewController : UISearchBarDelegate {
  func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
    savedSearchTerm = searchText
    // TODO: Pass in correct filters, default values for sort, categories, deals for now
    let searchFilters: (searchTerm: String?, sort: YelpSortMode, categories: [String], deals: Bool) =
    (searchText, defaultSearch.sort, defaultSearch.categories, defaultSearch.deals)
    
    performSearch(searchFilters)
  }
}

// MARK: - FiltersViewControllerDelegate
extension BusinessesViewController : FiltersViewControllerDelegate {
  func filtersViewControllerSearch(filtersViewController: FiltersViewController, didUpdateFilters filters: [String : Any]) {
    // Search with the filter from the filter view controller page
    print("perform search with filter!")
    let searchFilters: (searchTerm: String?, sort: YelpSortMode, categories: [String], deals: Bool) =
    (savedSearchTerm, filters["sortBy"] as! YelpSortMode, filters["categories"] as! [String], filters["deals"] as! Bool)
    
    performSearch(searchFilters)
  }
}
