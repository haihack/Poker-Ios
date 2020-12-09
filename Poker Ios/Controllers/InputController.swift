//
//  File.swift
//  Poker Ios
//
//  Created by Chu Hoang Hai on 2020/12/06.
//

import UIKit
import DTTextField
import RealmSwift

class InputController: UIViewController{
    
    var hands = [Hand]()
    let realm = try! Realm()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    @IBAction func addMoreHand(_ sender: UIButton) {
        hands.append(Hand())
        tbl_view.reloadData()
    }
    
    @IBAction func getResult(_ sender: UIButton) {
        var cards = [String]()
        for hand in hands {
            cards.append(hand.getFullHand())
        }
        
        requestResult(cards: cards)
    }
    
    func requestResult(cards: [String]){
        self.showSpinner(onView: self.view)
        
        var json: [String: Any] = [:]
        
        json["cards"] = cards
        
        let jsonData = try? JSONSerialization.data(withJSONObject: json)
        
        // create post request
        let url = URL(string: "http://p0kerhands.herokuapp.com/api/v1/cards/check")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("\(String(describing: jsonData?.count))", forHTTPHeaderField: "Content-Length")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        // insert json data to the request
        request.httpBody = jsonData
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "No data")
                
                self.removeSpinner()
                return
            }
            
            //study
            //            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
            //            if let responseJSON = responseJSON as? [String: Any] {
            //                print(responseJSON) //Code after Successfull POST Request
            //                self.openResultScene()
            //            }
            
            //parse json
            let decoder = JSONDecoder()
            var result = [HandResponse]()
            var errors = [ErrorResponse]()
            
            //debug
//            do{
//                try decoder.decode(Response.self, from: data)
//            } catch let DecodingError.typeMismatch(type, context)  {
//                print("Type '\(type)' mismatch:", context.debugDescription)
//                print("codingPath:", context.codingPath)
//            } catch {
//                print(error)
//            }
            
            if let jsonResult = try? decoder.decode(Response.self, from: data) {
                result = jsonResult.result
                print(result)
                errors = jsonResult.error
                if errors.count == 0 {
                    //save data to local
                    DispatchQueue.main.async {
                        for history in result {
                            try! self.realm.write {
                                history.time =   Date().millisecondsSince1970
                                self.realm.add(history)
                               
                             }
                        }
                    }
                    
                    self.removeSpinner()
                    self.openResultScene(result: result)
                }else{
                    self.removeSpinner()
                    
                    for x in 0 ..< self.hands.count {
                        for error in errors {
                            if self.hands[x].getFullHand() == error.card {
                                if error.msg.contains("重複"){
                                    
                                } else {
                                    let sFieldIndex =  error.msg.prefix(1)
                                    let intFieldIndex  = Int(sFieldIndex)
                                    self.hands[x].cards[intFieldIndex!-1].error = error.msg
                                    DispatchQueue.main.async {
                                        self.tbl_view.reloadData()
                                    }
                                }
                            }
                        }
                    }
                }
                
               
            }
        }
        
        task.resume()
    }
    
    
    @IBOutlet weak var tbl_height: NSLayoutConstraint!
    
    @IBOutlet weak var tbl_view: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hands.append(Hand())
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tbl_view.addObserver(self, forKeyPath: "contentSize", options: .new, context: nil)
        self.tbl_view.reloadData()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.tbl_view.removeObserver(self, forKeyPath: "contentSize")
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "contentSize"
        {
            if let  newvalue = change?[.newKey]{
                let newsize = newvalue as! CGSize
                self.tbl_height.constant = newsize.height
            }
        }
    }
    
    private func openResultScene(result: [HandResponse]){
        DispatchQueue.main.async {
            (self.tabBarController as? AdjustableTabBarController)?.openResultScreen(hands: result)
        }
    }
}

extension InputController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hands.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "HandTableViewCell", for: indexPath) as? HandTableViewCell
        {
            for i in 0 ..< 5 {
                configTextView(tv: cell.fieldArray[i], row: indexPath.row, fieldIndex: i)
                if hands[indexPath.row].cards[i].error?.count ?? 0 > 1{
                    cell.fieldArray![i].showError(message: hands[indexPath.row].cards[i].error)
                    
                }
            }

            return cell
        }
        return UITableViewCell()
        
    }
    
    private func configTextView(tv: DTTextField, row: Int, fieldIndex: Int )
    {
        //chay vong for arrayfield de lay thu tu
        tv.tag = row
        tv.addTarget(self, action: #selector(handleTextChange(_:)), for: .editingChanged)
    }
    
    @objc fileprivate func handleTextChange(_ sender: DTTextField){
       
        guard let text = sender.text  else {
            return
        }
        if !text.isValid() {
            sender.showError(message: "1⽤字で表されるスート(S、H、D、C)と1から13の数字の組をカードとする")
        }
        let currentRowNumber = (sender.tag)
        print("valid \(currentRowNumber)" )
        let hand = hands[currentRowNumber]
        var indexField = sender.getFieldIndex(id: sender.restorationIdentifier!)
        hand.cards[indexField].error = ""
        hand.cards[indexField].name = text

    }
    
    
}
