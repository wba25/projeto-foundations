//
//  CategoryTableViewCell.swift
//  projeto-foundations
//
//  Created by Lucas Biagini on 26/06/18.
//  Copyright © 2018 AcademyFoundations. All rights reserved.
//

import UIKit

class CategoryTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource{

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var thingsCollectionView: UICollectionView!
    var things: [ThingModel] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
//
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }
    
    override func layoutSubviews() {
        self.thingsCollectionView.dataSource = self
        self.thingsCollectionView.delegate = self
        self.thingsCollectionView.isPagingEnabled = true
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return things.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "thingsCollectionViewCell", for: indexPath) as! ThingCollectionViewCell
        
        cell.thingImage.image = self.things[indexPath.item].image        
        cell.nameLabel.text = self.things[indexPath.item].name
        cell.descriptionLabel.text = self.things[indexPath.item].description
        
        return cell
    }

}
