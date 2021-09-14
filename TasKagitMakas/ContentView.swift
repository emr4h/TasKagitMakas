//
//  ContentView.swift
//  TasKagitMakas
//
//  Created by Emrah Yıldırım on 14.09.2021.
//

import SwiftUI

struct ContentView: View {
    
    
    var oyunDizisi = ["tas","kagit","makas"]
    @State var oyunSecimi = Int.random(in: 0...2)
    @State var score = 0
    @State var hangisiSecilmeli = true
    
    @State var sayac = 0
    @State var sayacSay = false
   
    
    var body: some View {
        
                ZStack {
                    LinearGradient(gradient: Gradient(colors: [Color.red, Color.white]), startPoint: .top, endPoint: .bottom)
                        .edgesIgnoringSafeArea(.all)
                    VStack{
                        Spacer()
                        Text("Rakibinin Secimi :  \(oyunDizisi[oyunSecimi])")
                            .font(.title)
                            .foregroundColor(.black)
                            .bold()
                            .padding()
                        Text("\(hangisiSecilmeli ? "Kazanmak için Seç" : "Kaybetmek için Seç")")
                            .font(.title2)
                            .foregroundColor(.white)
                            .bold()
     
                        ForEach(0..<3){ x in
                            Button(action: {
                                ButonaTıkla(number: x)
                                sonrakiOyun()
                                if sayac == 10 {
                                    sayacSay = true
                                }
                            }) {
                                Image(oyunDizisi[x])
                                    .resizable()
                                    .frame(width: 150, height: 150, alignment: .center)
                            }
                        }
                        .alert(isPresented: $sayacSay, content: {
                            Alert(title: Text("Oyun Bitti"), message: Text("Senin Score 'un : \(score)"), dismissButton: .default(Text("Yeniden Başla")){
                                score = 0
                                sayac = 0
                                sonrakiOyun()
                            })
                        })
                        
                        Spacer()
                        Text("Score : \(score)")
                            .font(.largeTitle)
                            .bold()
                }
            }
    }
    
    func ButonaTıkla(number:Int) {
        if oyunDizisi[oyunSecimi] == oyunDizisi[0] {
            if oyunDizisi[number] == oyunDizisi[1] && hangisiSecilmeli == true || oyunDizisi[number] == oyunDizisi[2] && hangisiSecilmeli == false {
                score = score + 1
            } else {
                score = score - 1
            }
        } else if oyunDizisi[oyunSecimi] == oyunDizisi[1] {
            if oyunDizisi[number] == oyunDizisi[2] && hangisiSecilmeli == true || oyunDizisi[number] == oyunDizisi[0] && hangisiSecilmeli == false {
                score = score + 1
            } else {
                score = score - 1
            }
        } else if oyunDizisi[oyunSecimi] == oyunDizisi[2] {
            if oyunDizisi[number] == oyunDizisi[0] && hangisiSecilmeli == true || oyunDizisi[number] == oyunDizisi[1] && hangisiSecilmeli == false {
                score = score + 1
            } else {
                score = score - 1
            }
        }
    }
    
    func sonrakiOyun() {
        oyunSecimi = Int.random(in: 0...2)
        hangisiSecilmeli = Bool.random()
        sayac = sayac + 1
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

