//
//  UserModel.swift
//  MVCSumple
//
//  Created by Masato Takamura on 2021/05/29.
//

import Foundation

struct UserModel: Codable {
    var name: String = ""
    var atName: String = ""
    var isOn: Bool = false
    
    enum CodingKeys: String, CodingKey {
        case name
        case atName = "at_name"
        case isOn = "switch"
    }
    
    var alertText: String {
        name + "\n" + atName
    }
    
}
