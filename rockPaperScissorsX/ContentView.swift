//
//  ContentView.swift
//  rockPaperScissorsX
//
//  Created by Thaddeus Dronski on 12/9/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var rps = ["✊🏻", "📄", "✂️"]
    
    @State private var randomNumRPS = Int.random(in: 0..<2)
    @State private var shouldWin = Bool.random()
   

    
    
    var body: some View {
        VStack {
            Spacer()
            Text("Computer has selected...")
                .font(.headline)
            Text(rps[randomNumRPS])
                .font(.system(size: 200))
            
            if shouldWin {
                Text("Which one wins?")
                    .foregroundColor(.green)
                    .font(.title)
            } else {
                Text("Which one loses?")
                    .foregroundColor(.red)
            }
            HStack {
                ForEach(0..<3) { number in
                    Button(rps[number]) {
                        //Move function
                        playGame(userChoice: number)
                    }
                    .font(.system(size: 80))
                    
                }
            }
            Spacer()
            Text("Score: ???")
                .font(.headline)
            Spacer()
        }
    }
    func playGame(userChoice: Int) {
        let winningMoves = [1, 2, 0]
        let didWin: Bool
        
        if shouldWin {
            didWin = userChoice == winningMoves[randomNumRPS]
        } else {
            didWin = winningMoves[userChoice] == randomNumRPS
        }
        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
