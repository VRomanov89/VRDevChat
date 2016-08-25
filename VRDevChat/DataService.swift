//
//  DataService.swift
//  VRDevChat
//
//  Created by Volodymyr Romanov on 8/24/16.
//  Copyright © 2016 Volodymyr Romanov. All rights reserved.
//

import Foundation
import Firebase
import FirebaseDatabase

class DataService {
    private static let _instance = DataService()
    
    static var instance: DataService {
        return _instance
    }
    
    var mainRef: FIRDatabaseReference {
        return FIRDatabase.database().reference()
    }
    
    func saveUser(uid: String) {
        let profile: Dictionary<String, AnyObject> = ["firstName" : "" as AnyObject, "lastName": "" as AnyObject]
        mainRef.child("users").child(uid).child("profile").setValue(profile)
    }
}
