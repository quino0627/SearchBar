//
//  ViewController.swift
//  SearchBar
//
//  Created by 송 on 2018. 9. 4..
//  Copyright © 2018년 송. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    var deviceArray = [DeviceModel]()
    var currentDeviceArray = [DeviceModel]() //update table

    override func viewDidLoad() {
        super.viewDidLoad()
        appendDeviceInfo()
//        setUpSearchBar()
    }

    private func appendDeviceInfo(){
        deviceArray.append(DeviceModel(deviceName: "iPhone X", companyName: .Apple))
        deviceArray.append(DeviceModel(deviceName: "Galaxy S9", companyName: .Samsung))
        deviceArray.append(DeviceModel(deviceName: "GalaxyNote 9", companyName: .Samsung))
        deviceArray.append(DeviceModel(deviceName: "iPhone SE", companyName: .Apple))
        deviceArray.append(DeviceModel(deviceName: "iPhone 8S", companyName: .Apple))
        
        currentDeviceArray = deviceArray
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return deviceArray.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "RowCell") as? TableCell else {
            return UITableViewCell()
        }
        cell.titleLabel.text = deviceArray[indexPath.row].deviceName
        cell.categoryLabel.text = deviceArray[indexPath.row].companyName.rawValue
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

