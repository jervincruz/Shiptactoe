//
//  ViewController.swift
//  Shiptactoe
//
//  Created by Jervin Cruz on 6/14/18.
//  Copyright © 2018 Jervin Cruz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var currentPlayer = 1 // Player 1 = X
    var gameBoard = [-1,-1,-1,-1,-1,-1,-1,-1,-1]
    
    @IBOutlet var buttons: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    @IBAction func moveMade(_ sender: UIButton) {
        
        gameBoard[sender.tag - 1] = currentPlayer
        
        if currentPlayer == 1 {
            sender.setImage(UIImage(named: "X"), for: UIControlState())
            currentPlayer = 2
        } else {
            sender.setImage(UIImage(named: "O"), for: UIControlState())
            currentPlayer = 1
        }
        
        sender.isUserInteractionEnabled = false
        
        print(gameBoard)
    }
    
    
    @IBAction func newGame(_ sender: UIButton) {
        
        for button in buttons {
            button.isUserInteractionEnabled = true
            button.setImage(nil, for: .normal)
        }
    }
    
    func didWin(){
        
    }
    

}

