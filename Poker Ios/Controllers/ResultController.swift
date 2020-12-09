//
//  ResultController.swift
//  Poker Ios
//
//  Created by Chu Hoang Hai on 2020/12/07.
//
import UIKit

class ResultController: UITableViewController {
    //MARK: Properties
    @IBOutlet weak var tbl_view: UITableView!
    
    @IBAction func backToPrevScreen(_ sender: Any) {
        (self.tabBarController as? AdjustableTabBarController)?.setSelectedViewController()
           
    }
    var hands = [HandResponse]()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tbl_view.addObserver(self, forKeyPath: "contentSize", options: .new, context: nil)
        self.tbl_view.reloadData()
    }

    override func viewWillDisappear(_ animated: Bool) {
        self.tbl_view.removeObserver(self, forKeyPath: "contentSize")
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return hands.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "ResultCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? ResultCell  else {
            fatalError("The dequeued cell is not an instance of MealTableViewCell.")
        }
        
        // Fetches the appropriate meal for the data source layout.
        cell.selectionStyle = .none
        let result = hands[indexPath.row]
        
        cell.handType.text = result.hand
        cell.cards.text = result.card
        
            
        return cell
    }
 
    //MARK: Private Methods


}

