//
//  RockPaperScissors - main.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

enum RockPaperScissorsCase: Int {
    case exit = 0
    case rock = 1
    case paper = 2
    case scissors = 3
}

class RockPaperScissors {
    var computerCase = 0
    var userCase = 0
    
    func createRandomComputerCase() -> Int {
        let randomCase = Int.random(in: 1...3)
        
        return randomCase
    }
    
    func userInputCase() -> Int {
        while true {
            guard let userInputText = readLine() else {
                continue
            }
            guard let userInputNumber = Int(userInputText) else {
                continue
            }
            
            let userCase = RockPaperScissorsCase(rawValue: userInputNumber)
            
            switch userCase {
            case .exit:
                print("게임 종료")
                return 0
            case .rock:
                return 1
            case .paper:
                return 2
            case .scissors:
                return 3
            default:
                print("잘못된 입력입니다. 다시 입력해주세요.")
            }
        }
    }
    
    func checkWinLoseResult(user: Int, computer: Int) -> Int {
        let whoWinCheck: Int = user - computer
        var gameResult: Int = 0
        
        if user == 0 {
            gameResult = 0
        } else if whoWinCheck == 0 {
            gameResult = 3
        } else if whoWinCheck == 1 || whoWinCheck == -2 {
            gameResult = 1
        } else if whoWinCheck == -1 || whoWinCheck == 2 {
            gameResult = 2
        }

        return gameResult
    }
    
    func printResultChangeGameState(gameResult: Int) -> Bool {
        switch gameResult {
        case 0:
            return false
        case 1:
            print("이겼습니다!")
            return false
        case 2:
            print("졌습니다!")
            return false
        default:
            print("비겼습니다!")
            return true
        }
    }
    
    func playGame() {
        var playGameSwitch: Bool = true
        var winLoseResult: Int = 0
        
        while playGameSwitch {
            print("가위(1). 바위(2). 보(3)! <종료 : 0> : ", terminator: "")
            
            computerCase = createRandomComputerCase()
            userCase = userInputCase()
            
            winLoseResult = checkWinLoseResult(user: userCase, computer: computerCase)
            
            playGameSwitch = printResultChangeGameState(gameResult: winLoseResult)
        }
    }

    //
    
    
    
}


var testGame = RockPaperScissors()

testGame.playGame()


