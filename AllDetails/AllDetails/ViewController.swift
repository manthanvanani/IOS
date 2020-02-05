//
//  ViewController.swift
//  AllDetails
//
//  Created by Manthan Vanani on 03/02/20.
//  Copyright © 2020 Manthan Vanani. All rights reserved.
//

import UIKit
import FirebaseStorage

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let documentsUrl = FileManager.default.urls(for: .documentDirectory,
        in: .userDomainMask).first!
        
        print(documentsUrl)
        
        let storageRef = Storage.storage().reference()
        


        
       // File located on disk
        let localFile = documentsUrl.appendingPathComponent("Details.zip")

       // Create a reference to the file you want to upload
       let riversRef = storageRef.child("Details1.zip")
        print(localFile)
        let uploadTask = riversRef.putFile(from: localFile, metadata: nil)
        
        // Add a progress observer to an upload task
        let observer = uploadTask.observe(.progress) { snapshot in
          let percentComplete = 100.0 * Double(snapshot.progress!.completedUnitCount)
          / Double(snapshot.progress!.totalUnitCount)
            print(percentComplete)
        }
        print(observer)
        
        storageRef.downloadURL { (URL, error) -> Void in
          if (error != nil) {
            // Handle any errors
          } else {
            // Get the download URL for 'images/stars.jpg'
          }
        }
    }


}

