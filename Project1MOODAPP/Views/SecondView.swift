import SwiftUI

struct SecondView: View {
    @EnvironmentObject private var vm: StringAnalysis
    @State var inputText: String = ""

    var body: some View {
        NavigationView{
        ZStack {
            Image("BackgroundPicture")
                .resizable()
                .scaledToFill()
                .frame(width: 600, height: 800)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer().frame(height: 25)
                
                Text("Describe your mood or feeling:")
                    .font(.system(size: 45))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .bold()
                    .shadow(color: .black, radius: 5)
                    .frame(width: 380)
                
                Spacer().frame(height: 40)
                
                FancyFlowerView(colorName: .white)
                    .frame(width: 100, height: 100)
                
                Spacer().frame(height: 40)
                
                ScrollView {
                    TextEditor(text: $inputText)
                        .frame(minWidth: 300, maxWidth: 300, minHeight: 38, maxHeight: 300)
                        .background(Color.white.opacity(0.6))
                        .cornerRadius(6)
                        .padding()
                        .foregroundColor(.black) 
                        .onTapGesture {
                            //a
                        }
                }
                .frame(minHeight: 20, maxHeight: .infinity)
                
        
                
                NavigationLink(destination: QuoteView(userInput: inputText)){
                        Text("Continue")
                            .frame(width: 300, height: 50)
                            .foregroundColor(.white)
                            .background(inputText != "" ? .blue : .gray)
                            .cornerRadius(12)
                            .padding()
                            
                            
                    }
                .offset(y: inputText != "" ? -100 : 0)
                .disabled(inputText == "")
                }
            }
            .padding()
            .foregroundColor(.white)
            .multilineTextAlignment(.leading)
        }
        .environmentObject(StringAnalysis())
        
    }
      

}

struct SecondView_Previews: PreviewProvider {
    static var previews: some View {
        SecondView()
            .environmentObject(StringAnalysis())
    }
}
