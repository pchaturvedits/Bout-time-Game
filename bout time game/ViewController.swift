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
    var fact1: Events?
    var fact2: Events?
    var fact3: Events?
    var fact4: Events?
    var timer = Timer()
    var selectedFact: [Events] = []

    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var button5: UIButton!
    @IBOutlet weak var button6: UIButton!
    @IBOutlet weak var label4: UILabel!
    @IBOutlet weak var timerlabel: UILabel!
    
    @IBOutlet weak var nextbutton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        displayQuestion()
        runTimer()
        updateTimer()
        
//        myButton.setImage(UIImage(named : "unselectedImage"), forState: UIControlState.Normal)
//        myButton.setImage(UIImage(named : "selectedImage"), forState: UIControlState.Selected)

    }

    func displayQuestion() {
        
        gameManager.round += 1
        label1.text = ""
        label2.text = ""
        label3.text = ""
        label4.text = ""
        
        var randomNumber = gameManager.generateRandomNumber()
        fact1 = gameManager.facts[randomNumber]
        label1.text = fact1?.events
        
        randomNumber = gameManager.generateRandomNumber()
        fact2 = gameManager.facts[randomNumber]
        label2.text = fact2?.events
        
        randomNumber = gameManager.generateRandomNumber()
        fact3 = gameManager.facts[randomNumber]
        label3.text = fact3?.events
       
        randomNumber = gameManager.generateRandomNumber()
        fact4 = gameManager.facts[randomNumber]
        label4.text = fact4?.events
        //date4 = questionDictionary4.occuranceDate
    }
    
    func checkAnswer() {
        
        
        if (fact1?.occuranceDate)! <= (fact2?.occuranceDate)! &&
            (fact2?.occuranceDate)! <= (fact3?.occuranceDate)! &&
            (fact3?.occuranceDate)! <= (fact4?.occuranceDate)! {
            gameManager.correctAnswer += 1
            nextbutton.setImage(UIImage(named: "next_round_success.png"), for: .normal)
        } else {
            nextbutton.setImage(UIImage(named: "next_round_fail.png"), for: .normal)
            
        }
        
    }
    
  
   
    
   func runTimer() {
    timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(ViewController.updateTimer)), userInfo: nil, repeats: true)
    
    }

    
        // Showing the countdown on screen
        
    @objc func updateTimer(){
       
        if gameManager.gameRunTime > 0 {
            gameManager.gameRunTime -= 1
            nextbutton.setTitle("\(gameManager.gameRunTime)", for: .normal)
        } else if gameManager.gameRunTime == 0 {
            // if countdown is 0 time to display next question
          
           // timerlabel.isHidden = true
            //nextbutton.isHidden = false
    
            //endTimer()
            timer.invalidate()
            checkAnswer()
        }
 
    }
    
    func resetTimer() {
        gameManager.gameRunTime = gameManager.staticPlayTime
    }
    
    
    func endTimer() {
       timer.invalidate()
        resetTimer()
    }
  

    func displayScore() {
      let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "scoreViewController") as? scoreViewController
        vc?.score = gameManager.correctAnswer
        vc?.totalRounds = gameManager.totalRounds
        self.present(vc!, animated: true, completion: nil)
    }
    
    
    @IBAction func button1(_ sender: UIButton) {
        // down 1 to 2
    
        button1.setImage(UIImage(named: "down_full_selected"), for: .highlighted)
        let tempFact: Events?
        tempFact = fact1
        fact1 = fact2
        fact2 = tempFact
        label1.text = fact1?.events
        label2.text = fact2?.events
        }
    
    @IBAction func button2(_ sender: UIButton) {
        //up 2 to 1
        button2.setImage(UIImage(named: "up_half_selected"), for: .highlighted)
        let tempFact: Events?
        tempFact = fact2
        fact2 = fact1
        fact1 = tempFact
        label1.text = fact1?.events
        label2.text = fact2?.events
        }
    
    @IBAction func button3(_ sender: UIButton) {
        // down 2 to 3
        button3.setImage(UIImage(named: "down_half_selected"), for: .highlighted)
        let tempFact: Events?
        tempFact = fact2
        fact2 = fact3
        fact3 = tempFact
        label2.text = fact2?.events
        label3.text = fact3?.events
        }
    
    @IBAction func button4(_ sender: UIButton) {
        // up 3 and 2
       button4.setImage(UIImage(named: "up_half_selected"), for: .highlighted)
        let tempFact: Events?
        tempFact = fact3
        fact3 = fact2
        fact2 = tempFact
        label2.text = fact2?.events
        label3.text = fact3?.events
        }
    
    @IBAction func button5(_ sender: UIButton) {
        //down 3 to 4
        button5.setImage(UIImage(named: "down_half_selected"), for: .highlighted)
        let tempFact: Events?
        tempFact = fact3
        fact3 = fact4
        fact4 = tempFact
        label3.text = fact3?.events
        label4.text = fact4?.events
        }
    
    @IBAction func button6(_ sender: UIButton) {
        // up 4 to 3
        button6.setImage(UIImage(named: "up_half_selected"), for: .highlighted)
      
        let tempFact: Events?
        tempFact = fact4
        fact4 = fact3
        fact3 = tempFact
        label3.text = fact3?.events
        label4.text = fact4?.events
        }
    
    @IBAction func nextRound(_ sender: UIButton) {
        timerlabel.isHidden = false
        resetTimer()
        runTimer()
        updateTimer()
        nextbutton.setImage(nil, for: .normal)
        if gameManager.round < gameManager.totalRounds {
            displayQuestion()
        } else {
            displayScore()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        switch motion {
        case .motionShake:
            endTimer()
            checkAnswer()
        default:
            print("\(motion) ended. Events: \(event)")
        }
    }
 
    
}


