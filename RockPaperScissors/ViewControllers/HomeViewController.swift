//
//  HomeViewController.swift
//  RockPaperScissors
//
//  Created by Naveed on 4/5/20.
//  Copyright © 2020 Naveed. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.isNavigationBarHidden = true 
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    @IBAction func btnPlayerModeAction(){
        
        let game = Game(mode:.PlayerMode, player: "You", anotherPlayer: "Computer")
        startNewGame(game)
        
    }
    @IBAction func btnComputerModeAction(){
        
        let game = Game(mode:.ComputerMode, player: "Computer 1", anotherPlayer: "Computer 2")
        startNewGame(game)
    }
    
    func startNewGame(_ game:Game){
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(identifier: "GameViewController") as! GameViewController
        controller.game = game
        self.navigationController?.pushViewController(controller, animated: true)
        
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
