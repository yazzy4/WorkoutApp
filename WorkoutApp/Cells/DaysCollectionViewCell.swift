//
//  DaysCollectionViewCell.swift
//  WorkoutApp
//
//  Created by Yaz Burrell on 3/9/19.
//  Copyright © 2019 Yaz Burrell. All rights reserved.
//

import UIKit
import DateToolsSwift

class DaysCollectionViewCell: UICollectionViewCell {

    
    public lazy var weekdays: UILabel = {
        var label = UILabel()
        label.text = "Monday"
        return label
    }()
    
    public lazy var  weekdayNumber: UILabel = {
        var label = UILabel()
        label.text = "1"
        return label
    }()
    
    
    
}
