//
//  StartMenuViewController.swift
//  LetterQuiz
//
//  Created by Martin Bruland on 02/02/2019.
//  Copyright © 2019 Martin Bruland. All rights reserved.
//

import UIKit

class StartmenuViewController: UIViewController {
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var consentView: UIView!
    @IBOutlet weak var startGameButton: UIButton!
    
    var blurEffectView = UIVisualEffectView()
    var consentIsGiven = false
    
    
    
    //ADDITIONAL DESIGN: BORDERS AND RADIUS.
    func designAddons() {
        
        startGameButton.layer.cornerRadius = 5
        startGameButton.layer.shadowRadius = 1
        startGameButton.layer.shadowOpacity = 0.3
        startGameButton.layer.shadowOffset = CGSize(width: 0, height: 1)
        
        consentView.layer.cornerRadius = 8
        
    }
    
    //ADDITIONAL DESIGN: ADD BLUR VIEW.
    func addBlurEffect() {
        
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.dark)
        blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        contentView.addSubview(blurEffectView)
        
    }
    
 
    //CHECK IF CONSENT HAS BEEN GIVEN.
    func checkConsent() {
        
        consentIsGiven = UserDefaults.standard.bool(forKey: "consentValue")
        
        if consentIsGiven == false {
        
            addBlurEffect()
            consentView.isHidden = false
        
        } else {
            
            consentView.isHidden = true
        
        }
    }
    
    //BUTTON: GIVE CONSENT.
    @IBAction func consentButtonPressed(_ sender: Any) {
        
        consentIsGiven = true
        UserDefaults.standard.set(consentIsGiven, forKey: "consentValue")
        
        consentView.isHidden = true
        blurEffectView.removeFromSuperview()
    }
    
    //BUTTON: OPEN PRIVACY POLICY.
    @IBAction func consentLinkPressed(_ sender: Any) {
        
        if let url = URL(string: "https://www.iubenda.com/privacy-policy/82079181") {
            UIApplication.shared.open(url)
        }
        
    }
    
    
    //VIEWDIDLOAD.
    override func viewDidLoad() {
        
        super.viewDidLoad()
        designAddons()
        
    }
    
    //VIEWDIDAPPEAR.
    override func viewDidAppear(_ animated: Bool) {
        checkConsent()
    }
    
    
    //BUTTON: SHOW SETTINGS VIEWCONTROLLER.
    @IBAction func settingsButtonPressed(_ sender: Any) {
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let viewController = storyBoard.instantiateViewController(withIdentifier: "settingsView") as! SettingsViewController
        self.present(viewController, animated:true, completion:nil)
        
    }
    
    //BUTTON: SHOW GAME VIEWCONTROLLER.
    @IBAction func startGame(_ sender: Any) {
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let viewController = storyBoard.instantiateViewController(withIdentifier: "gameView") as! GameViewController
        self.present(viewController, animated:true, completion:nil)
        
    }
    
    //HIDE STATUSBAR.
    override var prefersStatusBarHidden: Bool {
        
        return true
    
    }
}
