//
//  DescriptionDetailViewController.swift
//  WorkoutApp
//
//  Created by Yaz Burrell on 1/7/19.
//  Copyright © 2019 Yaz Burrell. All rights reserved.
//

import UIKit

class DescriptionDetailViewController: UIViewController {
    
    
    @IBOutlet weak var descriptionText: UITextView!
    
   
    
    public var workout: Workout!
    lazy var dayDescription = workout.days!
    public var dayWorkoutDescription: Workout.Days!

    

    override func viewDidLoad() {
        super.viewDidLoad()
        descriptionText.isEditable = true
        
    }
    

    
}

extension DescriptionDetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 9
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "detailsCell", for: indexPath)
//        let exercise = dayDescription[indexPath.row]
//        cell.textLabel?.text = exercise.date
//        cell.textLabel?.text = exercise.arrival
        return cell
    }
}
