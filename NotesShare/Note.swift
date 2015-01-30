//
//  Note.swift
//  NotesShare
//
//  Created by James Nocentini on 29/01/2015.
//  Copyright (c) 2015 James Nocentini. All rights reserved.
//

import UIKit

class Note: CBLModel {
    
    @NSManaged var text: String
    @NSManaged var published: Bool
    
    init(text: String) {
        super.init(document: kDatabase.createDocument())
        
        setValue("note", ofProperty: "type")
        self.text = text
        self.published = false
    }
    
    override init!(document: CBLDoc) {
        super.init(document: document)
    }
    
    class func queryNotes() -> CBLQuery {
        let view: CBLView? = kDatabase.viewNamed("allNotes")
        if let view = view {
            view.setMapBlock({ (doc, emit) -> Void in
                if let type = doc["type"] as? String {
                    if type == "note" {
                        emit(doc["_id"], doc)
                    }
                }
            }, reduceBlock: nil, version: "1")
        }
        let query = view!.createQuery()
        return query
    }
   
}
