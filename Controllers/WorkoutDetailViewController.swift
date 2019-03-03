//
//  WorkoutDetailViewController.swift
//  WorkoutApp
//
//  Created by Yaz Burrell on 1/2/19.
//  Copyright © 2019 Yaz Burrell. All rights reserved.
//

import UIKit

class WorkoutDetailViewController: UIViewController {
    
    @IBOutlet weak var planTableView: UITableView!
    
    var workout: Gym!
    //lazy var workoutDays = workout.days!
    
    
    private var refreshControl: UIRefreshControl!

    override func viewDidLoad() {
        super.viewDidLoad()
        planTableView.dataSource = self

    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        //fetchDays()
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = planTableView.indexPathForSelectedRow,
            let descriptionDetailViewController = segue.destination as? DescriptionDetailViewController else {
                return
        }
//    let workoutDescription = workoutDays[indexPath.row]
//        descriptionDetailViewController.workout = self.workout
//        descriptionDetailViewController.dayWorkoutDescription = workoutDescription
    }

}

extension WorkoutDetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return workoutDays.count
        return 4
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = planTableView.dequeueReusableCell(withIdentifier: "dayCell", for: indexPath)
        //let day = workoutDays[indexPath.row]
        //cell.textLabel?.text = day.muscleGroup1
        
        DispatchQueue.main.async {
            self.planTableView.reloadData()
            
        }
        
        
        return cell
        
    }
    
    
    
}
