//
//  ViewController.swift
//  WorkoutApp
//
//  Created by Yaz Burrell on 12/21/18.
//  Copyright © 2018 Yaz Burrell. All rights reserved.
//

import UIKit

class WorkoutController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private var refreshControl: UIRefreshControl!
    
    public var workouts = [Gym]() {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       tableView.dataSource = self
        setupRefreshControl()
        fetchWorkouts()
//        fetchDays()
        title = "gymMap"

    }
    
    private func setupRefreshControl(){
        refreshControl = UIRefreshControl()
        tableView.refreshControl = refreshControl
        refreshControl.addTarget(self, action: #selector(fetchWorkouts), for: .valueChanged)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        fetchWorkouts()
    }
    
    @objc private func fetchWorkouts() {
        WorkoutAPIClient.getWorkout {(appError, gym) in
            if let appError = appError {
                print(appError.errorMessage())
            } else if let gym = gym {
                self.workouts = [gym]
                dump(self.workouts)
            }
           }
        }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = tableView.indexPathForSelectedRow,
            let workoutDetailViewController = segue.destination as? WorkoutDetailViewController else {
                return
        }
        let workout = workouts[indexPath.row]
        workoutDetailViewController.workout = workout
        }
    }



extension WorkoutController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return workouts.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "workoutCell", for: indexPath)
        let day = workouts[indexPath.row]
//        cell.textLabel?.text = day.title
//        cell.detailTextLabel?.text = day.workOutDays
        return cell
    }
    
}
