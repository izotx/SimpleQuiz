//
//  ViewController.swift
//  SimpleQuiz
//
//  Created by Janusz Chudzynski on 4/8/16.
//  Copyright © 2016 Janusz Chudzynski. All rights reserved.
//

import UIKit


//class Question {
//    
//}
//
//class Quiz {
//    
//}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var userSelection = [Int:Int]()
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.tableView.delegate = self
        self.tableView.dataSource = self
    //    self.tableView.style = .Grouped
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        cell.textLabel!.text = "\(indexPath.row)"
        if userSelection[indexPath.section] == indexPath.row{
            cell.accessoryType = .Checkmark
        }
        else{
            cell.accessoryType = .None
        }

        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        userSelection[indexPath.section] = indexPath.row
        //tableView.reloadSections([indexPath], withRowAnimation: .Automatic)
        tableView.reloadData()
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Question \(section) Lider Nowoczesnej apeluje, aby ustosunkował się do jego propozycji ws. TK"
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 150
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .Center
        label.text = "Question \(section) Lider Nowoczesnej apeluje, aby ustosunkował się do jego propozycji ws. TK ?"
        return label
    }
    
    
}

