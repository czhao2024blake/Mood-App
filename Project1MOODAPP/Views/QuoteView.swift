//
//  QuoteView.swift
//  Project1MOODAPP
//
//  Created by Christopher Zhao24 on 2/26/24.
//

import SwiftUI

struct QuoteView: View {
    let quote: String
    init(quote: String){
        self.quote = quote
    }
    
    var body: some View {
        ZStack{
            Image("BackgroundPicture")
            VStack{
                FancyFlowerView()
                Text(quote)
            }
            
        }
    }
}

#Preview {
    QuoteView(quote: "hello worudo")
}
