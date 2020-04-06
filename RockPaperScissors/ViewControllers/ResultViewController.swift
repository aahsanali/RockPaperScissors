//
//  ResultViewController.swift
//  RockPaperScissors
//
//  Created by Naveed on 4/5/20.
//  Copyright © 2020 Naveed. All rights reserved.
//

import UIKit

struct ResultViewModel {
    
    var winner: String?
    var winnerSign: Sign?
    var loserSign: Sign?
    var backgroundColor: UIColor = .systemGreen
    
    
}

class ResultViewController: BaseViewController {

    @IBOutlet weak var btnPlayerOneChoice: UIButton!
    @IBOutlet weak var btnPlayerTwoChoice: UIButton!
    
    @IBOutlet weak var lblResult: UILabel!
    
    var result: ResultViewModel?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        
        if let result = result {
            
            btnPlayerOneChoice.setTitle(result.winnerSign?.rawValue, for: .normal)
            btnPlayerTwoChoice.setTitle(result.loserSign?.rawValue, for: .normal)
            lblResult.text = result.winner
            self.view.backgroundColor = result.backgroundColor
            
        }else{
            
            lblResult.text = "Unable to determine winner :("
        }
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnPlayAgainAction(sender: UIButton){
        
        self.navigationController?.popViewController(animated: true)
        
    }
    @IBAction func btnChangeModeAction(sender: UIButton){
        
        self.navigationController?.popToRootViewController(animated: true)
        
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
