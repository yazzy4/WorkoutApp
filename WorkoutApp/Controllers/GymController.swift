//
//  ViewController.swift
//  WorkoutApp
//
//  Created by Yaz Burrell on 12/21/18.
//  Copyright © 2018 Yaz Burrell. All rights reserved.
//

import UIKit

class GymController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private var refreshControl: UIRefreshControl!
    
    public var gyms = [Gym]() {
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
        fetchGyms()
//        fetchDays()
        title = "gymMap"

    }
    
    private func setupRefreshControl(){
        refreshControl = UIRefreshControl()
        tableView.refreshControl = refreshControl
        refreshControl.addTarget(self, action: #selector(fetchGyms), for: .valueChanged)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        fetchGyms()
    }
    
    @objc private func fetchGyms() {
        GymAPIClient.getGymInfo {(appError, gym) in
            if let appError = appError {
                print(appError.errorMessage())
            } else if let gym = gym {
                self.gyms = [gym]
                dump(self.gyms)
            }
           }
        }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = tableView.indexPathForSelectedRow,
            let workoutDetailViewController = segue.destination as? GymDetailViewController else {
                return
        }
        let gym = gyms[indexPath.row]
        workoutDetailViewController.gymDetails = gym
        }
    }



extension GymController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gyms.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "workoutCell", for: indexPath)
        let day = gyms[indexPath.row]
//        cell.textLabel?.text = day.title
//        cell.detailTextLabel?.text = day.workOutDays
        return cell
    }
    
}
