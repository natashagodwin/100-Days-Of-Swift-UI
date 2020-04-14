//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Natasha Godwin on 4/14/20.
//  Copyright © 2020 Natasha Godwin. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var computerMove = Int.random(in: 0...2)
    @State private var shouldWin = Bool.random()
    @State private var score = 0
    
    let moves = [
        "rock",
        "paper",
        "scissors"
    ]
    
    var getInstructions: String {
        let win = "Win the game"
        let lose = "Lose the game"

        if shouldWin == true {
            return win
        } else {
            return lose
        }
    }
    
    var body: some View {
        VStack {
            VStack(spacing: 10) {
                HStack {
                    Text("Points:")
                       .font(.caption)
                    Text("\(score)")
                        .font(.headline)
                        .foregroundColor(.blue)
                }
                Group {
                    Text("The computer chose:")
                      .font(.callout)
                    Text("\(moves[computerMove].uppercased())")
                      .font(.title)
                      .foregroundColor(.blue)
                    Text("\(getInstructions)")
                }
                
                ForEach(0..<moves.count) { move in
                    Button(action: {
                        self.calculateScore(selection: move)
                        self.resetGame()
                    }) {
                        Text("\(self.moves[move].uppercased())")
                    }
                    .frame(width: 160, height: 40)
                    .background(Color.blue)
                    .clipShape(Capsule())
                    .foregroundColor(.white)
                }
            }
        }
    }
    
    func calculateScore(selection: Int) {
        let computerChoice = moves[computerMove]
        let userChoice = moves[selection]
        var correctAnswer: String = ""
        
        let rock = "rock"
        let paper = "paper"
        let scissors = "scissors"
        
        if shouldWin {
            switch computerChoice {
              case rock:
                correctAnswer = paper
              case paper:
                 correctAnswer = scissors
              case scissors:
                 correctAnswer = rock
              default:
                correctAnswer = computerChoice
            }
        } else {
           switch computerChoice {
              case rock:
                correctAnswer = scissors
              case paper:
                 correctAnswer = rock
              case scissors:
                 correctAnswer = paper
              default:
                correctAnswer = computerChoice
            }
        }
        
        if userChoice == correctAnswer {
            score += 1
        } else if userChoice == computerChoice {
            score += 0
        } else {
            score -= 1
        }
        
        if score < 0 {
            score = 0
        }
        
    }
    
    func resetGame() {
        computerMove = Int.random(in: 0...2)
        shouldWin = Bool.random()
        score = 0
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
