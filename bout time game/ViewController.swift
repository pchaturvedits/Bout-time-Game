//
//  ViewController.swift
//  bout time game
//
//  Created by Manish Chaturvedi on 1/2/19.
//  Copyright © 2019 Manish Chaturvedi. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
var gameManager = GameManager()
    
    var totalRounds = 6
    var round = 0
    
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label4: UILabel!
    
   
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        displayQuestion()
    }

    func displayQuestion() {
        round += 1
        label1.text = nil
         label2.text = nil
         label3.text = nil
         label4.text = nil
        
        var randomNumber = gameManager.generateRandomNumber()
        
        let questionDictionary1 = gameManager.facts[randomNumber]
        label1.text = questionDictionary1.events
        
        randomNumber = gameManager.generateRandomNumber()
        let questionDictionary2 = gameManager.facts[randomNumber]
        label2.text = questionDictionary2.events
       
       randomNumber = gameManager.generateRandomNumber()
        let questionDictionary3 = gameManager.facts[randomNumber]
        label3.text = questionDictionary3.events

        
       randomNumber = gameManager.generateRandomNumber()
        let questionDictionary4 = gameManager.facts[randomNumber]
        label4.text = questionDictionary4.events
    
    }
    
    
    func checkAnswer() {
        
    }
    









func displayScore() {
    }
    
  
    
       
   
    @IBAction func button1(_ sender: UIButton) {
        // down 1 to 2
        let temp = label1.text
        let temp2 = label2.text
        label1.text = nil
        label2.text = nil
        label1.text = temp2
        label2.text = temp
    }
    @IBAction func button2(_ sender: UIButton) {
        //up 2 to 1
        let temp = label1.text
        let temp2 = label2.text
        label1.text = nil
        label2.text = nil
        label1.text = temp2
        label2.text = temp
    }
    
    @IBAction func button3(_ sender: UIButton) {
        // down 2 to 3
        let temp = label2.text
        let temp2 = label3.text
        label2.text = nil
        label3.text = nil
        label2.text = temp2
        label3.text = temp
    }
    
    @IBAction func button4(_ sender: UIButton) {
        // up 3 and 2
        let temp = label3.text
        let temp2 = label2.text
        label3.text = nil
        label2.text = nil
        label3.text = temp2
        label2.text = temp
    }
    @IBAction func button5(_ sender: UIButton) {
        //down 3 to 4
        let temp = label3.text
        let temp2 = label4.text
        label3.text = nil
        label4.text = nil
        label3.text = temp2
        label4.text = temp
    }
    @IBAction func button6(_ sender: UIButton) {
        // up 4 to 3
        let temp = label3.text
        let temp2 = label4.text
        label3.text = nil
        label4.text = nil
        label3.text = temp2
        label4.text = temp
    }
    
    @IBAction func nextRound(_ sender: UIButton) {
       
        if round <= totalRounds {
            displayQuestion()
        } else {
            displayScore()
        }
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

