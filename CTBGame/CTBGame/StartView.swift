import SwiftUI

struct StartView: View {
    var body: some View {
        NavigationView {
            ZStack { 
                Image("green_felt")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    Text("Close the Box")
                        .font(.largeTitle)
                        .padding()

                    NavigationLink(destination: ContentView()) {
                        Text("Play")
                            .font(.title)
                            .padding()
                            .background(Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }

                    NavigationLink(destination: RulesView()) {
                        Text("Rules")
                            .font(.title)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                }
            }
        }
    }
}

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}
