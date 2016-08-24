//
//  ViewController.swift
//  VRDevChat
//
//  Created by Volodymyr Romanov on 8/22/16.
//  Copyright © 2016 Volodymyr Romanov. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class CameraVC: AAPLCameraViewController, AAPLCameraVCDelegate {
    @IBAction func recordButton(_ sender: UIBarButtonItem) {
        toggleMovieRecording()
    }
    @IBOutlet weak var recordButton: UIBarButtonItem!
    
    @IBAction func cameraButton(_ sender: UIBarButtonItem) {
        changeCamera()
    }
    @IBOutlet weak var cameraButton: UIBarButtonItem!
    
    @IBOutlet weak var previewView: AAPLPreviewView!

    override func viewDidLoad() {
        delegate = self
        self._previewView = previewView
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        guard FIRAuth.auth()?.currentUser != nil else {
            //load login VC
            performSegue(withIdentifier: "loginVC", sender: nil)
            return
        }
    }
    
    func shouldEnableCameraUI(_ enable: Bool) {
        cameraButton.isEnabled = enable
        print("Camera UI")
    }
    
    func shouldEnableRecordUI(_ enable: Bool) {
        recordButton.isEnabled = enable
        print("record UI")
    }
    
    func recordingHasStarted() {
        print("recording started")
    }
    
    func canStartRecording() {
        print("can start recording")
    }
    
    
}

