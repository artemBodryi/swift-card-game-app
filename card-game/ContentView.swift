//
//  ContentView.swift
//  card-game
//
//  Created by Артем Бодрый on 19/09/2023.
//

import SwiftUI

struct ContentView: View {
	@State var playerCard = "card7"
	@State var cpuCard = "card14"
	@State var playerScore = 0
	@State var cpuScore = 0
	
    var body: some View {
        ZStack {
            Image("background-plain")
                .resizable()
                .ignoresSafeArea()
            
            VStack{
                Spacer()
                Image("logo")
                Spacer()
                HStack{
                    Spacer()
                    Image(playerCard)
                    Spacer()
                    Image(cpuCard)
                    Spacer()
                }
                Spacer()
                
				Button {
					deal()
				} label: {
					Image("button")
				}

                
                Spacer()
                HStack{
                    Spacer()
                    VStack{
                        Text("Player")
                            .font(.headline)
                            .padding(.bottom, 10.0)
                        Text(String(playerScore))
                            .font(.largeTitle)
                            
                    }
                    Spacer()
                    VStack{
                        Text("CPU")
                            .font(.headline)
                            .padding(.bottom, 10.0)
                        Text(String(cpuScore))
                            .font(.largeTitle)
                    }
                    Spacer()
                }
                .foregroundColor(.white)
                Spacer()
            }
           
        }
    }
	
	func deal() {
		// Randomizing player cards
		let playerCardValue = Int.random(in: 2...14)
		playerCard = "card" + String(playerCardValue)
		
		// Randomazing cpu cards
		let cpuCardValue = Int.random(in: 2...14)
		cpuCard = "card" + String(cpuCardValue)
		
		// Update the score
		if (playerCardValue > cpuCardValue) {
			playerScore += 1
		} else if (playerCardValue < cpuCardValue) {
			cpuScore += 1
		} else {
			cpuScore += 0
			playerScore += 0
		}
	}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
