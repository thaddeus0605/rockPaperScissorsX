//
//  ContentView.swift
//  rockPaperScissorsX
//
//  Created by Thaddeus Dronski on 12/9/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var rps = ["✊🏻", "📄", "✂️"]
    @State private var winOrLose = ["Win", "Lose"]
    @State private var randomNumRPS = Int.random(in: 0...2)
    @State private var randomNumWorL = Int.random(in: 0...1)
    
    
    var body: some View {
        ZStack {
            VStack {
                Text("The computer wants you to: ")
                    .font(.title)
                Text(winOrLose[randomNumWorL])
                    .font(.title.weight(.semibold))
                Text("Against:")
                    .font(.title)
                Text(rps[randomNumRPS])
                    .font(.largeTitle.weight(.semibold))
                VStack(spacing: 15) {
                    VStack{
                        Text("Make your choice: ")
                    }
                    HStack{
                        ForEach(0..<3) { number in
                            Button {
                                //Selection tapped
                                print("Player selection tapped")
                            } label: {
                                Text(rps[number])
                            }
                        }
                    }
                }
            }
        }
    }
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
