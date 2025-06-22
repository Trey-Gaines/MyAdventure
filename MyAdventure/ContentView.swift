//
//  ContentView.swift
//  MyAdventure
//
//  Created by Trey Gaines on 6/21/25.
//

import SwiftUI

struct ContentView: View {
    @State var myObserver = AdventureModel()
    var body: some View {
        VStack {
            Text(myObserver.currentNode.text)
                .font(.largeTitle)
                .multilineTextAlignment(.center)
                .fontWeight(.bold)
                .padding().frame(height: 200)
            Spacer()
            VStack(spacing: 20) {
                if !myObserver.restartGame {
                    ForEach(myObserver.currentNode.choices, id: \.self) { choice in
                        Button {
                            if let nextNode = choice.nextNode {
                                myObserver.currentNodeID = nextNode
                            } else {
                                myObserver.currentNodeID = 0
                            }
                        } label: {
                            Text(choice.text)
                                .foregroundStyle(.white)
                                .padding(10)
                                .fontWeight(.semibold)
                                .background {
                                    RoundedRectangle(cornerRadius: 25)
                                }
                        }
                    }
                } else {
                    Button {
                        myObserver.currentNodeID = 0
                    } label: {
                        Text("Restart")
                            .font(.title)
                            .fontWeight(.semibold)
                            .foregroundStyle(.white)
                            .padding(10)
                            .fontWeight(.semibold)
                            .background {
                                RoundedRectangle(cornerRadius: 25).fill(Color.red)
                            }
                    }
                }
            }
        }
        .padding()
    }
}

#Preview {
    ContentView().preferredColorScheme(.dark)
}
