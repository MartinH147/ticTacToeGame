//
//  ContentView.swift
//  TicTacToe Game
//
//  Created by Martin Hendriks on 14/3/2024.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var TicTacToe = TicTacToeModel()
    
    var body: some View {
        VStack {
            Text("TIC TAC TOE")
                .font(.system(size: 45, weight: .heavy))
            
            let col = Array(repeating: GridItem(.flexible()), count: 3)
            
            LazyVGrid(columns: col, content: {
                ForEach(0..<9) { i in
                    Button(action: {
                        TicTacToe.buttonTap(i: i)
                    }, label: {
                        Text(TicTacToe.buttonLabel(i: i))
                            .frame(width: 100, height: 100)
                            .background(.blue)
                            .foregroundStyle(.white)
                            .font(.system(size: 45, weight: .heavy))
                    })
                }
            })
            .padding(.bottom)
            
            Button(action: {
                TicTacToe.resetGame()
            }, label: {
                Text("RESTART GAME")
                    .frame(width: 200, height: 50)
                    .background(.blue)
                    .foregroundStyle(.white)
                    .font(.system(size: 20, weight: .heavy))
                    .clipShape(.capsule)
            })
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
