//
//  ViewController.swift
//  NeeStream
//
//  Created by shahid panchily on 26/03/21.
//

import UIKit

class HomeViewController: UIViewController,modeldelegate{
   
    @IBOutlet weak var tableView: UITableView!
    var categories = [Categories]()
    var model = ApiModel()
    var movieTitle = [String]()
    var logoUrl = [String]()
    var premium = [Bool]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        model.getData()
        model.delegate = self
        print("Hello")
        print("world")
        
    }
    func categoriesFetched(_ categories: [Categories]) {
        self.categories = categories
        tableView.reloadData()
    }
    
}
extension HomeViewController: UITableViewDelegate,UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: DramaTableViewCell.cellId, for: indexPath) as! DramaTableViewCell
         
            cell.movieSectionLbl.text = "Drama"
            return cell
        }
        else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: FamilyTableViewCell.cellId, for: indexPath) as! FamilyTableViewCell
            
            cell.movieSectionLabel.text = "Family"
            return cell
            
        }
        else if indexPath.row == 2 {
                
            let cell = tableView.dequeueReusableCell(withIdentifier: ActionTableViewCell.cellId, for: indexPath) as! ActionTableViewCell
                
                cell.movieSectionLabel.text = "Action"
                return cell
                
            }
        else if indexPath.row == 3 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: ComedyTableViewCell.cellId, for: indexPath) as! ComedyTableViewCell
            
            cell.movieSectionLabel.text = "Comedy"
            return cell
            
        }
        else  if indexPath.row == 4{
            
            let cell = tableView.dequeueReusableCell(withIdentifier: ThrillerTableViewCell.cellId, for: indexPath) as! ThrillerTableViewCell
            
            cell.movieSectionLabel.text = "Thriller"
            return cell
            
        }
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: RomanceTableViewCell.cellId, for: indexPath) as! RomanceTableViewCell
            
            cell.movieSectionLabel.text = "Romance"
            return cell
            
            
            
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    
}


