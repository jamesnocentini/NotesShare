//
//  ViewController.swift
//  NotesShare
//
//  Created by James Nocentini on 29/01/2015.
//  Copyright (c) 2015 James Nocentini. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, CBLUITableDelegate {
    
    @IBOutlet var dataSource: CBLUITableSource!
    @IBOutlet var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        dataSource.query = Note.queryNotes().asLiveQuery()
        dataSource.labelProperty = "text"
        dataSource.deletionAllowed = true
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let row = dataSource.rowAtIndex(UInt(indexPath.row))
        let note = Note(document: row.document)
        note.published = !note.published
        
        note.save(nil)
    }
    
    func couchTableSource(source: CBLUITableSource!, willUseCell cell: UITableViewCell!, forRow row: CBLQueryRow!) {
        let note = Note(document: row.document)
        
        if note.published {
            cell.accessoryType = UITableViewCellAccessoryType.Checkmark
        } else {
            cell.accessoryType = UITableViewCellAccessoryType.None
        }
    }


}

