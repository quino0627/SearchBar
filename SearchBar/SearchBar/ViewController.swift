//
//  ViewController.swift
//  SearchBar
//
//  Created by 송 on 2018. 9. 4..
//  Copyright © 2018년 송. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate, UISearchResultsUpdating {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var deviceArray = [DeviceModel]()
    var currentDeviceArray = [DeviceModel]() //update table
    let searchController = UISearchController(searchResultsController: nil)

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpDeviceInfo()
        setUpSearchController()
    }

    //**************SETUP*****************
    
    //Setup Data
    private func setUpDeviceInfo(){
        deviceArray.append(DeviceModel(deviceName: "iPhone X", companyName: .Apple))
        deviceArray.append(DeviceModel(deviceName: "Galaxy S9", companyName: .Samsung))
        deviceArray.append(DeviceModel(deviceName: "GalaxyNote 9", companyName: .Samsung))
        deviceArray.append(DeviceModel(deviceName: "iPhone SE", companyName: .Apple))
        deviceArray.append(DeviceModel(deviceName: "iPhone 8S", companyName: .Apple))
        
        currentDeviceArray = deviceArray
    }
    //Setup SearchBar && Scope
    private func setUpSearchController(){
        //Setup SearchBar
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search Smartphones"
        navigationItem.searchController = searchController
        definesPresentationContext = true
        
        //Setup Scope
        searchController.searchBar.scopeButtonTitles = ["All","Samsung","Apple","LG"]
        
        //configuring delegate
        searchController.searchBar.delegate = self
    }
    
    //************SETUP FINISHED***************
    
    
    //*********TABLE FUNCTION*************
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        let searchBarScopeIsFiltering = searchController.searchBar.selectedScopeButtonIndex != 0
//        let isFiltering = searchController.isActive && (!searchBarIsEmpty() || searchBarScopeIsFiltering)
//        if isFiltering{
//            return currentDeviceArray.count
//        }
        return currentDeviceArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "RowCell") as? TableCell else {
            return UITableViewCell()
        }
        cell.titleLabel.text = currentDeviceArray[indexPath.row].deviceName
        cell.categoryLabel.text = currentDeviceArray[indexPath.row].companyName.rawValue
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    //***********TABLE FUNCTION FINISHED**************
    
    func filterForText(_ searchText: String, scope: String = "All"){
        currentDeviceArray = deviceArray.filter({ (device : DeviceModel) -> Bool in
            let doesCategoryMatch = (scope == "All") || (device.companyName.rawValue == scope)
            if(searchBarIsEmpty()){
                return doesCategoryMatch
            }
            else{
                return doesCategoryMatch && device.deviceName.lowercased().contains(searchText.lowercased())
            }
        })
        tableView.reloadData()
        
    }
    
    func searchBarIsEmpty() -> Bool {
        return (searchController.searchBar.text?.isEmpty)!
    }
    
    //**************SEARCH****************
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        filterForText(searchBar.text!, scope: searchBar.scopeButtonTitles![selectedScope])
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        let scope = searchBar.scopeButtonTitles![searchBar.selectedScopeButtonIndex]
        filterForText(searchController.searchBar.text!, scope: scope)
    }
    
    //************SEARCH FINISHED*************
    
    
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }

    

}

