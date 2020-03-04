//
//  ResultsViewController.swift
//  LetterQuiz+
//
//  Created by Martin Bruland on 02/02/2019.
//  Copyright © 2019 Martin Bruland. All rights reserved.
//

import UIKit
import StoreKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var resultMessageOne: UILabel!
    @IBOutlet weak var resultMessageTwo: UILabel!
    @IBOutlet weak var contentView: UIView!
    
    
    
    var correctAnswers = Int()
    var highscore = Int()
    
    
    

    //ADDITIONAL DESIGN: BORDERS AND RADIUS.
    func designAddons() {
        
        playButton.layer.cornerRadius = 5
        playButton.layer.shadowRadius = 1
        playButton.layer.shadowOpacity = 0.3
        playButton.layer.shadowOffset = CGSize(width: 0, height: 1)
                
    }
    

    
    //PRESENT RESULTS.
    func resultsData() {
    
        if correctAnswers > highscore {
            
            UserDefaults.standard.set(correctAnswers, forKey: "highscore")
            resultMessageOne.text = "New Highscore"
            
        } else {
            
            resultMessageOne.text = "Game Over"
            
        }
        
        resultMessageTwo.text = "You scored \(correctAnswers) points"
    }
    

 
    

  
    //LOAD DATA ON VIEWDIDLOAD.
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        designAddons()
        resultsData()
        
    }

    //HIDE STATUSBAR.
    override var prefersStatusBarHidden: Bool {
        return true
    }

    //SHOW STARTMENU.
    @IBAction func backButtonPressed(_ sender: Any) {
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let viewController = storyBoard.instantiateViewController(withIdentifier: "startmenuView") as! StartmenuViewController
        self.present(viewController, animated:true, completion:nil)
        
    }
    
    @IBAction func playAgainButtonPressed(_ sender: Any) {
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let viewController = storyBoard.instantiateViewController(withIdentifier: "gameView") as! GameViewController
        self.present(viewController, animated:true, completion:nil)
        
    }
}
