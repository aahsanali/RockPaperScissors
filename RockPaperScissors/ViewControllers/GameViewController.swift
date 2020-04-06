//
//  GameViewController.swift
//  RockPaperScissors
//
//  Created by Naveed on 4/5/20.
//  Copyright © 2020 Naveed. All rights reserved.
//

import UIKit

class GameViewController: BaseViewController {

    @IBOutlet weak var btnRock: UIButton!
    @IBOutlet weak var btnPaper: UIButton!
    @IBOutlet weak var btnScissors: UIButton!
    
    @IBOutlet weak var lblPlayerOne: UILabel!
    @IBOutlet weak var lblPlayerTwo: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBOutlet weak var stackView: UIStackView!
    
    var game: Game!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        updateUI()
        
        if (game.mode == .ComputerMode){
            
            UIView.animate(withDuration: 6) {
                
                DispatchQueue.main.async {
                    self.progressBar.setProgress(1, animated: true)
                }
            }
            perform(#selector(computerVsComputer), with: nil, afterDelay: 1)
            
        }
        
    }
    @IBAction func btnRockAction(sender: UIButton){
        
        createPlayMove(sign: .Rock)
        
    }
    
    @IBAction func btnPaperAction(sender: UIButton){
        
        createPlayMove(sign: .Paper)
    }
    
    @IBAction func btnScissorsAction(sender: UIButton){
        
        createPlayMove(sign: .Scissors)
    }
    
    // create player move based on selection and random move for computer
    private func createPlayMove(sign:Sign){
        
        let playerMove = Move(sign: sign)
        let opponentMove = Move.randomMove()
        getResult(p1Move: playerMove, p2Move: opponentMove)
    }
    
    // create two random moves for Computer 1 & Computer 2
    @objc private func computerVsComputer(){

        let move1 = Move.randomMove()
        let move2 = Move.randomMove()
        getResult(p1Move: move1, p2Move: move2)
        
    }
    
    // create ResulstViewModel based on both moves and show results
    private func getResult(p1Move:Move, p2Move:Move){
        
        let result = Game.comparePlayerMove(player: p1Move, with: p2Move)
        
        var resultVM: ResultViewModel
        var winnerText = ""
        var bgColor:UIColor = .systemTeal
        switch result {
        case .Win:
            winnerText  = (game.mode == .PlayerMode) ? "You win!" : "\(game.firstPlayerName) wins!"
            bgColor = .systemGreen
        case .Lose:
            winnerText  = (game.mode == .PlayerMode) ? "You lose" : "\(game.secondPlayerName) wins!"
            bgColor     = (game.mode == .PlayerMode) ? .systemRed : .systemGreen
        case .Tie:
            winnerText  = "Game draw!"
        }
        
        resultVM = ResultViewModel(winner: winnerText, winnerSign: p1Move.sign, loserSign: p2Move.sign, backgroundColor: bgColor)
        showResult(result: resultVM)
    }
    
    // set players names on UI
    private func updateUI(){
        
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.isNavigationBarHidden = false
        
        lblPlayerOne.text = game.firstPlayerName
        lblPlayerTwo.text = game.secondPlayerName
        progressBar.setProgress(0, animated: false)
        
//        stackView.isHidden = (game.mode == .PlayerMode)
        btnRock.isEnabled = (game.mode == .PlayerMode)
        btnScissors.isEnabled = (game.mode == .PlayerMode)
        btnPaper.isEnabled = (game.mode == .PlayerMode)
        
    }
   
    
    // show results view controller
    private func showResult(result:ResultViewModel){
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(identifier: "ResultViewController") as! ResultViewController
        controller.result = result
        self.navigationController?.pushViewController(controller, animated: false)
        
       
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
