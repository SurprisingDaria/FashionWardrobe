//
//  ViewController.swift
//  FashionWardrobe
//
//  Created by Daria Smirnova on 02/05/17.
//  Copyright © 2017 Daria Smirnova. All rights reserved.
//

import UIKit

class NewsViewController: UIViewController

{


    @IBOutlet weak var newsTableView: UITableView!
    @IBOutlet weak var newsActivityIndicator: UIActivityIndicatorView!
    
    var presenter: Presenter?
    
    let kTextNIB = UINib(nibName: "NewsTextTableViewCell", bundle: nil)
    let kTextNibReuseIdentifier = "kTextReuseIdentifier"
    
    
    let KNewsPhotoCollectionNIB = UINib(nibName: "NewsPhotoCollectionTableViewCell", bundle: nil)
    let kNewsPhotoReuseIdentifier = "kPhotoReuseIdentifier"
    
    override func viewDidLoad()
    
    {
        super.viewDidLoad()
        
        newsTableView.rowHeight = UITableViewAutomaticDimension
        newsTableView.estimatedRowHeight = 300
        
        newsTableView.register(kTextNIB, forCellReuseIdentifier: kTextNibReuseIdentifier)
        
        newsTableView.register(KNewsPhotoCollectionNIB, forCellReuseIdentifier: kNewsPhotoReuseIdentifier)
    }
    
    override func viewWillAppear(_ animated: Bool)
        
    {
        if presenter == nil
        {
            VKAuthManager.sharedInstance.authorize(withController: self, success: {
                    DependencyInjector.obtainPresenter(view: self)
                        
            }, failure: {})
        }
        
        super.viewWillAppear(animated)
    }
 
    
}

extension NewsViewController: View

{
    func assignPresenter (presenter: Presenter) -> Void
        
    {
        self.presenter = presenter
        presenter.viewLoaded(view: self)
        newsTableView.delegate = self
        newsTableView.dataSource = self
        
    }
    
    func reloadData ()-> Void
        
    {
        newsTableView.reloadData()
    }
    
    //включение лоадера
    func addLoader ()->Void
        
    {
        newsActivityIndicator.startAnimating()
    }
    
    // выключение лоадера
    
    func removeLoader () -> Void
        
    {
        newsActivityIndicator.stopAnimating()
    }
    
    //коды ошибок интернета
    
    func handleInternetErrorCode (code: Int)-> Void
        
    {
        let alertController = UIAlertController(title: "Ошибка", message: "нет соединения с интернетом", preferredStyle: .alert)
        
        let okAction  = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        
        present(alertController, animated: true, completion: nil)
    }

}
// получение данных 

extension NewsViewController: UITableViewDataSource, UITableViewDelegate
{
    func numberOfSections(in tableView: UITableView) -> Int
    
    {
        return(presenter?.numberOfSections())!
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    
    {
        return (presenter?.numberOfModels(section: section))!
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    
    {
        let model = presenter?.getModel(indexPath: indexPath) as Any
        
        if model is NewsText
        {
            let cell = newsTableView.dequeueReusableCell(withIdentifier: kTextNibReuseIdentifier, for: indexPath) as! NewsTextTableViewCell
            
            cell.selectionStyle = .none
            cell.configureSelf(model: model as! NewsText)
            return cell
        }
        
        if model is NewsPictures
        
        {
            let cell = newsTableView.dequeueReusableCell(withIdentifier: kNewsPhotoReuseIdentifier, for: indexPath) as! NewsPhotoCollectionTableViewCell
            
            cell.selectionStyle = .none
            
            if let model = model as? NewsPictures
            {
            
            cell.configCell(photoArray: model.picturesArray)
            
            }
            return cell
        }
        
        return UITableViewCell()
    }
}
