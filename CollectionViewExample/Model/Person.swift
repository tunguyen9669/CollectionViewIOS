//
//  Person.swift
//  ExampleTableView
//
//  Created by admin on 9/24/18.
//  Copyright © 2018 admin. All rights reserved.
//

import Foundation

class Person: NSObject {
    var avatar: String
    var name: String
    var age: Int
    
    init(_ avatar: String, _ name: String, _ age: Int) {
        self.avatar = avatar
        self.name = name
        self.age = age
    }
}
