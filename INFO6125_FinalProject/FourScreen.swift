//
//  FourScreen.swift
//  INFO6125_FinalProject
//
//  Created by Anh Dinh Le on 2022-04-10.
//

import UIKit

class FourScreen: UIViewController {
        var Title: String?
        var Distance: String?
        var Duration: String?
        var userLatitude: Double?
    var userLongitude: Double?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Title = "test Title 1"
        Distance = "1234"
        Duration = "45678"
    }
    
    @IBAction func MoveButton(_ sender: UIButton) {
        self.performSegue(withIdentifier: "goToNextPage", sender: self)
    }
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "goToNextPage"
            {
            let destination = segue.destination as! SecondScreen
                destination.Title = Title
                destination.Duration = Duration
                destination.Distance = Distance
            }
        }

}
