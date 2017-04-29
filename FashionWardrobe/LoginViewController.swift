//
//  LoginViewController.swift
//  FashionWardrobe
//
//  Created by Daria Smirnova on 28/04/17.
//  Copyright © 2017 Daria Smirnova. All rights reserved.
//

import Foundation

import UIKit

class LoginViewController: UIViewController
    
{
    
    @IBOutlet weak var emailField: UITextField!

    @IBOutlet weak var passwordField: UITextField!
    @IBAction func enterButton(_ sender: UIButton)
    
    {
        if let email = emailField.text, let password = passwordField.text
        {
            ProfileManager.getLoginData(success: { (profile) in
                
                // в профайл в userStorage записали профайл, полученный при авторизации
                UserStorage.profile = profile
                
                // после записи данных в профайл возвращаемся в контролер Profile (там пропадет view, которая была (авторизация/регистрация) - вью станет Hidden
                DispatchQueue.main.async {
                    
                    self.navigationController?.popViewController(animated: true)
                }
               
                
            }, failure: { (errorCode) in
                
                
            }, email: email, password: password)
        }
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.emailField.delegate = self
        self.passwordField.delegate = self
        
    }
    
    // метод нажатия на людое место на View
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        //метод убирает клавиатуру
        self.view.endEditing(true)
    }


}

extension LoginViewController: UITextFieldDelegate

{
    //при нажатии на кнопку Ввод справа внизу
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        // метод, убирающий клавиатуру
        self.view.endEditing(true)
        return true
    }
    
    
}
