//
//  StorageManager.swift
//  WorkoutApp
//
//  Created by Yaz Burrell on 3/5/19.
//  Copyright © 2019 Yaz Burrell. All rights reserved.
//

import Foundation
import FirebaseStorage
import FirebaseAuth

protocol StorageManagerDelegate: AnyObject {
    func didFetchWorkout(_ storageManager: StorageManager, workoutURL: URL)
}

final class StorageManager {
    weak var delegate: StorageManagerDelegate?
    
    // reference to the firebsase storage app
    private let storageRef: StorageReference = {
        let storage = Storage.storage()
        return storage.reference()
    }()
    
    public func postWorkout(withData data: Data) {
        guard let user = Auth.auth().currentUser else {
            print("no logged user")
            return
        }
        let workoutsRef = storageRef.child(StorageKeys.WorkoutKey)
        let newInfoRef = workoutsRef.child("\(user.uid)")
        let metadata = StorageMetadata()
        metadata.contentType = "image/jpeg"
        let uploadTask = newInfoRef.putData(data, metadata: metadata) { (metadata, error) in
            guard let metadata = metadata else {
                print("error uploading data")
                return
            }
            let _ = metadata.size // other properties, content-type
            newInfoRef.downloadURL(completion: { (url, error) in
                if let error = error {
                    print("downloadURL error: \(error)")
                } else if let url = url {
                    // can be attached to a document in the a firestore collection as needed
                    print("downloadURL: \(url)")
                    self.delegate?.didFetchWorkout(self, workoutURL: url)
                }
            })
        }
        // observe states on uploadTask
        uploadTask.observe(.failure) { (storageTaskSnapshot) in
            print("failure...")
        }
        uploadTask.observe(.pause) { (storageTaskSnapshot) in
            print("pause...")
        }
        uploadTask.observe(.progress) { (storageTaskSnapshot) in
            print("progress...")
        }
        uploadTask.observe(.resume) { (storageTaskSnapshot) in
            print("resume...")
        }
        uploadTask.observe(.success) { (storageTaskSnapshot) in
            print("success...")
        }
    }
}
