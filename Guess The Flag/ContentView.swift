//
//  ContentView.swift
//  Guess The Flag
//
//  Created by Simran Preet Singh Narang on 2022-05-30.
//

import SwiftUI

extension Font {
    static let heavySubheadlineFont = Font.subheadline.weight(.heavy)
    static let largeTitleSemiBoldFont = Font.largeTitle.weight(.semibold)
}

struct ContentView: View {
    
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US", "Monaco"].shuffled()
    @State var correctAnswer = Int.random(in: 0...2)

    
    var body: some View {
        
        ZStack {
            
            LinearGradient(gradient: Gradient(colors: [.blue, .black]),
                           startPoint: .top,
                           endPoint: .bottom)
            .ignoresSafeArea()
            
            VStack(spacing: 30) {
                VStack {
                    Text("Tap the flag of")
                        .font(.heavySubheadlineFont)
                    Text(countries[correctAnswer])
                        .font(.largeTitleSemiBoldFont)
                }
                
                ForEach(0..<3) { number in
                    Button {
                        flagTapped(number)
                    } label: {
                        Image(countries[number])
                            .renderingMode(.original)
                            .cornerRadius(10)
                            .clipShape(Capsule())
                            .shadow(color: Color.black, radius: 10, x: 5, y: 5)
                    }
                }
            }
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", action: askQuestion)
        } message: {
            Text("Your score is ???")
        }
    }
    
    private func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
        } else {
            scoreTitle = "Wrong"
        }
        
        showingScore = true
    }
    
    private func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
