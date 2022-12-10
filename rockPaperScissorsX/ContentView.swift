//
//  ContentView.swift
//  rockPaperScissorsX
//
//  Created by Thaddeus Dronski on 12/9/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var moveOptions = ["✊🏻", "📄", "✂️"]
    
    @State private var computerSelection = Int.random(in: 0..<2)
    @State private var shouldWin = Bool.random()
    
    @State private var playerScore = 0
    @State private var quesitonCount = 1
    @State private var showingResults = false
   
    var body: some View {
        VStack {
            Spacer()
            
            Text("Computer has played...")
                .font(.headline)
            Text(moveOptions[computerSelection])
                .font(.system(size: 200))
            
            if shouldWin {
                Text("Which one wins?")
                    .foregroundColor(.green)
                    .font(.title)
            } else {
                Text("Which one loses?")
                    .foregroundColor(.red)
                    .font(.title)
            }
            HStack {
                ForEach(0..<3) { number in
                    Button(moveOptions[number]) {
                        //play func
                        playGame(choice: number)
                    }
                    .font(.system(size: 80))
                }
            }
            Spacer()
            Text("Player Score: \(playerScore)")
                .font(.subheadline)
            Spacer()
        }
        .alert("Game Over", isPresented: $showingResults) {
            Button("Play Again", action: resetGame)
        } message: {
            Text("Your score is \(playerScore)")
        }
    }
    
    func playGame(choice: Int) {
        let winningMoves = [1, 2, 0]
        let didWin: Bool
        
        if shouldWin {
            didWin = choice == winningMoves[computerSelection]
        } else {
            // we lost
            didWin = winningMoves[choice] == computerSelection
        }
        
        if didWin {
            playerScore += 1
        } else {
            playerScore -= 1
        }
        
        if quesitonCount == 10 {
            showingResults = true
        } else {
            computerSelection = Int.random(in: 0..<3)
            shouldWin.toggle()
            quesitonCount += 1
        }
    }
    
    func resetGame() {
        computerSelection = Int.random(in: 0..<3)
        shouldWin = Bool.random()
        quesitonCount = 0
        playerScore = 0
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
