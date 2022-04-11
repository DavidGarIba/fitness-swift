//
//  SecondScreen.swift
//  INFO6125_FinalProject
//
//  Created by Anh Dinh Le on 2022-04-10.
//

import UIKit

class SecondScreen: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func Move(_ sender: UIButton) {
        self.performSegue(withIdentifier: "goToNextPage", sender: self) //"goToNextPage" is name of Identifier
    }
    

     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
                if segue.identifier == "goToNextPage"
                {
                let destination = segue.destination as! ThirdScreen
                   // destination.userEmail = emailTextField.text
                }
            }

}
