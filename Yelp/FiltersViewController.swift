//
//  FiltersViewController.swift
//  Yelp
//
//  Created by Vicki Chun Grospe on 9/26/15.
//  Copyright © 2015 Vicki Chun Grospe. All rights reserved.
//

import UIKit

enum rowId : String {
    case Deal = "Offering a Deal"
    case BestMatch = "Best Match"
    case Radius800 = "800 meters"
    case Radius1600 = "1600 meters"
    case Radius8000 = "8000 meters"
    case Radius16000 = "16000 meters"
    case SortByDistance = "Distance"
    case SortByRating = "Highest Rated"
}

let radiusMap : [rowId: YelpRadiusMode] = [
  .BestMatch : .RadiusNone,
  .Radius800 : .Radius800,
  .Radius1600 : .Radius1600,
  .Radius8000 : .Radius8000,
  .Radius16000 : .Radius16000
]

let sortByMap : [rowId: YelpSortMode] = [
  .BestMatch : .BestMatched,
  .SortByDistance : .Distance,
  .SortByRating : .HighestRated
]

let popularCategories = [["name" : "American, New", "code": "newamerican"],
  ["name" : "Asian Fusion", "code": "asianfusion"],
  ["name" : "Breakfast & Brunch", "code": "breakfast_brunch"],
  ["name" : "Sushi Bars", "code": "sushi"]]

