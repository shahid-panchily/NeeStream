//
//  ComedyTableViewCell.swift
//  NeeStream
//
//  Created by shahid panchily on 28/03/21.
//

import UIKit
import Kingfisher

class ComedyTableViewCell: UITableViewCell,modeldelegate {
    
    static let cellId = "ComedyTableViewCell"
    @IBOutlet weak var movieSectionLabel: UILabel!
    @IBOutlet weak var movieCollectionView: UICollectionView!
    
    var categories = [Categories]()
    var model = ApiModel()
    var movieTitle = [String]()
    var logoUrl = [String]()
    var premium = [Bool]()
    
    func categoriesFetched(_ categories: [Categories]) {
        self.categories = categories
        for movieList in categories {
            
            for movieName in movieList.media!{
                
                let movieGenre = movieName.genre
                
                for genreId in movieGenre! {
                  if  genreId.id == 5 {
                    
                    self.movieTitle.append(movieName.title!)
                    self.logoUrl.append(movieName.logoUrl!)
                    self.premium.append(movieName.isPremium!)
              
                    }
                }
                
                
            }
        }
        movieCollectionView.reloadData()
    }
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.movieCollectionView.delegate = self
        self.movieCollectionView.dataSource = self
        model.getData()
        model.delegate = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
extension ComedyTableViewCell: UICollectionViewDelegate,UICollectionViewDataSource {


    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return movieTitle.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ComedyCollectionViewCell.cellId , for: indexPath) as? ComedyCollectionViewCell
        
        
        
        cell?.movieNameLabel.text = movieTitle[indexPath.row]

        if premium[indexPath.row] == false {
            cell?.premiumImage.isHidden = true
        } else {
            cell?.premiumImage.isHidden = false
        }
        let url = URL(string: logoUrl[indexPath.row])
        cell?.movieLogoImage.kf.setImage(with: url)
        return cell!
        }
        
       
        
}
extension ComedyTableViewCell: UICollectionViewDelegateFlowLayout{

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {

        return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionViewSize = collectionView.frame.size.width - 55

        return CGSize(width: collectionViewSize/3, height:200)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
}

