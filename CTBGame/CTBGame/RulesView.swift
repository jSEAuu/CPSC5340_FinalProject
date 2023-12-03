import SwiftUI

struct RulesView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Text("Rules")
                    .font(.largeTitle)
                    .padding()
                Text("A round of the game consists of each player taking one turn to try to shut the box. A turn consists of a player repeatedly throwing the dice until he or she cannot continue.")
                    .font(.body)

                Text("The player throws the dice into the box and adds up the pips. The player must then cover available numbers that add up to the total thrown. So for instance, if the total is 7, the player may choose one of the following options:")
                    .font(.body)

                Text("1. 7")
                    .font(.body)

                Text("2. 6 & 1")
                    .font(.body)

                Text("3. 5 & 2")
                    .font(.body)

                Text("4. 4 & 3")
                    .font(.body)
                
                Text("Assuming that one of the options is available to be played, the player selects one, covers the selected number or numbers and proceeds to throw the dice again.")
                    .font(.body)
                
                Text("If none of the options are available because at least one number is already covered in each case, then the player's turn finishes and the player scores the sum of the numbers that are still uncovered.")
                    .font(.body)
            }
            .padding()
        }
    }
}

struct RulesView_Previews: PreviewProvider {
    static var previews: some View {
        RulesView()
    }
}