let allCategories = [["name" : "Afghan", "code": "afghani"],
    ["name" : "African", "code": "african"],
    ["name" : "American, New", "code": "newamerican"],
    ["name" : "American, Traditional", "code": "tradamerican"],
    ["name" : "Arabian", "code": "arabian"],
    ["name" : "Argentine", "code": "argentine"],
    ["name" : "Armenian", "code": "armenian"],
    ["name" : "Asian Fusion", "code": "asianfusion"],
    ["name" : "Asturian", "code": "asturian"],
    ["name" : "Australian", "code": "australian"],
    ["name" : "Austrian", "code": "austrian"],
    ["name" : "Baguettes", "code": "baguettes"],
    ["name" : "Bangladeshi", "code": "bangladeshi"],
    ["name" : "Barbeque", "code": "bbq"],
    ["name" : "Basque", "code": "basque"],
    ["name" : "Bavarian", "code": "bavarian"],
    ["name" : "Beer Garden", "code": "beergarden"],
    ["name" : "Beer Hall", "code": "beerhall"],
    ["name" : "Beisl", "code": "beisl"],
    ["name" : "Belgian", "code": "belgian"],
    ["name" : "Bistros", "code": "bistros"],
    ["name" : "Black Sea", "code": "blacksea"],
    ["name" : "Brasseries", "code": "brasseries"],
    ["name" : "Brazilian", "code": "brazilian"],
    ["name" : "Breakfast & Brunch", "code": "breakfast_brunch"],
    ["name" : "British", "code": "british"],
    ["name" : "Buffets", "code": "buffets"],
    ["name" : "Bulgarian", "code": "bulgarian"],
    ["name" : "Burgers", "code": "burgers"],
    ["name" : "Burmese", "code": "burmese"],
    ["name" : "Cafes", "code": "cafes"],
    ["name" : "Cafeteria", "code": "cafeteria"],
    ["name" : "Cajun/Creole", "code": "cajun"],
    ["name" : "Cambodian", "code": "cambodian"],
    ["name" : "Canadian", "code": "New)"],
    ["name" : "Canteen", "code": "canteen"],
    ["name" : "Caribbean", "code": "caribbean"],
    ["name" : "Catalan", "code": "catalan"],
    ["name" : "Chech", "code": "chech"],
    ["name" : "Cheesesteaks", "code": "cheesesteaks"],
    ["name" : "Chicken Shop", "code": "chickenshop"],
    ["name" : "Chicken Wings", "code": "chicken_wings"],
    ["name" : "Chilean", "code": "chilean"],
    ["name" : "Chinese", "code": "chinese"],
    ["name" : "Comfort Food", "code": "comfortfood"],
    ["name" : "Corsican", "code": "corsican"],
    ["name" : "Creperies", "code": "creperies"],
    ["name" : "Cuban", "code": "cuban"],
    ["name" : "Curry Sausage", "code": "currysausage"],
    ["name" : "Cypriot", "code": "cypriot"],
    ["name" : "Czech", "code": "czech"],
    ["name" : "Czech/Slovakian", "code": "czechslovakian"],
    ["name" : "Danish", "code": "danish"],
    ["name" : "Delis", "code": "delis"],
    ["name" : "Diners", "code": "diners"],
    ["name" : "Dumplings", "code": "dumplings"],
    ["name" : "Eastern European", "code": "eastern_european"],
    ["name" : "Ethiopian", "code": "ethiopian"],
    ["name" : "Fast Food", "code": "hotdogs"],
    ["name" : "Filipino", "code": "filipino"],
    ["name" : "Fish & Chips", "code": "fishnchips"],
    ["name" : "Fondue", "code": "fondue"],
    ["name" : "Food Court", "code": "food_court"],
    ["name" : "Food Stands", "code": "foodstands"],
    ["name" : "French", "code": "french"],
    ["name" : "French Southwest", "code": "sud_ouest"],
    ["name" : "Galician", "code": "galician"],
    ["name" : "Gastropubs", "code": "gastropubs"],
    ["name" : "Georgian", "code": "georgian"],
    ["name" : "German", "code": "german"],
    ["name" : "Giblets", "code": "giblets"],
    ["name" : "Gluten-Free", "code": "gluten_free"],
    ["name" : "Greek", "code": "greek"],
    ["name" : "Halal", "code": "halal"],
    ["name" : "Hawaiian", "code": "hawaiian"],
    ["name" : "Heuriger", "code": "heuriger"],
    ["name" : "Himalayan/Nepalese", "code": "himalayan"],
    ["name" : "Hong Kong Style Cafe", "code": "hkcafe"],
    ["name" : "Hot Dogs", "code": "hotdog"],
    ["name" : "Hot Pot", "code": "hotpot"],
    ["name" : "Hungarian", "code": "hungarian"],
    ["name" : "Iberian", "code": "iberian"],
    ["name" : "Indian", "code": "indpak"],
    ["name" : "Indonesian", "code": "indonesian"],
    ["name" : "International", "code": "international"],
    ["name" : "Irish", "code": "irish"],
    ["name" : "Island Pub", "code": "island_pub"],
    ["name" : "Israeli", "code": "israeli"],
    ["name" : "Italian", "code": "italian"],
    ["name" : "Japanese", "code": "japanese"],
    ["name" : "Jewish", "code": "jewish"],
    ["name" : "Kebab", "code": "kebab"],
    ["name" : "Korean", "code": "korean"],
    ["name" : "Kosher", "code": "kosher"],
    ["name" : "Kurdish", "code": "kurdish"],
    ["name" : "Laos", "code": "laos"],
    ["name" : "Laotian", "code": "laotian"],
    ["name" : "Latin American", "code": "latin"],
    ["name" : "Live/Raw Food", "code": "raw_food"],
    ["name" : "Lyonnais", "code": "lyonnais"],
    ["name" : "Malaysian", "code": "malaysian"],
    ["name" : "Meatballs", "code": "meatballs"],
    ["name" : "Mediterranean", "code": "mediterranean"],
    ["name" : "Mexican", "code": "mexican"],
    ["name" : "Middle Eastern", "code": "mideastern"],
    ["name" : "Milk Bars", "code": "milkbars"],
    ["name" : "Modern Australian", "code": "modern_australian"],
    ["name" : "Modern European", "code": "modern_european"],
    ["name" : "Mongolian", "code": "mongolian"],
    ["name" : "Moroccan", "code": "moroccan"],
    ["name" : "New Zealand", "code": "newzealand"],
    ["name" : "Night Food", "code": "nightfood"],
    ["name" : "Norcinerie", "code": "norcinerie"],
    ["name" : "Open Sandwiches", "code": "opensandwiches"],
    ["name" : "Oriental", "code": "oriental"],
    ["name" : "Pakistani", "code": "pakistani"],
    ["name" : "Parent Cafes", "code": "eltern_cafes"],
    ["name" : "Parma", "code": "parma"],
    ["name" : "Persian/Iranian", "code": "persian"],
    ["name" : "Peruvian", "code": "peruvian"],
    ["name" : "Pita", "code": "pita"],
    ["name" : "Pizza", "code": "pizza"],
    ["name" : "Polish", "code": "polish"],
    ["name" : "Portuguese", "code": "portuguese"],
    ["name" : "Potatoes", "code": "potatoes"],
    ["name" : "Poutineries", "code": "poutineries"],
    ["name" : "Pub Food", "code": "pubfood"],
    ["name" : "Rice", "code": "riceshop"],
    ["name" : "Romanian", "code": "romanian"],
    ["name" : "Rotisserie Chicken", "code": "rotisserie_chicken"],
    ["name" : "Rumanian", "code": "rumanian"],
    ["name" : "Russian", "code": "russian"],
    ["name" : "Salad", "code": "salad"],
    ["name" : "Sandwiches", "code": "sandwiches"],
    ["name" : "Scandinavian", "code": "scandinavian"],
    ["name" : "Scottish", "code": "scottish"],
    ["name" : "Seafood", "code": "seafood"],
    ["name" : "Serbo Croatian", "code": "serbocroatian"],
    ["name" : "Signature Cuisine", "code": "signature_cuisine"],
    ["name" : "Singaporean", "code": "singaporean"],
    ["name" : "Slovakian", "code": "slovakian"],
    ["name" : "Soul Food", "code": "soulfood"],
    ["name" : "Soup", "code": "soup"],
    ["name" : "Southern", "code": "southern"],
    ["name" : "Spanish", "code": "spanish"],
    ["name" : "Steakhouses", "code": "steak"],
    ["name" : "Sushi Bars", "code": "sushi"],
    ["name" : "Swabian", "code": "swabian"],
    ["name" : "Swedish", "code": "swedish"],
    ["name" : "Swiss Food", "code": "swissfood"],
    ["name" : "Tabernas", "code": "tabernas"],
    ["name" : "Taiwanese", "code": "taiwanese"],
    ["name" : "Tapas Bars", "code": "tapas"],
    ["name" : "Tapas/Small Plates", "code": "tapasmallplates"],
    ["name" : "Tex-Mex", "code": "tex-mex"],
    ["name" : "Thai", "code": "thai"],
    ["name" : "Traditional Norwegian", "code": "norwegian"],
    ["name" : "Traditional Swedish", "code": "traditional_swedish"],
    ["name" : "Trattorie", "code": "trattorie"],
    ["name" : "Turkish", "code": "turkish"],
    ["name" : "Ukrainian", "code": "ukrainian"],
    ["name" : "Uzbek", "code": "uzbek"],
    ["name" : "Vegan", "code": "vegan"],
    ["name" : "Vegetarian", "code": "vegetarian"],
    ["name" : "Venison", "code": "venison"],
    ["name" : "Vietnamese", "code": "vietnamese"],
    ["name" : "Wok", "code": "wok"],
    ["name" : "Wraps", "code": "wraps"],
    ["name" : "Yugoslav", "code": "yugoslav"]]

