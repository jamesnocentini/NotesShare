//
//  AddViewController.swift
//  NotesShare
//
//  Created by James Nocentini on 29/01/2015.
//  Copyright (c) 2015 James Nocentini. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {
    
    @IBOutlet var noteTextfield: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func newNote(sender: AnyObject) {
        let note = Note(text: noteTextfield.text)
        note.save(nil)
        navigationController?.popViewControllerAnimated(true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
