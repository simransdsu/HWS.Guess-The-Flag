//
//  ContentView.swift
//  Guess The Flag
//
//  Created by Simran Preet Singh Narang on 2022-05-30.
//

import SwiftUI

struct ContentView: View {
    
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US", "Monaco"].shuffled()
    var correctAnswer = Int.random(in: 0...2)

    
    var body: some View {
        
        VStack(spacing: 30) {
            VStack {
                Text("Tap the flag of")
                Text(countries[correctAnswer])
            }
            
            ForEach(0..<3) { number in
                
                Button {
                    
                } label: {
                    Image(countries[number])
                        .renderingMode(.original)
                        .border(Color.black)
                        .shadow(color: Color.black, radius: 10, x: 5, y: 5)
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
