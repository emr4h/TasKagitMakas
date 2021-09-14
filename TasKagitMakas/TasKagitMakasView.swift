//
//  TasKagitMakasView.swift
//  TasKagitMakas
//
//  Created by Emrah Yıldırım on 14.09.2021.
//

import SwiftUI

struct TasKagitMakasView: View {
    var things = ["Rock","Paper","Scissors"]
        @State private var choice = "Paper"
        @State private var shouldWin = false
        @State private var score = 0

        func nextRound() {
            choice = things[Int.random(in: 0...2)]
            shouldWin = Bool.random()
        }

        var body: some View {
            VStack {
                Text("My Choice is \(choice)")
                Text("You must \(shouldWin ? "WIN" : "LOSE")")
                Button(things[0]) {
                    if self.choice == self.things[2] && self.shouldWin || self.choice == self.things[1] && !self.shouldWin {
                        self.score += 1
                    } else {
                        self.score -= 1
                    }
                    self.nextRound()
                }
                Button(things[1]) {
                    // add calculate score logic here

                    self.nextRound()
                }
                Button(things[2]) {
                    // add calculate score logic here

                    self.nextRound()
                }
                Text("Your score is \(score)")
            }
        }
}

struct TasKagitMakasView_Previews: PreviewProvider {
    static var previews: some View {
        TasKagitMakasView()
    }
}
