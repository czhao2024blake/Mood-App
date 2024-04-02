// ContentView.swift
//  P1: Mirror Mood App
//
//  Created by Christopher Zhao24 on 2/22/24.
//
import Swift

import SwiftUI

struct ContentView: View {
//    @State private var showSecondView = false
    @State private var emotionSelected = false
    @State private var moodSelected = false
   
    
    
//    @EnvironmentObject

    var body: some View {
       
           
                NavigationView{
                    FirstPage()
                }
                
                    }
                }
            

struct FirstPage: View {
    @State private var emotionSelected = false
    @State private var moodSelected = false
    
    var body: some View {
        ZStack {
            Image("BackgroundPicture")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            VStack {
                Spacer()
                
                Text("Log an Emotion or Mood")
                    .font(.system(size: 45))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .bold()
                    .shadow(color: .black, radius: 5)
                    .frame(width: 380)
                
                Spacer()
                    .frame(height: 140)
                
                ZStack{
                    RoundedRectangle(cornerSize: CGSize(width: 15, height: 20))
                        .frame(width: 280, height: 120)
                        .foregroundColor(.black)
                        .opacity(0.6)
                        .onTapGesture {
                            withAnimation {
                                self.emotionSelected.toggle()
                                self.moodSelected = false
                            }
                        }
                    
                    VStack{
                        HStack{
                            Image(systemName: ("clock"))
                                .scaleEffect(1)
                                .foregroundColor(.white)
                            
                            Text("Emotion")
                        }
                        .offset(x: -50)
                        
                        Spacer()
                            .frame(height: 6)
                        
                        Text("How you feel right now")
                            .scaleEffect(1.05)
                            .offset(x: -3.5)
                        TimeView()
                        
                    }
                    
                    
                    
                    .foregroundColor(.white)
                }
                .scaleEffect(emotionSelected ? 1.23 : 1)
                
                Spacer()
                    .frame(height: 30)
                    .scaleEffect((emotionSelected || moodSelected ? 1.5 : 1))
                
                ZStack{
                    RoundedRectangle(cornerSize: CGSize(width: 15, height: 20))
                        .frame(width: 280, height:  120)
                        .opacity(0.6)
                        .onTapGesture {
                            withAnimation {
                                self.moodSelected.toggle()
                                self.emotionSelected = false
                            }
                        }
                    VStack{
                        
                        HStack{
                            Image(systemName:("sun.haze"))
                            Text("Mood")
                        }
                        .offset(x: -58)
                        Spacer()
                            .frame(height: 6)
                        Text("How you've felt overall today")
                    }
                    //.scaleEffect(moodSelected ? 1.5 : 1)
                    .foregroundColor(.white)
                }
                .scaleEffect(moodSelected ? 1.23 : 1)
                
                Spacer()
                    .frame(height: 85)
                
                NavigationLink(destination: SecondView()) {
                    Text("Next")
                        .frame(width: 350, height: 37.5)
                        .foregroundColor(.white)
                        .background(moodSelected || emotionSelected ? Color.blue : Color.gray)
                        .cornerRadius(12)
                        .shadow(color:.black, radius: 0.5)
                    
                }
                .offset(y: moodSelected || emotionSelected ? -80 : 80)
                .disabled(!(moodSelected || emotionSelected))
                
                
                .padding()
                
                Spacer()
            }
        }
        
    }
    
    struct TimeView: View {
        @State private var currentTime = Date()
        
        let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
        let timeFormatter: DateFormatter = {
            let formatter = DateFormatter()
            formatter.dateFormat = "hh:mm a"
            return formatter
        }()
        
        var body: some View {
            Text(timeFormatter.string(from: currentTime))
                .onReceive(timer) { input in
                    currentTime = input
                }
           
            
                .onDisappear {
                    timer.upstream.connect().cancel()
                }
        }
    }
    
    
    
}
    #Preview{
        
        ContentView()
    }

