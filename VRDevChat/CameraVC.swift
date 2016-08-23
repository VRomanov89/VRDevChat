//
//  ViewController.swift
//  VRDevChat
//
//  Created by Volodymyr Romanov on 8/22/16.
//  Copyright © 2016 Volodymyr Romanov. All rights reserved.
//

import UIKit

class CameraVC: AAPLCameraViewController {
    @IBAction func recordButton(_ sender: UIBarButtonItem) {
        toggleMovieRecording()
    }
    
    @IBAction func cameraButton(_ sender: UIBarButtonItem) {
        changeCamera()
    }
    
    @IBOutlet weak var previewView: AAPLPreviewView!

    override func viewDidLoad() {
        self._previewView = previewView
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    
}

