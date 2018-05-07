//
//  TopAppsTableViewController.swift
//  MVVM Example
//
//  Created by Dave on 5/6/18.
//  Copyright © 2018 High Tree Development. All rights reserved.
//

import UIKit

class TopAppsTableViewController: UITableViewController {
    
    @IBOutlet var viewModel: ViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // The view owns the ViewModel in MVVM
        //
        viewModel.getApps {
            // Empty completion so this fires as soon as the viewModel is done its API call
            //
            self.tableView.reloadData()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // Marker: TableView dataSource methods
    // Notice we don't perform any data manipulation in the View we get our values directly from the ViewModel instead
    //
    override func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSectionsToDisplay()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfItemsToDisplay(in: section)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = viewModel.appTitleToDisplay(for: indexPath)
        cell.detailTextLabel?.text = viewModel.appReleaseDataToDisplay(for: indexPath)
        return cell
    }
}
