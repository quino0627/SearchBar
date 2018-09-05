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
    //declare property
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
        deviceArray.append(DeviceModel(deviceName: "G6", companyName: .LG))
        deviceArray.append(DeviceModel(deviceName: "V30", companyName: .LG))
        deviceArray.append(DeviceModel(deviceName: "iPhone 8", companyName: .Apple))
        deviceArray.append(DeviceModel(deviceName: "iPhone 7S", companyName: .Apple))
        deviceArray.append(DeviceModel(deviceName: "iPhone 7", companyName: .Apple))
        deviceArray.append(DeviceModel(deviceName: "iPhone 3GS", companyName: .Apple))
        
        //set default value
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
    
/*
     Delegate를 사용 할 때, 위 Class처럼 관련 프로토콜들을 채택하여 사용할 수도 있지만,
     다음 주석처리된 코드와 같이 class extension(확장)을 이용하여 코드 분리화를 할 수 있습니다 :)
     다음과 같이 작성된 코드 예제는 ExtensionSample Branch에 작성될 예정입니다.
     //     extension TableViewController: UITableViewDataSource {
     //     func tableView(_ tableView: UITableView,
     //     numberOfRowsInSection section: Int) -> Int {
     //     return self.items.count
     //     }
     //
     //     func tableView(_ tableView: UITableView,
     //     cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     //     let cell: UITableViewCell = tableView.dequeueReusableCell
     //     (withIdentifier: "RowCell")! as UITableViewCell
     //
     //     cell.textLabel?.text = items[indexPath.row]
     //
     //     return cell
     //     }
     //     }
 */
    
    
    
    //*********TABLE FUNCTION(Delegate)*************
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentDeviceArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "RowCell") as? TableCell else {
            //You can see "RowCeell" at Storboard, identifier of cell
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
    
    
    
    
    //**************SEARCH(Delegate)****************
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        filterForText(searchBar.text!, scope: searchBar.scopeButtonTitles![selectedScope])
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        let scope = searchBar.scopeButtonTitles![searchBar.selectedScopeButtonIndex]
        filterForText(searchController.searchBar.text!, scope: scope)
    }
    //************SEARCH FINISHED*************
    
    
    
    //***************Some More Functions****************
    //A function that stores the result of filtering the DeviceArray in the currentDeviceArray according to the text and scope input.
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
    
    //self-explanatory
    func searchBarIsEmpty() -> Bool {
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }

    

}



