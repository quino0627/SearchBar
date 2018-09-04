//
//  DeviceModel.swift
//  PracticeSearchBar
//
//  Created by 송 on 2018. 9. 3..
//  Copyright © 2018년 송. All rights reserved.
//

import UIKit

class DeviceModel: NSObject {
    var deviceName:String
    var companyName:companyType

    
    init(deviceName: String, companyName: companyType) {
        self.deviceName = deviceName
        self.companyName = companyName
    }
}

enum companyType:String {
    case Samsung = "Samsung"
    case Apple = "Apple"
    case LG = "LG"
}
