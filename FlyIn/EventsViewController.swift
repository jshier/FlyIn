//
//  ViewController.swift
//  FlyIn
//
//  Created by Jon Shier on 7/16/17.
//  Copyright © 2017 Jon Shier. All rights reserved.
//

import FlyInLogic
import UIKit

class EventsViewController: UIViewController {
    
    @IBOutlet var daysCollectionView: UICollectionView!
    
    private let center = EventsLogicCenter()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        center.fetchEvents { error in
            // error.map(present)
            
            self.daysCollectionView.reloadData()
        }
    }
    
    
}

extension EventsViewController: UICollectionViewDelegate {
    
}

extension EventsViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return center.pages
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return dequeueDayEventsCell(from: collectionView, for: indexPath) { cell in
            cell.setup(with: self.center.center(for: Page(rawValue: indexPath.row)!)!)
        }
    }
    
}
