//
//  AddPostViewController.swift
//  FashionWardrobe
//
//  Created by Daria Smirnova on 03/05/17.
//  Copyright © 2017 Daria Smirnova. All rights reserved.
//

import UIKit

class AddPostViewController : UIViewController
{
    @IBOutlet weak var tableView : UITableView!
    let picker = UIImagePickerController()
    var index : Int = 0
    
    var typeClothes = TypeClothes.both
    
    var itemsPicture = [ItemsPicture]()
    
    let kPhotoCollectionNIB = UINib(nibName: "AddPhotoItemsCell", bundle: nil)
    let kPhotoCollectionReuseIdentifier = "AddPhotoItemsCell"
    
    let kDescriptionTableViewCellNIB = UINib(nibName: "DescriptionTableViewCell", bundle: nil)
    let kDescriptionTableViewCellReuseIdentifier = "DescriptionTableViewCell"
    
    let kTypeTableViewCellNIB = UINib(nibName: "TypeTableViewCell", bundle: nil)
    let kTypeTableViewCellReuseIdentifier = "TypeTableViewCell"
    
    let kPriceTableViewCellNIB = UINib(nibName: "PriceTableViewCell", bundle: nil)
    let kPriceTableViewCellReuseIdentifier = "PriceTableViewCell"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // задаем высоту ячейки в таблице
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 150
        
        //picker
        picker.delegate = self
        
        for _ in 0...3 {
            let item = ItemsPicture(id: "", photoURL: "")
            item.image = UIImage(named: "Group")
            self.itemsPicture.append(item)
        }
        
        
        tableView.register(kPhotoCollectionNIB, forCellReuseIdentifier: kPhotoCollectionReuseIdentifier)
        tableView.register(kDescriptionTableViewCellNIB, forCellReuseIdentifier: kDescriptionTableViewCellReuseIdentifier)
        tableView.register(kTypeTableViewCellNIB, forCellReuseIdentifier: kTypeTableViewCellReuseIdentifier)
        tableView.register(kPriceTableViewCellNIB, forCellReuseIdentifier: kPriceTableViewCellReuseIdentifier)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if self.isMovingToParentViewController {
            self.tabBarController?.tabBar.isHidden = false
        }
    }
}

extension AddPostViewController : UITableViewDataSource, UITableViewDelegate
{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: kPhotoCollectionReuseIdentifier, for: indexPath) as? AddPhotoItemsCell
            cell?.configureSelf(photoArray: itemsPicture)
            cell?.selectionStyle = .none
            cell?.delegate = self
            if let cell = cell
            {
                return cell
            }
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: kDescriptionTableViewCellReuseIdentifier, for: indexPath) as? DescriptionTableViewCell
            cell?.selectionStyle = .none
            if let cell = cell
            {
                return cell
            }
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: kTypeTableViewCellReuseIdentifier, for: indexPath) as? TypeTableViewCell
            cell?.configSelf(typeTitle: self.typeClothes)
            if let cell = cell
            {
                return cell
            }
        case 3 :
            let cell = tableView.dequeueReusableCell(withIdentifier: kPriceTableViewCellReuseIdentifier, for: indexPath) as? PriceTableViewCell
            cell?.delegate = self
            if let cell = cell
            {
                return cell
            }
        default:
            break
        }
        return UITableViewCell()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.typeClothes == .exchange {
            return 3
        }
        else {
            return 4
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.showMenuType()
        tableView.deselectRow(at: indexPath, animated: true)
    }

}

extension AddPostViewController : PriceTableViewCellDelegate {
    func beginEditing() {
        self.tableView.contentInset = UIEdgeInsetsMake(self.tableView.contentInset.left - 100, 0, 0, 0)
    }
    func endEditing() {
        self.tableView.contentInset = UIEdgeInsetsMake(self.tableView.contentInset.left + 100, 0, 0, 0)
    }
}

