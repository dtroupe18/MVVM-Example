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
    var apps: [App]?
    var results: [Result]?
    
    // ViewModel fetching all of the data
    //
    func getApps(completion: @escaping () -> ()) {
        iTunesAPI.fetchTop100Apps(completion: { (results) in
            DispatchQueue.main.async {
                self.results = results
                completion()
            }
        })
        
//        iTunesAPI.fetchTop25Apps(completion: { (apps) in
//            DispatchQueue.main.async {
//                self.apps = apps
//                completion()
//            }
//        })
    }
    
    // Methods to help the view display the data in the ViewModel
    //
    func numberOfSectionsToDisplay() -> Int {
        return 1
    }
    
    func numberOfItemsToDisplay(in section: Int) -> Int {
        if apps != nil {
            return apps!.count
        } else {
            return results?.count ?? 0
        }
    }
    
    func appTitleToDisplay(for indexPath: IndexPath) -> String {
        if apps != nil {
            return apps?[indexPath.row].name ?? ""
        } else {
            return results?[indexPath.row].name ?? ""
        }
    }
    
    func appReleaseDataToDisplay(for indexPath: IndexPath) -> String {
        if apps != nil {
            return apps?[indexPath.row].releaseDate ?? ""
        } else {
            return results?[indexPath.row].releaseDate ?? ""
        }
    }
}
