//
//  WorkoutDetailViewController.swift
//  WorkoutApp
//
//  Created by Yaz Burrell on 1/2/19.
//  Copyright © 2019 Yaz Burrell. All rights reserved.
//

import UIKit


class GymDetailViewController: UIViewController {
    
    @IBOutlet weak var planTableView: UITableView!
    
    var gymDetails: Gym!
    lazy var gymOptions = gymDetails.contact
    
    var gym = [Gym]()
    
    
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
        let gymDescription = gym[indexPath.row]
        descriptionDetailViewController.workout = self.gymDetails
        //        descriptionDetailViewController.descriptionText = workoutDescription
        
    }
    
}

extension GymDetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gymOptions.count
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = planTableView.dequeueReusableCell(withIdentifier: "dayCell", for: indexPath)
        let day = gym[indexPath.row]
        cell.textLabel?.text = day.gymName
        
        DispatchQueue.main.async {
            self.planTableView.reloadData()
            
        }
        
        
        return cell
        
    }
    
    
    
}
