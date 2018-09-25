//
//  Department.swift
//  ExampleTableView
//
//  Created by admin on 9/24/18.
//  Copyright © 2018 admin. All rights reserved.
//

import Foundation

class Department: NSObject {
    var isExpand: Bool
    var title: String
    var person: [Person]
    
    init(_ isExpand: Bool, _ title: String, _ person: [Person]) {
        self.isExpand = isExpand
        self.title = title
        self.person = person
    }
}
