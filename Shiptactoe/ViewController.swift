//
//  ViewController.swift
//  Shiptactoe
//
//  Created by Jervin Cruz on 6/14/18.
//  Copyright © 2018 Jervin Cruz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var buttons: [UIButton]!
    
    var currentPlayer = 1 // Player 1 = X
    var board : [Int] = [-1,-1,-1,-1,-1,-1,-1,-1,-1]
    let combos : [[Int]] = [ [0,3,6], [1,4,7], [2,5,8], [0,1,2], [3,4,5], [6,7,8], [0,4,8], [2,4,6] ]
    
    let alertTitle : String = "W I N N E R"
    let drawTitle : String = "D R A W"
    let message1 = "Player 1 wins!"
    let message2 = "Player 2 wins!"
    var moves = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func moveMade(_ sender: UIButton) {
        
        let tag = sender.tag - 1
        board[tag] = currentPlayer // Assign "1" or "2" to board
        
        if currentPlayer == 1 {
            sender.setImage(UIImage(named: "X"), for: UIControlState())
            currentPlayer = 2
        } else {
            sender.setImage(UIImage(named: "O"), for: UIControlState())
            currentPlayer = 1
        }
    
        // Solution
        for combo in combos {
            if board[combo[0]] != -1 // Not Empty Board
            && board[combo[0]] == board[combo[1]] // 1st matches 2nd spot
            && board[combo[0]] == board[combo[2]]{ // 1st matches 3rd spot
                
                if board[combo[0]] == 1 { // Player 1 wins (X)
                    let winAlert = UIAlertController(title: alertTitle, message: message1, preferredStyle: .alert)
                    let action1 = UIAlertAction(title: "New Game", style: .default) { (action: UIAlertAction) in
                        self.newGame((Any).self)
                    }
                    winAlert.addAction(action1)
                    self.present(winAlert, animated: true, completion: nil)
                    
                } else {
                    let winAlert = UIAlertController(title: alertTitle, message: message2, preferredStyle: .alert)
                    let action2 = UIAlertAction(title: "New Game", style: .default) { (action: UIAlertAction) in
                        self.newGame((Any).self)
                    }
                    winAlert.addAction(action2)
                    self.present(winAlert, animated: true, completion: nil)
                }
            }
        }
        
        // Disable pressed button & count moves
        sender.isUserInteractionEnabled = false
        moves += 1
        
        if moves == 9 {
            let drawAlert = UIAlertController(title: drawTitle, message: "A head to head matchup. Well done.", preferredStyle: .alert)
            let action1 = UIAlertAction(title: "New Game", style: .default) { (action: UIAlertAction) in
                self.newGame((Any).self)
            }
            drawAlert.addAction(action1)
            self.present(drawAlert, animated: true, completion: nil)
        }
        print(board)
    }
    
    
    @IBAction func newGame(_ sender: Any) {
        for button in buttons {
            button.isUserInteractionEnabled = true
            button.setImage(nil, for: .normal)
        }
        
        // Reset All Variables
        board = [-1,-1,-1,-1,-1,-1,-1,-1,-1]
        currentPlayer = 1
        moves = 0
    }
    
}

