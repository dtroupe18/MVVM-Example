//
//  ViewModel.swift
//  MVVM Example
//
//  Created by Dave on 5/6/18.
//  Copyright © 2018 High Tree Development. All rights reserved.
//

import Foundation

// Subclassing of NSObject is not required, but it allows you to store outlets in a storyboard
//
class ViewModel: NSObject {
    
    // ViewModel owns the data Model - in this case the model is a built in dataType not a custom class or struct
    //
    var apps: [Result]?
    
    // ViewModel fetching all of the data
    //
    func getApps(completion: @escaping () -> ()) {
        iTunesAPI.fetchTop100Apps(completion: { (arrayOfAppDict) in
            DispatchQueue.main.async {
                self.apps = arrayOfAppDict
                completion()
            }
        })
    }
    
    // Methods to help the view display the data in the ViewModel
    //
    func numberOfSectionsToDisplay() -> Int {
        return 1
    }
    
    func numberOfItemsToDisplay(in section: Int) -> Int {
        return apps?.count ?? 0
    }
    
    func appTitleToDisplay(for indexPath: IndexPath) -> String {
        return apps?[indexPath.row].name ?? ""
    }
    
    func appReleaseDataToDisplay(for indexPath: IndexPath) -> String {
        return apps?[indexPath.row].releaseDate ?? ""
    }
}