extension AddPostViewController {
    func showMenuType() {
        let optionMenu = UIAlertController(title: nil, message: "", preferredStyle: .actionSheet)
        let typeBoth = UIAlertAction(title: TypeClothes.both.rawValue, style: .default, handler: {
            (alert: UIAlertAction!) -> Void in
            self.typeClothes = .both
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            //self.tableView.reloadRows(at: [IndexPath(row : 2, section : 0)], with: .fade)
        })
        
        let typeExchange = UIAlertAction(title: TypeClothes.exchange.rawValue, style: .default, handler: {
            (alert: UIAlertAction!) -> Void in
            self.typeClothes = .exchange
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        })
        
        let typeSale = UIAlertAction(title: TypeClothes.sale.rawValue, style: .default, handler: {
            (alert: UIAlertAction!) -> Void in
            self.typeClothes = .sale
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        })
        let cancelAction = UIAlertAction(title: "Отмена", style: .cancel, handler: {
            (alert: UIAlertAction!) -> Void in
        })
        
        // 4
        optionMenu.addAction(typeBoth)
        optionMenu.addAction(typeExchange)
        optionMenu.addAction(typeSale)
        optionMenu.addAction(cancelAction)
        
        // 5
        self.present(optionMenu, animated: true, completion: nil)
    }
}

extension AddPostViewController {
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        self.view.endEditing(true)
    }
}

extension AddPostViewController : TapToAddPhotoItem {
    func addPhoto(index : Int) {
        self.index = index
        // 1
        let optionMenu = UIAlertController(title: nil, message: "", preferredStyle: .actionSheet)
        
        // 2
        let cameraAction = UIAlertAction(title: "Сделать фото", style: .default, handler: {
            (alert: UIAlertAction!) -> Void in
            if UIImagePickerController.isSourceTypeAvailable(.camera) {
                self.picker.allowsEditing = false
                self.picker.sourceType = UIImagePickerControllerSourceType.camera
                self.picker.cameraCaptureMode = .photo
                self.picker.modalPresentationStyle = .fullScreen
                self.present(self.picker,animated: true,completion: nil)
            }
            else {
                let alertVC = UIAlertController(
                    title: "No Camera",
                    message: "Sorry, this device has no camera",
                    preferredStyle: .alert)
                let okAction = UIAlertAction(
                    title: "OK",
                    style:.default,
                    handler: nil)
                alertVC.addAction(okAction)
                self.present(
                    alertVC,
                    animated: true,
                    completion: nil)
            }
            
        })
        let photoLibraryAction = UIAlertAction(title: "Выбрать из галереи", style: .default, handler: {
            (alert: UIAlertAction!) -> Void in
            if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
                self.picker.allowsEditing = false
                self.picker.sourceType = .photoLibrary
                self.picker.mediaTypes = UIImagePickerController.availableMediaTypes(for: .photoLibrary)!
                self.present(self.picker, animated: true, completion: nil)
            }
            else {
                let alertVC = UIAlertController(
                    title: "No photoLibrary",
                    message: "Sorry, this device has no photoLibrary",
                    preferredStyle: .alert)
                let okAction = UIAlertAction(
                    title: "OK",
                    style:.default,
                    handler: nil)
                alertVC.addAction(okAction)
                self.present(
                    alertVC,
                    animated: true,
                    completion: nil)
            }
        })
        
        //
        let cancelAction = UIAlertAction(title: "Отмена", style: .cancel, handler: {
            (alert: UIAlertAction!) -> Void in
        })
        
        
        // 4
        optionMenu.addAction(cameraAction)
        optionMenu.addAction(photoLibraryAction)
        optionMenu.addAction(cancelAction)
        
        // 5
        self.present(optionMenu, animated: true, completion: nil)
    }
}

extension AddPostViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    //MARK: - Delegates
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        let chosenImage = info[UIImagePickerControllerOriginalImage] as! UIImage //2
        
        dismiss(animated:true, completion: nil) //5
        for index in 0..<self.itemsPicture.count {
            if self.itemsPicture[index].image == UIImage(named : "Group") {
                self.itemsPicture[index].image = chosenImage
                break
            }
            else if index == self.itemsPicture.count - 1{
                self.itemsPicture[self.index].image = chosenImage
            }
        }
        DispatchQueue.main.async {
            self.tableView.reloadRows(at: [IndexPath(row : 0, section : 0)], with: .fade)
        }
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
}



