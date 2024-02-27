// ContentView.swift
//  P1: Mirror Mood App
//
//  Created by Christopher Zhao24 on 2/22/24.
//
import Swift

import SwiftUI

struct ContentView: View {
    @State private var showSecondView = false
    @State private var emotionSelected = false
    @State private var moodSelected = false

    var body: some View {
        NavigationView {
            ZStack {
                Image("BackgroundPicture")
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    if showSecondView {
                        SecondView()
                            .transition(.slide)
                    } else {
                        FirstPage()
                    }
                }
            }
            .navigationBarHidden(true)
        }
    }
}

struct FirstPage: View {
    @State private var emotionSelected = false
    @State private var moodSelected = false
    
    var body: some View {
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
                .frame(height: 180)
            
            ZStack{
                RoundedRectangle(cornerSize: CGSize(width: 15, height: 20))
                    .frame(width: emotionSelected ? 340 : 280, height: emotionSelected ? 160 : 120)
                    .opacity(0.6)
                    .onTapGesture {
                        withAnimation {
                            self.emotionSelected.toggle()
                            self.moodSelected = false
                        }
                    }
                VStack{
                    Text("EMORION")
                    Text("right now you feel")
                    Text("time?")
                }
                .foregroundColor(.white)
            }
            
            ZStack{
                RoundedRectangle(cornerSize: CGSize(width: 15, height: 20))
                    .frame(width: moodSelected ? 340 : 280, height: moodSelected ? 160 : 120)
                    .opacity(0.6)
                    .onTapGesture {
                        withAnimation {
                            self.moodSelected.toggle()
                            self.emotionSelected = false
                        }
                    }
                VStack{
                    Text("mood")
                }
                .foregroundColor(.white)
            }
            
            Spacer()
                .frame(height: 40)
            
            NavigationLink(destination: SecondView()) {
                Text("Next")
                    .frame(width: 100, height: 50)
                    .foregroundColor(.white)
                    .background(Color.green)
                    .cornerRadius(12)
            }
            .padding()
            
            Spacer()
        }
    }
}


extension AnyTransition {
    static var slide: AnyTransition {
        let insertion = AnyTransition.move(edge: .trailing)
        return .asymmetric(insertion: insertion, removal: .identity)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
