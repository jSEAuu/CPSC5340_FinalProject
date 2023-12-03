import SwiftUI

struct ContentView: View {
    @State private var openNumbers = Set(1...9)
    @State private var diceRollResult = 0
    @State private var diceRoll = ""
    @State private var isRollButtonEnabled = true
    @State private var selectedNumbers = Set<Int>()

    private var selectedNumbersSum: Int {
        return selectedNumbers.reduce(0, +)
    }

    private let woodColor = Color(red: 0.75, green: 0.55, blue: 0.30)

    var body: some View {
        ZStack {
            if UIDevice.current.orientation.isPortrait {
                Color.black
                    .edgesIgnoringSafeArea(.all)

                VStack {
                    Spacer()
                    Text("Switch to landscape to view game")
                        .font(.title)
                        .foregroundColor(.white)
                        .padding()
                    Spacer()
                }
            } else {
                Image("green_felt")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .edgesIgnoringSafeArea(.all)

                VStack {
                    HStack(spacing: 20) {
                        ForEach(1...9, id: \.self) { number in
                            Button(action: {
                                toggleNumber(number)
                            }) {
                                Text("\(number)")
                                    .font(.system(size: 40))
                                    .font(.title)
                                    .fontWeight(.bold)
                                    .padding(20)
                                    .background(
                                        RoundedRectangle(cornerRadius: 0)
                                            .fill(selectedNumbers.contains(number) ? Color.red : (openNumbers.contains(number) ? woodColor : Color.gray))
                                    )
                                    .foregroundColor(.black)
                            }
                        }
                    }
                    .padding(.top, 70)

                    Spacer()

                    if !diceRoll.isEmpty {
                        Text("You rolled a ")
                            .font(.title)
                            .foregroundColor(.white)
                            +
                            Text("\(diceRollResult)")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                    }

                    if openNumbers.isEmpty {
                        Text("You Win!")
                            .font(.system(size: 120))
                            .fontWeight(.bold)
                            .foregroundColor(Color.white)
                    }

                    HStack {
                        Button(action: {
                            rollDice()
                        }) {
                            Text("Roll Dice")
                                .font(.title)
                                .padding()
                                .background(isRollButtonEnabled ? Color.green : Color.gray)
                                .foregroundColor(.black)
                                .cornerRadius(30)
                        }
                        .disabled(!isRollButtonEnabled)

                        Spacer()

                        Button(action: {
                            endTurn()
                        }) {
                            Text("End Turn")
                                .font(.title)
                                .padding()
                                .background(Color.yellow)
                                .foregroundColor(.black)
                                .cornerRadius(30)
                        }
                        .disabled(selectedNumbersSum != diceRollResult || selectedNumbersSum == 0)

                        Spacer()

                        Button(action: {
                            resetGame()
                        }) {
                            Text("Reset Game")
                                .font(.title)
                                .padding()
                                .background(Color.red)
                                .foregroundColor(.black)
                                .cornerRadius(30)
                        }
                    }
                    .padding(.bottom, 50)
                }
            }
        }
        .onAppear {
            NotificationCenter.default.addObserver(forName: UIDevice.orientationDidChangeNotification, object: nil, queue: .main) { _ in
                let orientation = UIDevice.current.orientation
                if orientation == .portrait {
                    diceRoll = "Switch to landscape to view the game"
                } else {
                    diceRoll = ""
                }
            }
        }
    }

    func toggleNumber(_ number: Int) {
        if openNumbers.contains(number) {
            openNumbers.remove(number)
            selectedNumbers.insert(number)
        } else if selectedNumbers.contains(number) {
            selectedNumbers.remove(number)
            openNumbers.insert(number)
        }
    }

    func rollDice() {
        diceRollResult = Int.random(in: 2...12)
        diceRoll = "\(diceRollResult)"
        isRollButtonEnabled = false
    }

    func resetGame() {
        openNumbers = Set(1...9)
        diceRollResult = 0
        diceRoll = ""
        isRollButtonEnabled = true
        selectedNumbers = Set<Int>()
    }

    func endTurn() {
        isRollButtonEnabled = true
        selectedNumbers = Set<Int>()
        diceRoll = ""
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
