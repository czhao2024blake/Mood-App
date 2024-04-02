import SwiftUI



struct QuoteView: View {
    @EnvironmentObject private var vm: StringAnalysis
    
    @State var moodColor: Color = .blue
    @State var petalAngleMultiplier: Double = 1
    var userInput: String = "you shouldnt see this"
    
    @State private var userMoodValue: String = ""
    
    
    
    
    var body: some View {
        NavigationView{
            ZStack {
                Image("BackgroundPicture")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    FancyFlowerView(colorName: .blue, pAM: petalAngleMultiplier)
                        .scaleEffect(1.5)
                        .offset(y: -90)
                    
                    ZStack{
                        RoundedRectangle(cornerRadius: 15)
                            .frame(width: 360, height: 300)
                            .opacity(0.6)
                        
                        Spacer()
                        
                        
                        VStack{
                            Text("Your result was " + userMoodValue)
                            
                            Text(vm.returnQuote(String(userMoodValue)))
                                .frame(width: 330)
                                .padding()
                            
                        }
                        .foregroundColor(.white)
                    }
                }
                .onAppear{
                    userMoodValue = vm.doEverything(inputText: userInput)
                    if userMoodValue == "Positive" || userMoodValue == "Strongly Positive" {
                        moodColor = .green
                        petalAngleMultiplier = 0.5
                    }
                }
                
                
            }
        }
        .navigationBarHidden(true)
        
    }
    
}
  

struct QuoteView_Previews: PreviewProvider {
    static var previews: some View {
       
        QuoteView(userInput: "LOLOLOL")
            .environmentObject(StringAnalysis())
    }
}
