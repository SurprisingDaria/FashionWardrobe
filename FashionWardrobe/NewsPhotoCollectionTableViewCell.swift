//
//  NewsPhotoCollectionTableViewCell.swift
//  FashionWardrobe
//
//  Created by Daria Smirnova on 02/05/17.
//  Copyright © 2017 Daria Smirnova. All rights reserved.
//

import UIKit

class NewsPhotoCollectionTableViewCell: UITableViewCell

{

    @IBOutlet weak var photoCollection: UICollectionView!
    
    
    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
    
    var photoArray = [NewsPicture]()
    
    override func awakeFromNib()
    
    {
        super.awakeFromNib()
        let onePictureCell = UINib(nibName: "NewsOnePictureTableViewCell", bundle: nil)
        photoCollection.register(onePictureCell, forCellWithReuseIdentifier: "NewsOnePictureTableViewCell")
        
        photoCollection.delegate = self
        photoCollection.dataSource = self
    }
    
    func configCell(photoArray: [NewsPicture])
    {
        self.photoArray = photoArray
        
        let y = (self.photoArray.count < 3) ? 1 : (self.photoArray.count % 3 == 0 ? (self.photoArray.count / 3) : (self.photoArray.count / 3 + 1))
        
        // умножаем высоту одной линии на количество линий - получаем общую высоту
        
        heightConstraint.constant = CGFloat((Int)(y)) * (photoCollection.frame.size.width / 3)
        
        //обновление таблицы
        self.photoCollection.reloadData()

    }
    
}

extension NewsPhotoCollectionTableViewCell : UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout
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
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NewsOnePictureTableViewCell", for: indexPath) as? NewsOnePictureTableViewCell
        
        cell?.configureSelf(photoArray[indexPath.row].photoURL)
        
        if let cell = cell
        {
            return cell
        }
        return UICollectionViewCell()
    }
    
    // методы delegate
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat
    {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat
    {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        let width = (collectionView.frame.size.width / 3) - 1
        return CGSize(width: width, height: width)
    }
    
}

