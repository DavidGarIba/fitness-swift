//
//  ViewController.swift
//  INFO6125_FinalProject
//
//  Created by David Garcia on 2022-04-09.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController {

    @IBOutlet weak var EmailTextField: UITextField!
    @IBOutlet weak var PasswordTextField: UITextField!
    @IBOutlet weak var LoginButton: UIButton!
    @IBOutlet weak var IssueLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        LoginButton.isEnabled = false
       
    }
    
    @IBAction func EmailTextField(_ sender: UITextField) {
        if sender.text?.isEmpty == true
        {
            LoginButton.isEnabled = false
            IssueLabel.text = "Email is empty"
        }
        else if sender.text?.isEmpty == false && PasswordTextField.text?.isEmpty == false
        {
            LoginButton.isEnabled = true
        }
    }
    
    
    @IBAction func PasswordTextField(_ sender: UITextField) {
        if sender.text?.isEmpty == true
        {
            LoginButton.isEnabled = false
            IssueLabel.text = "Email is empty"
        }
        else if sender.text?.isEmpty == false && EmailTextField.text?.isEmpty == false
        {
            LoginButton.isEnabled = true
        }
    }
    
    private var userIdentifier: String?
    private let welcomeSegue: String = "goToNextPage"
    
    @IBAction func LoginButton(_ sender: UIButton) {
        let email = EmailTextField.text ?? ""
        let password = PasswordTextField.text ?? ""
        
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
                      guard let strongSelf = self else { return }
                        if let error = error, let errorCode = AuthErrorCode(rawValue: error._code)
                        {
                            switch errorCode{
                                case .userNotFound:
                                    strongSelf.showUIAlert(setence: "user doesn't exit")
                                case .wrongPassword:
                                    strongSelf.showUIAlert(setence: "incorrect password")
                                default:
                                    strongSelf.showUIAlert(setence:"error authentication user")
                                            }
                                return
                        }
            
                            strongSelf.userIdentifier = authResult?.user.email
                            strongSelf.performSegue(withIdentifier: strongSelf.welcomeSegue, sender: strongSelf)
                    }
    }
    
    func showUIAlert (setence : String){
            let alert = UIAlertController(title: "Notification", message: "\(setence)", preferredStyle: .alert)
            let destructiveButton = UIAlertAction(title: "OK", style: .default)
            alert.addAction(destructiveButton)
            self.show(alert, sender: nil)
        }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "goToNextPage"
            {
            let destination = segue.destination as! SecondScreen
                //destination.userEmail = userIdentifier
            }
        }
}