let SwitchCellIdentifier = "FilterSwitchCell"
let DropDownCellIdentifier = "FilterDropDownCell"
let SeeAllCellIdentifier = "SeeAllCell"

protocol FiltersViewControllerDelegate: class {
  func filtersViewControllerSearch(filtersViewController: FiltersViewController, didUpdateFilters filters: [String:Any])
}

class FiltersViewController: UIViewController {
  
  @IBOutlet weak var tableView: UITableView!
  
  var tableStructure : [(String, [rowId], String)] = [("", [.Deal], SwitchCellIdentifier),
    ("Distance", [.BestMatch], DropDownCellIdentifier),
    ("Sort By", [.BestMatch], DropDownCellIdentifier),
    ("Category", [], SwitchCellIdentifier),
    ("", [], SeeAllCellIdentifier)]
  
  var dealsSwitchState: Bool = false
  var sortByMenuState: YelpSortMode?
  var radiusMenuState: YelpRadiusMode?
  var categorySwitchStates : [Int: Bool] = [:]
  
  weak var delegate: FiltersViewControllerDelegate?
  
  override func viewDidLoad() {
    super.viewDidLoad()

    tableView.dataSource = self
    tableView.delegate = self
    tableView.rowHeight = UITableViewAutomaticDimension
    tableView.estimatedRowHeight = 80
    
    // Setup Cancel button in navigation bar
    let cancelButton = UIBarButtonItem()
    cancelButton.title = "Cancel"
    cancelButton.action = Selector("cancelFilter")
    cancelButton.target = self
    navigationItem.leftBarButtonItem = cancelButton
    
    // Setup Search button in navigation bar
    let searchButton = UIBarButtonItem()
    searchButton.title = "Search"
    searchButton.action = Selector("searchWithFilters")
    searchButton.target = self
    navigationItem.rightBarButtonItem = searchButton
    
    navigationItem.title = "Filter"

  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  internal func cancelFilter() {
    dismissViewControllerAnimated(true, completion: nil)
  }
  
  internal func searchWithFilters() {
    dismissViewControllerAnimated(true, completion: nil)
  
    // Assemble filters 
    // TODO: move this to a FiltersModel to assemble?
    var filters: [String: Any] = [:]
    filters["deals"] = dealsSwitchState
    filters["sortBy"] = sortByMenuState ?? .BestMatched
    filters["radius"] = radiusMenuState ?? .RadiusNone
    
    var selectedCategories = [String]()
    for (row, isSelected) in categorySwitchStates {
      if isSelected {
        if tableStructure.count == 4 {
          selectedCategories.append(allCategories[row]["code"]!)
        } else {
          selectedCategories.append(popularCategories[row]["code"]!)
        }
      }
    }
    filters["categories"] = selectedCategories

    delegate?.filtersViewControllerSearch(self, didUpdateFilters: filters)
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

// MARK: - UITableViewDelegate
extension FiltersViewController: UITableViewDelegate {
  func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    tableView.deselectRowAtIndexPath(indexPath, animated: true)
    let filterSection = indexPath.section
    
    // When Radius or Sort By sections are selected, expand and collapse
    if filterSection == 1 || filterSection == 2 {
      if tableStructure[filterSection].1.count == 1 {
        // Show all options
        if filterSection == 1 {
          tableStructure[filterSection].1 = [.BestMatch, .Radius800, .Radius1600, .Radius8000, .Radius16000]
        } else {
          tableStructure[filterSection].1 = [.BestMatch, .SortByDistance, .SortByRating]
        }
      } else {
        // Select new option and hide
        let selectedRowValue = tableStructure[filterSection].1[indexPath.row]
        tableStructure[filterSection].1 = [selectedRowValue]
        
        if filterSection == 1 {
          radiusMenuState = radiusMap[selectedRowValue]!
        } else {
          sortByMenuState = sortByMap[selectedRowValue]!
        }
      }
    } else if filterSection == 4 {
      // See All Button selected, remove the button
      tableStructure.removeAtIndex(4)
      
    }
    
    tableView.reloadData()
  }

}

// MARK: - UITableViewDataSource 
extension FiltersViewController: UITableViewDataSource {
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cellType = tableStructure[indexPath.section].2
    
    if cellType == SwitchCellIdentifier {
      let cell = tableView.dequeueReusableCellWithIdentifier(cellType, forIndexPath: indexPath)
        as! FilterSwitchCell
      let itemsInSection = tableStructure[indexPath.section].1
      if itemsInSection.count == 0 {
        if (tableStructure.count == 4) {
          // Rendering all categories
          cell.filterLabel?.text = allCategories[indexPath.row]["name"]
        } else {
          cell.filterLabel?.text = popularCategories[indexPath.row]["name"]
        }
      } else {
        cell.filterLabel?.text = itemsInSection[indexPath.row].rawValue
      }
      
      cell.delegate = self
      
      // Read the switch states to render the correct state in the cell
      if indexPath.section == 0 {
        cell.onSwitch.on = dealsSwitchState
      } else if indexPath.section == 3 {
        cell.onSwitch.on = categorySwitchStates[indexPath.row] ?? false
      }
      
      return cell
    } else if cellType == DropDownCellIdentifier{
      let cell = tableView.dequeueReusableCellWithIdentifier(cellType, forIndexPath: indexPath)
        as! FilterDropDownCell
      let itemsInSection = tableStructure[indexPath.section].1
      cell.filterLabel?.text = itemsInSection[indexPath.row].rawValue
      
      // Read the menu states to render the correct image in the cell
      if itemsInSection.count > 1 {
        cell.dropDownImage.image = UIImage(named: "iconmonstr-circle-outline-icon-256-2")
      } else {
        if (indexPath.section == 1 && radiusMenuState != nil) || (indexPath.section == 2 && sortByMenuState != nil){
          cell.dropDownImage.image = UIImage(named: "iconmonstr-check-mark-11-icon-256-2")
        } else {
          cell.dropDownImage.image = UIImage(named: "iconmonstr-arrow-36-icon-256-2")
        }
      }
      
      return cell
    } else {
      // See All cell
      let cell = tableView.dequeueReusableCellWithIdentifier(cellType, forIndexPath: indexPath)
        as! SeeAllCell
      return cell
    }
  }
  
  func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return tableStructure.count
  }
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    if section == 3 {
      if tableStructure.count == 4 {
        return allCategories.count
      } else {
        return popularCategories.count
      }
    } else if section == 4 {
      return 1
    } else {
      return tableStructure[section].1.count
    }
  }
  
  func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    return tableStructure[section].0
  }
  
  func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    if section == 4 {
      return 0
    } else {
      return 50
    }
  }
}

// MARK: - FilterSwitchCellDelegate
extension FiltersViewController: FilterSwitchCellDelegate {
  func filterSwitchCellToggled(filterSwitchCell: FilterSwitchCell, didChangeValue value: Bool?) {
    let indexPath = tableView.indexPathForCell(filterSwitchCell)!
    print("switch cell toggled for " + "\(indexPath.section)" + "_" + "\(indexPath.row)")
    
    if (indexPath.section == 0) {
      dealsSwitchState = value!
    } else if (indexPath.section == 3) {
      categorySwitchStates[indexPath.row] = value!
    }
    
  }
}