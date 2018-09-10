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
    
    var deviceArray = [DeviceModel]() //default Array
    var currentDeviceArray = [DeviceModel]() //Array for display
    
    var resultsController : UITableViewController!
    var searchController : UISearchController!

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpDeviceInfo()
        setUpResultsController()
        setUpSearchController()
        
    }
    
    //Setup Data
    private func setUpDeviceInfo(){
        deviceArray.append(DeviceModel(deviceName: "iPhone X", companyName: .Apple))
        deviceArray.append(DeviceModel(deviceName: "Galaxy S9", companyName: .Samsung))
        deviceArray.append(DeviceModel(deviceName: "GalaxyNote 9", companyName: .Samsung))
        deviceArray.append(DeviceModel(deviceName: "iPhone SE", companyName: .Apple))
        deviceArray.append(DeviceModel(deviceName: "iPhone 8S", companyName: .Apple))
        deviceArray.append(DeviceModel(deviceName: "G6", companyName: .LG))
        deviceArray.append(DeviceModel(deviceName: "V30", companyName: .LG))
        deviceArray.append(DeviceModel(deviceName: "iPhone 8", companyName: .Apple))
        deviceArray.append(DeviceModel(deviceName: "iPhone 7S", companyName: .Apple))
        deviceArray.append(DeviceModel(deviceName: "iPhone 7", companyName: .Apple))
        deviceArray.append(DeviceModel(deviceName: "iPhone 3GS", companyName: .Apple))
        //set default value
        currentDeviceArray = deviceArray
    }
    
    private func setUpResultsController(){
        resultsController = UITableViewController(style: .plain)
        resultsController.tableView.dataSource = self
        resultsController.tableView.delegate = self
        resultsController.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CurrentDeviceCell")
    }
    
    //Setup SearchBar && Scope
    private func setUpSearchController(){
        //Setup SearchBar
        searchController = UISearchController(searchResultsController: resultsController)
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search Smartphones"
        searchController.dimsBackgroundDuringPresentation = true
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = true
        definesPresentationContext = true
        
        searchController.searchBar.scopeButtonTitles = ["All","Samsung","Apple","LG"]
        searchController.searchBar.delegate = self
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if(tableView == self.tableView){
            return deviceArray.count
        }
        else{
            return currentDeviceArray.count
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cellIdentifier: String
        var dic : DeviceModel!
        if(tableView == self.tableView){
            cellIdentifier = "DeviceCell"
            dic = self.deviceArray[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? TableCell
            cell?.titleLabel.text = dic.deviceName
            cell?.categoryLabel.text = dic.companyName.rawValue
            return cell!
        }
        else{
            cellIdentifier = "CurrentDeviceCell"
            dic = self.currentDeviceArray[indexPath.row]
            let cell = resultsController.tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
            cell.textLabel?.text = dic.deviceName
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if (tableView == self.tableView) {
            return 70
        }
        else{
            return 140
        }
    }
    
    
    
    
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        filterForText(searchBar.text!, scope: searchBar.scopeButtonTitles![selectedScope])
        print("This function is executed when the category changes!")
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        let scope = searchBar.scopeButtonTitles![searchBar.selectedScopeButtonIndex]
        filterForText(searchController.searchBar.text!, scope: scope)
        print("This function is executed every time a character is typed!")
    }
    
    //A function that stores the result of filtering the DeviceArray in the currentDeviceArray according to the text and scope input.(provide the correct data)
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
        resultsController.tableView.reloadData()
        
    }
    
    //self-explanatory!
    func searchBarIsEmpty() -> Bool {
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }

    

}



