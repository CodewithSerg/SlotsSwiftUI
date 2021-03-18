//
//  ContentView.swift
//  Slots SwiftUI
//
//  Created by Sergey Antoniuk on 11/17/20.
//

import SwiftUI

struct ContentView: View {
    @State private var symbols = ["apple", "star", "cherry"]
    @State private var numbers = [0,0,0]
    
    @State private var backgrounds = [Color.white, Color.white, Color.white]
    
    @State private var isLose = false
    
    @State private var credits = 100 {
        didSet {
            if credits <= 0 {
                self.isLose = true
                self.credits = 100
            }
        }
    }
    
    
    private var betAmount = 5
    
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [Color.yellow, Color.black]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            LinearGradient(gradient: Gradient(colors: [Color.black, Color.yellow]), startPoint: .top, endPoint: .bottom)
                .rotationEffect(Angle(degrees: 45))
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            
            VStack{
                Spacer()
                HStack{
                    Image(systemName: "star.fill")
                        .foregroundColor(.white)
                    Text("Slots For Winner")
                        .bold()
                        .foregroundColor(.white)
                    Image(systemName: "star.fill")
                        .foregroundColor(.white)
                }.scaleEffect(2)
                .opacity(0.9)
                
                Spacer()
                
                Text("Credits: " + String(credits))
                    .foregroundColor(.black)
                    .padding(.all, 10)
                    .background(Color.white.opacity(0.3))
                    .cornerRadius(15)
                Spacer()
                
                HStack{
                    Spacer()
                    SlotView(symbol: $symbols[numbers[0]], background: $backgrounds[0])
                    SlotView(symbol: $symbols[numbers[1]], background: $backgrounds[1])
                    SlotView(symbol: $symbols[numbers[2]], background: $backgrounds[2])
                    
                    Spacer()
                }
                Spacer()
                Button(action: {
                    //Set all backgrounds to white after win green
                    
                    self.backgrounds = self.backgrounds.map{_ in
                        Color.white
                    }
                    
                    //Change images
                    
                    self.numbers[0] = Int.random(in: 0...self.symbols.count-1)
                    self.numbers[1] = Int.random(in: 0...self.symbols.count-1)
                    self.numbers[2] = Int.random(in: 0...self.symbols.count-1)
                    
                    //Result to check for win or lose
                    if self.numbers[0] == self.numbers[1] && self.numbers[1] == self.numbers[2]{
                        //Win
                        self.credits += self.betAmount*5
                        
                            self.backgrounds[0] = Color.green
                            self.backgrounds[1] = Color.green
                            self.backgrounds[2] = Color.green
                        
                        
                        //Lost
                    } else {
                        self.credits -= self.betAmount
                       
                    }
                    
                }, label: {
                    Text("GoodLack")
                        .bold()
                        .foregroundColor(.white)
                        .padding(.all, 10)
                        .background(Color.pink)
                        .cornerRadius(15)
                    
                }).alert(isPresented: $isLose){
                    Alert(title: Text("Game over"), message: Text("try again"), dismissButton: .cancel())}
                    
                Spacer()
                
            }.animation(.easeInOut)
            
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


