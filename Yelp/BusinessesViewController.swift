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
  
  let defaultSearch: (searchTerm: String?, sort: YelpSortMode, categories: [String], deals: Bool, radius: YelpRadiusMode) =
    ("Restaurants", .Distance, [], false, .RadiusNone)
  
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
    navigationItem.leftBarButtonItem = filterButton
    
    // Setup map button in navigation bar
    let mapButton = UIBarButtonItem()
    mapButton.title = "Map"
    mapButton.action = Selector("showMapView")
    mapButton.target = self
    navigationItem.rightBarButtonItem = mapButton
    
    JTProgressHUD.show()
    performSearch(defaultSearch)
  }
  
  internal func showFilterView() {
    performSegueWithIdentifier("filterSegue", sender: self)
  }
  
  internal func showMapView() {
    performSegueWithIdentifier("mapSegue", sender: self)
  }
  
  func performSearch(searchFilters: (searchTerm: String?, sort: YelpSortMode, categories: [String], deals: Bool, radius: YelpRadiusMode)) {
    Business.searchWithTerm(searchFilters.searchTerm!, sort: searchFilters.sort, categories: searchFilters.categories,
      deals: searchFilters.deals, radius: searchFilters.radius) { (businesses: [Business]!, error: NSError!) -> Void in
      
      dispatch_async(dispatch_get_main_queue()) {
        JTProgressHUD.hide()
        self.businesses = businesses
        self.tableView.reloadData()
        
        if businesses != nil {
          for business in businesses {
            print(business.name!)
            print(business.address!)
            print(business.distance!)
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
      // Render no results cell
      return 1
    }
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    // If businesses is nil then let cell be NoResultsCell
    if businesses == nil {
      let cell = tableView.dequeueReusableCellWithIdentifier("NoResultsCell", forIndexPath: indexPath) as! NoResultsCell
      return cell
    }
    
    let cell = tableView.dequeueReusableCellWithIdentifier("BusinessCell", forIndexPath: indexPath) as! BusinessCell
    cell.business = businesses[indexPath.row]
    return cell
  }
  
  // MARK: - UIViewController
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    let navigationController = segue.destinationViewController as! UINavigationController
    for view in navigationController.viewControllers {
      if let filtersViewController = view as? FiltersViewController {
        filtersViewController.delegate = self
      } else if let mapViewController = view as? MapViewController {
        mapViewController.businesses = businesses
      }
    }
  }
}

// MARK: - UISearchBarDelegate
extension BusinessesViewController : UISearchBarDelegate {
  func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
    savedSearchTerm = searchText
    // TODO: Pass in correct filters, default values for sort, categories, deals for now
    let searchFilters: (searchTerm: String?, sort: YelpSortMode, categories: [String], deals: Bool, radius: YelpRadiusMode) =
    (searchText, defaultSearch.sort, defaultSearch.categories, defaultSearch.deals, defaultSearch.radius)
    
    JTProgressHUD.show()
    performSearch(searchFilters)
  }
}

// MARK: - FiltersViewControllerDelegate
extension BusinessesViewController : FiltersViewControllerDelegate {
  func filtersViewControllerSearch(filtersViewController: FiltersViewController, didUpdateFilters filters: [String : Any]) {
    // Search with the filter from the filter view controller page
    print("perform search with filter!")
    let searchFilters: (searchTerm: String?, sort: YelpSortMode, categories: [String], deals: Bool, radius: YelpRadiusMode) =
      (savedSearchTerm,
        filters["sortBy"] as! YelpSortMode,
        filters["categories"] as! [String],
        filters["deals"] as! Bool,
        filters["radius"] as! YelpRadiusMode)
    
    JTProgressHUD.show()
    performSearch(searchFilters)
  }
}
