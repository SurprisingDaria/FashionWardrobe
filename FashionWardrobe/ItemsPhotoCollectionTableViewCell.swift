//
//  ItemsPhotoCollectionTableViewCell.swift
//  FashionWardrobe
//
//  Created by Daria Smirnova on 12/04/17.
//  Copyright © 2017 Daria Smirnova. All rights reserved.
//

import UIKit

class ItemsPhotoCollectionTableViewCell: UITableViewCell

{

    
    @IBOutlet weak var photoCollectionView: UICollectionView!
    
    var photoArray = [ItemsPicture]()
    // запускается при инициализации ячейки
    override func awakeFromNib()
    {
        super.awakeFromNib()
        
        let photoCell = UINib(nibName: "ItemPhotoTableViewCell", bundle: nil)
        photoCollectionView.register(photoCell, forCellWithReuseIdentifier:"itemPhotoReuseIdentifier")
        
        photoCollectionView.delegate = self
        photoCollectionView.dataSource = self
        
        
    }
    
    func configureSelf(photoArray: [ItemsPicture])
    {
        self.photoArray = photoArray
        
        self.photoCollectionView.reloadData()
    }
    
    
}

extension ItemsPhotoCollectionTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout

{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int
    {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    
    {
        return photoArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    
    {
        let cell = photoCollectionView.dequeueReusableCell(withReuseIdentifier: "itemPhotoReuseIdentifier", for: indexPath) as? ItemPhotoTableViewCell
        cell?.configureSelf(photoArray[indexPath.row].photoURL)
        
        if let cell = cell
        {
            return cell
        }
        
        return UICollectionViewCell()
        
    }
    
    //методы делегата
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat
    {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat
    {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        let width = collectionView.frame.size.width 
        return CGSize(width: width, height: width)
    }
    
    
}
