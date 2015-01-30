//
//  AppDelegate.swift
//  NotesShare
//
//  Created by James Nocentini on 29/01/2015.
//  Copyright (c) 2015 James Nocentini. All rights reserved.
//

import UIKit

let kDatabase = CBLManager.sharedInstance().databaseNamed("notes_sharing", error: nil)
typealias CBLDoc = CBLDocument
let kSyncGateway = "http://178.62.81.153:4984/notes_sharing"

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        startReplications()
        
        return true
    }

    func startReplications() {
        let url = NSURL(string: kSyncGateway)
        
        let pull = kDatabase.createPullReplication(url)
        pull.continuous = true
        
        let push = kDatabase.createPushReplication(url)
        push.continuous = true
        
        let deviceName = UIDevice.currentDevice().name

        if (deviceName == "iPhone Simulator") {
            let auth = CBLAuthenticator.basicAuthenticatorWithName("James", password: "password")
            pull.authenticator = auth
            push.authenticator = auth
        } else {
            let auth = CBLAuthenticator.basicAuthenticatorWithName("John", password: "password")
            pull.authenticator = auth
            push.authenticator = auth
        }
        
        pull.start()
        push.start()
    }


}

