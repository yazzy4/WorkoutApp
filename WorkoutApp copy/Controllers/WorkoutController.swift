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

    public var workouts = [Workout]() {
        didSet {
            DispatchQueue.main.async {
                self.title = "BLS"
                self.tableView.reloadData()
            }
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
       tableView.dataSource = self
        setupRefreshControl()
    }
    
    private func setupRefreshControl(){
        refreshControl = UIRefreshControl()
        tableView.refreshControl = refreshControl
//        refreshControl.addTarget(self, action: #selector(fetchWorkouts), for: .valueChanged)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        fetchWorkouts()
    }
    @objc private func fetchWorkouts() {
        WorkoutAPIClient.getWorkout {(appError, workouts) in
            if let appError = appError {
//                print(appError.errorMessage())
            } else if let workouts = workouts {
                self.workouts = workouts
            }
            DispatchQueue.main.async {
                self.refreshControl.endRefreshing()
            }
        }
    }
}

extension WorkoutController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return workouts.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "workoutCell", for: indexPath)
        let workout = workouts[indexPath.row]
        cell.textLabel?.text = workout.title
        cell.detailTextLabel?.text = workout.id
        return cell
    }
    
}
