//
//  Game.swift
//  RockPaperScissors
//
//  Created by Naveed on 4/5/20.
//  Copyright © 2020 Naveed. All rights reserved.
//

import UIKit

enum GameMode{
    
    case PlayerMode, ComputerMode
}
enum Result {
    case Win, Tie, Lose
}
struct Game{

    var mode: GameMode = .PlayerMode
    var firstPlayerName: String = "Cyborg"
    var secondPlayerName: String = "You"
    
    init(mode:GameMode, player:String, anotherPlayer:String) {
        self.mode = mode
        self.firstPlayerName = player
        self.secondPlayerName = anotherPlayer
    }
     
   
    
    // Compare player and opponent move and decide whether player wins or loses
    static func comparePlayerMove(player: Move, with opponent: Move) -> Result {
        
        switch (player.sign, opponent.sign) {
            
        case (.Rock, .Scissors), (.Paper, .Rock), (.Scissors, .Paper):
            return .Win
            
        case (.Rock, .Rock), (.Paper, .Paper), (.Scissors, .Scissors):
            return .Tie
            
        default:
            return .Lose
        }
    }
    
}
