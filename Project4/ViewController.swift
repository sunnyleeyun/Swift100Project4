//
//  ViewController.swift
//  Project4
//
//  Created by Mac on 2017/10/20.
//  Copyright © 2017年 Sunny, Lee. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {

  @IBOutlet weak var tableView: UITableView!
  var arr = [[String: AnyObject]]()
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.delegate = self
    tableView.dataSource = self
    tableView.rowHeight = 60
    getData()
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  func getData(){
    Alamofire.request("http://api.androidhive.info/contacts/").responseJSON { (responseData) in
      if responseData.result.value != nil{
        let swiftyJsonVar = JSON(responseData.result.value!)
        
        if let resData = swiftyJsonVar["contacts"].arrayObject {
          self.arr = resData as! [[String: AnyObject]]
        }
        
        if self.arr.count > 0{
          self.tableView.reloadData()
        }
        
      }
      
    }
  }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return arr.count
  }
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ViewControllerTableViewCell
    var dict = arr[indexPath.row]
    cell.name.text = dict["name"] as? String
    cell.email.text = dict["email"] as? String
    
    return cell
  }
  
  
}
