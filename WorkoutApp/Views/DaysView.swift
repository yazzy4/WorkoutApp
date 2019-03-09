//
//  DaysView.swift
//  WorkoutApp
//
//  Created by Yaz Burrell on 3/5/19.
//  Copyright © 2019 Yaz Burrell. All rights reserved.
//

import UIKit

class DaysView: UIView {

    public lazy var weekdayView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
    
        let cv = UICollectionView.init(frame: CGRect.zero, collectionViewLayout: layout)
        cv.register(DaysCollectionViewCell.self, forCellWithReuseIdentifier: "weekdays")
        return cv
    }()

    func setCollectionView(){
        addSubview(weekdayView)
        weekdayView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    override init(frame: CGRect){
        super.init(frame: UIScreen.main.bounds)
        commonInit()
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    private func commonInit() {
       setCollectionView()
    }
}
