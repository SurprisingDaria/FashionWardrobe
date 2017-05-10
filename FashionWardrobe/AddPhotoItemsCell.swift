//
//  AddPhotoItemsCell.swift
//  FashionWardrobe
//
//  Created by Daria Smirnova on 03/05/17.
//  Copyright © 2017 Daria Smirnova. All rights reserved.
//

import UIKit

protocol TapToAddPhotoItem {
    func addPhoto(index : Int)
}

class AddPhotoItemsCell: UITableViewCell {

    
    @IBOutlet weak var photoCollectionView: UICollectionView!
    @IBOutlet weak var heightCollectionViewConstraint : NSLayoutConstraint!
    
    var delegate : TapToAddPhotoItem?
    
    var photoArray = [ItemsPicture]()
    // запускается при инициализации ячейки
    override func awakeFromNib()
    {
        super.awakeFromNib()
        
        let photoCell = UINib(nibName: "AddPhotoItemCell", bundle: nil)
        photoCollectionView.register(photoCell, forCellWithReuseIdentifier:"AddPhotoItemCell")
        
        photoCollectionView.delegate = self
        photoCollectionView.dataSource = self
        
        self.heightCollectionViewConstraint.constant = self.contentView.frame.width / 3 - 10
    }
    
    func configureSelf(photoArray: [ItemsPicture])
    {
        self.photoArray = photoArray
        
        self.photoCollectionView.reloadData()
    }
    
}

extension AddPhotoItemsCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
    
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
        let cell = photoCollectionView.dequeueReusableCell(withReuseIdentifier: "AddPhotoItemCell", for: indexPath) as? AddPhotoItemCell
        cell?.configCell(imageURL: photoArray[indexPath.row].photoURL, image: photoArray[indexPath.row].image)
        
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
        let width = collectionView.frame.size.width / 3 - 10
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.delegate?.addPhoto(index: indexPath.row)
    }
    
    
}
