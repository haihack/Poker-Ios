//
//  HistoryController.swift
//  Poker Ios
//
//  Created by Chu Hoang Hai on 2020/12/08.
//

import Foundation
import  UIKit
import RealmSwift

class HistoryController: UITableViewController {
    //MARK: Properties
    
    private var realm: Realm!
    private var history: Results<HandResponse>!
    private var token: NotificationToken!
    @IBOutlet var tblHistory: UITableView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        realm = try! Realm()
        history = realm.objects(HandResponse.self).sorted(byKeyPath: "time", ascending: false)
        
    }
    
    func reload() {
        tblHistory.reloadData()
    }
    
    func getFormattedTime(milisecond: Int64) ->  String {
        let dateVar = Date(milliseconds: milisecond)
        var dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yy/MM/dd hh:mm"
        print(dateFormatter.string(from: dateVar))
        return dateFormatter.string(from: dateVar)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        token = history.observe { changes in
            switch changes {
            case .initial:
                self.tblHistory.reloadData()
            case .update(_, let deletions, let insertions, let modifications):
                // Query results have changed, so apply them to the UITableView
                self.tblHistory.beginUpdates()
                self.tblHistory.insertRows(at: insertions.map({ IndexPath(row: $0, section: 0) }), with: .automatic)
                self.tblHistory.endUpdates()
            case .error(let error):
                // handle error
                ()
            }
        }
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return history.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "HistoryCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? HistoryCell  else {
            fatalError("The dequeued cell is not an instance of MealTableViewCell.")
        }
        
        // Fetches the appropriate meal for the data source layout.
        cell.selectionStyle = .none
        let time = history[indexPath.row]
        
        cell.lblCardNames.text = time.hand
        cell.lblRank.text = time.card
        cell.lblTime.text = getFormattedTime(milisecond: time.time)
        
        return cell
    }
    
    //MARK: Private Methods

}
