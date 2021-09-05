//
//  Node.swift
//  treeview1
//
//  Created by James Hudson on 9/3/21.
//

import Foundation
import Cocoa

class Node: NSObject {
    
    @objc dynamic let id: String
    @objc dynamic let value: String
    @objc dynamic var children: [Node]
    
    init(_ id: String, _ value: String, _ children: [Node] = []) {
         self.id = id
         self.value = value
         self.children = children
    }
    
    @objc dynamic var isLeaf: Bool {
        return children.isEmpty
    }
    
    @objc dynamic var childCount: Int {
        return children.count
    }
}
