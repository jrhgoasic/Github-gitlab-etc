//
//  ViewController.swift
//  treeview1
//
//  Created by James Hudson on 9/3/21.
//

import Cocoa

class ViewController: NSViewController {

    let dateFormatter = DateFormatter()
    
    @objc dynamic var nodes = [Node]()
    @IBOutlet var treeController: NSTreeController!
    @IBOutlet weak var amountField: NSTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .medium
        
        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    @IBAction func buyCheseCoin(_ sender: Any) {
        
        if amountField.stringValue.isEmpty {
            return
        }
        
        let date = dateFormatter.string(from: Date())
        let uuid = UUID().uuidString
        let price = String(format: "%.2f", Double.random(in: 0.1...5.0))
        let amount = amountField.stringValue
        
        let node = Node(date, "Buy", [
                    Node("Amount Purchased", amount),
                    Node("Current Price", "$\(price)"),
                    Node("Transaction ID", uuid)
        ])
        
        treeController.addObject(node)
        amountField.stringValue = ""
        print("The amount", amount, "The Price", price, "The uuid", uuid, "The Date", date)
        print("The node Info",  node)
    }
    
    @IBAction func removeTransaction(_ sender: Any) {
        
        let selection = treeController.selectionIndexPaths
        treeController.removeObjects(atArrangedObjectIndexPaths: selection)
        
    }
}

