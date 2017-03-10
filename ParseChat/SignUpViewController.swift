//
//  SignUpViewController.swift
//  ParseChat
//
//  Created by Xie kesong on 2/23/17.
//  Copyright © 2017 ___KesongXie___. All rights reserved.
//

import UIKit
import Parse

fileprivate let SegueToHomeIden = "SegueToHome"

class SignUpViewController: UIViewController {

    @IBAction func backBtnTapped(_ sender: UIBarButtonItem) {
        let _ = self.navigationController?.popViewController(animated: true)
    }
 
    @IBOutlet weak var usernameTextField: UITextField!{
        didSet{
            self.usernameTextField.delegate = self
        }
    }

    
    
    @IBOutlet weak var passwordTextField: UITextField!
    @IBAction func signUpBtnTapped(_ sender: UIButton) {
        let user = PFUser()
        
        
        if let username = self.usernameTextField.text, !username.isEmpty{
            user.username = username
        }else{
            self.alert()
            return
        }
        
        if let password = self.passwordTextField.text, !password.isEmpty{
            user.password = password
        }else{
            self.alert()
            return
        }
        
        user.signUpInBackground { (succeed, error) in
            if succeed{
                print("sign up succeed")
                self.performSegue(withIdentifier: SegueToHomeIden, sender: self)
            }else{
                print("Can't sign up \(error?.localizedDescription)")
            }
        }
    }
    
    @IBOutlet weak var signUpBtn: UIButton!{
        didSet{
            self.signUpBtn.layer.cornerRadius = 6.0
            self.signUpBtn.clipsToBounds = true
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func alert(){
        let alert = UIAlertController(title: "Invalid", message: "The username and password must not be empty", preferredStyle: .alert)
        let action = UIAlertAction(title: "Okay", style: .default, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let iden = segue.identifier, iden == SegueToHomeIden{
            if let homeVC = segue.destination as? HomeViewController{
                
            }
        }
    }
}

extension SignUpViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true
    }
}

