//
//  Move.swift
//  RockPaperScissors
//
//  Created by Naveed on 4/5/20.
//  Copyright © 2020 Naveed. All rights reserved.
//

import UIKit
enum Sign:String{
    case Rock = "✊🏻"
    case Paper = "✋🏻"
    case Scissors = "✌🏻"
}

struct Move {
    
    var sign:Sign?

    // Returns a random move
    static func randomMove() -> Move {
        let random = arc4random_uniform(3)
        switch random {
        case 0:
            return Move(sign: .Rock)
        case 1:
            return Move(sign: .Paper)
        case 2:
            return Move(sign: .Scissors)
        default:
            return Move(sign: .Rock)
        }
    }
}
