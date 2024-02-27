//
//  SecondView.swift
//  P1: Mirror Mood App
//
//  Created by Christopher Zhao24 on 2/22/24.
//
import SwiftUI
import Swift



struct SecondView: View {
    @State var input : String = ""
    
    
    var body: some View {
        ZStack{
            Image("BackgroundPicture")
            VStack {
                
                Spacer()
                    .frame(height: 25)
                
                Text("DESCRIBE HOW YOU FEEL")
                    .font(.system(size: 45))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .bold()
                    .shadow(color: .black, radius: 5)
                    .frame(width: 380)
                
                Spacer()
                    .frame(height: 40)
                
                FancyFlowerView()
                    .frame(width: 100, height: 100)
                    .fixedSize()
                
                Spacer()
                    .frame(height: 40)
                
                TextField("Words", text: $input, prompt: Text("Type Here").foregroundColor(.white), axis: .vertical)
                    .frame(minWidth: 300, maxWidth: 300, minHeight: 20, maxHeight: 500)
                    .multilineTextAlignment(.leading)
                    .background(
                        Rectangle()
                            .foregroundColor(.white)
                            .opacity(0.6)
                            .cornerRadius(6)
                    
                    )
                
                Spacer()
                
                HStack{
                    Text("Back")
                        .frame(width: 100, height: 50)
                        .foregroundColor(.white)
                        .background(Color.green)
                        .cornerRadius(12)
                        .padding()
                        .onTapGesture{
                            //next = false
                        }
                    
                    
                    Text("Continue")
                        .frame(width: 100, height: 50)
                        .foregroundColor(.white)
                        .background(Color.green)
                        .cornerRadius(12)
                        .padding()
                        .onTapGesture{
                            
                        }
                    
                    
                }
            }
            .frame(width: 300, height: 750)
        }
//.background(Rectangle())
        
        
        
      //  Text(input)
        
        }
    }

    #Preview {
        SecondView()
    }

