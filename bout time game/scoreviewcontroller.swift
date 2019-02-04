//
//  scoreViewController.swift
//  bout time game
//
//  Created by Manish Chaturvedi on 1/22/19.
//  Copyright © 2019 Manish Chaturvedi. All rights reserved.
//

import UIKit

class scoreViewController: UIViewController {
    var score: Int = 0
    var totalRounds: Int = 0
  
    @IBOutlet weak var scoreLabel: UILabel!
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
   
            scoreLabel.text = "\(score)/\(totalRounds)"
      
        
    }
        

        // Do any additional setup after loading the view.
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
