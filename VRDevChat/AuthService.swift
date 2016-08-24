//
//  AuthServic.swift
//  VRDevChat
//
//  Created by Volodymyr Romanov on 8/24/16.
//  Copyright © 2016 Volodymyr Romanov. All rights reserved.
//

import Foundation
import Firebase
import FirebaseAuth

typealias Completion = (_ errMsg: String?, _ data: AnyObject?) -> Void

class AuthService {
    private static let _instance = AuthService()
    static var instance: AuthService {
        return _instance
    }
    
    func login(email: String, pass: String, onComplete: Completion?) {
        FIRAuth.auth()?.signIn(withEmail: email, password: pass, completion: { (user, error) in
            if error != nil {
                if let errorCode = FIRAuthErrorCode(rawValue: error!._code) {
                    if errorCode == .errorCodeUserNotFound {
                        FIRAuth.auth()?.createUser(withEmail: email, password: pass, completion: { (user, error) in
                            if error != nil {
                                //Show error to user
                                self.handleFirebaseError(error: error as! NSError, onComplete: onComplete)
                            } else {
                                if user?.uid != nil {
                                    //Sign In
                                    FIRAuth.auth()?.signIn(withEmail: email, password: pass, completion: { (user, error) in
                                        if error != nil {
                                            //Show error to user
                                            self.handleFirebaseError(error: error as! NSError, onComplete: onComplete)
                                        } else {
                                            //Logged in
                                            onComplete?(nil, user)
                                        }
                                    })
                                }
                            }
                        })
                    }
                } else {
                    //Handle all other errors
                    self.handleFirebaseError(error: error as! NSError, onComplete: onComplete)
                }
            } else {
                //Successfully logged in
                onComplete?(nil, user)
            }
        })
    }
    
    func handleFirebaseError(error: NSError, onComplete: Completion?) {
        print(error.debugDescription)
        if let errorCode = FIRAuthErrorCode(rawValue: error.code) {
            switch errorCode {
            case .errorCodeInvalidEmail:
                onComplete?("Invalid emaila ddress.", nil)
            case .errorCodeWrongPassword:
                onComplete?("Wrong password.", nil)
            case .errorCodeEmailAlreadyInUse:
                onComplete?("Email already in use.", nil)
            case .errorCodeAccountExistsWithDifferentCredential:
                onComplete?("Email already in use.", nil)
            default:
                onComplete?("Don't know what the issue was, try again.", nil)
            }
        }
    }
}
