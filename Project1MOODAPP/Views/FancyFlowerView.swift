//
//  FancyFlowerView.swift
//  P1: Mirror Mood App
//
//  Created by Christopher Zhao24 on 2/22/24.
//

import SwiftUI

struct FancyFlowerView: View {
    var feelingHappy = false
    var colorName: Color = .green
    var pAM: Double = 1
        var body: some View{
        ZStack{
          //  Color.white.ignoresSafeArea(.all, edges: .all)
            VStack{
                MainFlower(feelingHappy: feelingHappy, colorName: colorName, pAM: pAM)
            }
        }
    }
}

#Preview {
    FancyFlowerView()
}

struct MainFlower: View{
    
    @State private var rPetal = false
    @State private var lPetal = false
    @State private var mlPetal = false
    @State private var mrPetal = false
    @State private var customShadow = false
    @State private var finalSelected = true
    @State private var finalSelectedAngle = 1
    @State var feelingHappy = false
    @State var colorName: Color = .green
    @State var pAM: Double = 1
    
   
    
    @State private var inputColor = Color.green
    
    var body: some View{
        ZStack{
            ZStack{
                Image(systemName: "diamond")
                    .resizable()
                    .frame(width: 40, height: 110, alignment: .center) //middle
                    .rotationEffect(.degrees(0), anchor: .bottom)
                    .foregroundColor(Color(colorName))
                    
                
                Image(systemName: "diamond")
                    .resizable()
                    .frame(width: 40, height: 110, alignment: .center) //middle left
                    .foregroundColor(Color(colorName))
                    
                
                Image(systemName: "diamond")
                    .resizable()
                    .frame(width: 40, height: 110, alignment: .center) //left
                    .rotationEffect(.degrees(mlPetal ? -25*pAM : -7.5), anchor: .bottom)
                    .animation(Animation.easeInOut(duration: 2).delay(2).repeatForever(autoreverses: true))
                    .onAppear{
                        mlPetal.toggle()
                    }
                    .foregroundColor(Color(colorName))
                
                
                Image(systemName: "diamond")
                    .resizable()
                    .frame(width: 40, height: 110, alignment: .center) //middle
                    .foregroundColor(Color(colorName))
                
                
                Image(systemName: "diamond")
                    .resizable()
                    .frame(width: 40, height: 110, alignment: .center) //right
                    .rotationEffect(.degrees(mlPetal ? 25*pAM : 7.5), anchor: .bottom)
                    .animation(Animation.easeInOut(duration: 2).delay(2).repeatForever(autoreverses: true))
                    .onAppear{
                        mrPetal.toggle()
                    }
                    .foregroundColor(Color(colorName))
                
                
                Image(systemName: "diamond")
                    .resizable()
                    .frame(width: 40, height: 110, alignment: .center) //left
                    .rotationEffect(.degrees(mlPetal ? -50*pAM : -15), anchor: .bottom)
                             .animation(Animation.easeInOut(duration: 2).delay(2).repeatForever(autoreverses: true))
                    .onAppear{
                        lPetal.toggle()
                    }
                    .foregroundColor(Color(colorName))
                
                Image(systemName: "diamond")
                    .resizable()
                    .frame(width: 40, height: 110, alignment: .center) //right
                    .rotationEffect(.degrees(mlPetal ? 50*pAM : 15), anchor: .bottom)
                    .animation(Animation.easeInOut(duration: 2).delay(2).repeatForever(autoreverses: true))
                    .onAppear{
                        rPetal.toggle()
                    }
                    .foregroundColor(Color(colorName))
            }
            .shadow(color: Color.white, radius: 30)
            .hueRotation(Angle(degrees: customShadow ? 0 : 0))
            .animation(Animation.easeInOut(duration: 2).delay(2).repeatForever(autoreverses: true))
            .onAppear{
          
            }
            
        }
        .frame(width: 250, height: 250)
    }
        
    
}
