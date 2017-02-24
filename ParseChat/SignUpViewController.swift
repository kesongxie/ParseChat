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
        user.username = self.usernameTextField.text
        user.password = self.passwordTextField.text
        
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

