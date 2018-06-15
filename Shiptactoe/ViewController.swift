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
//    //let combos : [Int : [[Int]]] = [0 : [ [1,2], [3,6], [4,8] ],
//                                    1 : [ [0,2], [4,7] ],
//                                    2 : [ [0,1], [5,8], [4,6] ],
//                                    3 : [ [0,6], [4,5] ],
//                                    4 : [ [0,8], [2,6], [3,5], [1,7] ],
//                                    5 : [ [2,8], [3,4] ],
//                                    6 : [ [0,3], [2,4], [7,8]],
//                                    7 : [ [1,4], [6,8]],
//                                    8 : [ [0,4], [2,5], [6,7]]]
    let alertTitle : String = "W I N N E R"
    let message1 = "Player 1 wins!"
    let message2 = "Player 2 wins!"
    var moves = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func moveMade(_ sender: UIButton) {
        
        var tag = sender.tag - 1
        board[tag] = currentPlayer
        
        if currentPlayer == 1 {
            sender.setImage(UIImage(named: "X"), for: UIControlState())
            currentPlayer = 2
        } else {
            sender.setImage(UIImage(named: "O"), for: UIControlState())
            currentPlayer = 1
        }
    
        
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
                    self.present(winAlert, animated: true, completion: nil)                }
            }
        }
        
        // Disable pressed button & count moves
        sender.isUserInteractionEnabled = false
        moves += 1
        
        if moves == 8 {
            print("DRAW!")
        }
        
        print(board)
    }
    
    
    @IBAction func newGame(_ sender: Any) {
        for button in buttons {
            button.isUserInteractionEnabled = true
            button.setImage(nil, for: .normal)
        }
    }
    
    
    
//
//    func checkWin(_ tag : Int, player : Int){
//
//        func checkValues(_ tag : Int, _ player : Int){
//            let values = combos[tag]
//            for value in values! {
//                print("Value: ", value)
//                innerLoop: for (i, index) in value.enumerated() {
//                    print("i: ", i, "index: ", index)
//                    guard board[index] == player else {
//                        break innerLoop
//                    }
//                    print("Inner Array: ", i)
//                    if i == 1 {
//                        print("Player: ", player, "has won!")
//                    }
//                }
//            }
//        }
//
//        switch tag {
//        case 1:
//            checkValues(0, player)
//        case 2:
//            checkValues(1, player)
//        case 3:
//            checkValues(2, player)
//        case 4:
//            checkValues(3, player)
//        case 5:
//            checkValues(4, player)
//        case 6:
//            checkValues(5, player)
//        case 7:
//            checkValues(6, player)
//        case 8:
//            checkValues(7, player)
//        case 9:
//            checkValues(8, player)
//        default:
//            return
//        }
//    }
    
}

