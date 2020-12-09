//
//  ScrollViewDemoController.swift
//  Poker Ios
//
//  Created by Chu Hoang Hai on 2020/12/01.
//

import UIKit

class ScrollViewDemoController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableHeightConstaint: NSLayoutConstraint!
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "HandTableViewCell", for: indexPath) as? HandTableViewCell  else {
            fatalError("The dequeued cell is not an instance of MealTableViewCell.")
        }
        
        // Fetches the appropriate meal for the data source layout.
//        let meal = meals[indexPath.row]
        
//        cell.nameLabel.text = "meal.name"
        
        
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        
//        cell.textLabel!.text = "aaaaa"
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
//        tableHeightConstaint.constant = 300000
    }


}
