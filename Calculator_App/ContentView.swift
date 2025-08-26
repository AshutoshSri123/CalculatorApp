import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = CalculatorViewModel()
    
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 12) {
                Spacer()
                
                // Display
                HStack {
                    Spacer()
                    Text(viewModel.display)
                        .font(.system(size: min(geometry.size.width * 0.2, 100), weight: .light))
                        .foregroundColor(.white)
                        .lineLimit(1)
                        .minimumScaleFactor(0.5)
                }
                .padding(.horizontal, 24)
                .padding(.bottom, 24)
                
                // Button Grid
                VStack(spacing: 12) {
                    // Row 1
                    HStack(spacing: 12) {
                        Button("AC") {
                            viewModel.clearPressed()
                        }
                        .buttonStyle(CalculatorButtonStyle(
                            backgroundColor: .calculatorLightGray,
                            foregroundColor: .black
                        ))
                        
                        Button("±") {
                            viewModel.toggleSign()
                        }
                        .buttonStyle(CalculatorButtonStyle(
                            backgroundColor: .calculatorLightGray,
                            foregroundColor: .black
                        ))
                        
                        Button("%") {
                            viewModel.percentPressed()
                        }
                        .buttonStyle(CalculatorButtonStyle(
                            backgroundColor: .calculatorLightGray,
                            foregroundColor: .black
                        ))
                        
                        Button("÷") {
                            viewModel.operationPressed(.divide)
                        }
                        .buttonStyle(CalculatorButtonStyle(
                            backgroundColor: .calculatorOrange,
                            foregroundColor: .white
                        ))
                    }
                    
                    // Row 2
                    HStack(spacing: 12) {
                        Button("7") {
                            viewModel.numberPressed(7)
                        }
                        .buttonStyle(CalculatorButtonStyle(
                            backgroundColor: .calculatorDarkGray,
                            foregroundColor: .white
                        ))
                        
                        Button("8") {
                            viewModel.numberPressed(8)
                        }
                        .buttonStyle(CalculatorButtonStyle(
                            backgroundColor: .calculatorDarkGray,
                            foregroundColor: .white
                        ))
                        
                        Button("9") {
                            viewModel.numberPressed(9)
                        }
                        .buttonStyle(CalculatorButtonStyle(
                            backgroundColor: .calculatorDarkGray,
                            foregroundColor: .white
                        ))
                        
                        Button("×") {
                            viewModel.operationPressed(.multiply)
                        }
                        .buttonStyle(CalculatorButtonStyle(
                            backgroundColor: .calculatorOrange,
                            foregroundColor: .white
                        ))
                    }
                    
                    // Row 3
                    HStack(spacing: 12) {
                        Button("4") {
                            viewModel.numberPressed(4)
                        }
                        .buttonStyle(CalculatorButtonStyle(
                            backgroundColor: .calculatorDarkGray,
                            foregroundColor: .white
                        ))
                        
                        Button("5") {
                            viewModel.numberPressed(5)
                        }
                        .buttonStyle(CalculatorButtonStyle(
                            backgroundColor: .calculatorDarkGray,
                            foregroundColor: .white
                        ))
                        
                        Button("6") {
                            viewModel.numberPressed(6)
                        }
                        .buttonStyle(CalculatorButtonStyle(
                            backgroundColor: .calculatorDarkGray,
                            foregroundColor: .white
                        ))
                        
                        Button("-") {
                            viewModel.operationPressed(.subtract)
                        }
                        .buttonStyle(CalculatorButtonStyle(
                            backgroundColor: .calculatorOrange,
                            foregroundColor: .white
                        ))
                    }
                    
                    // Row 4
                    HStack(spacing: 12) {
                        Button("1") {
                            viewModel.numberPressed(1)
                        }
                        .buttonStyle(CalculatorButtonStyle(
                            backgroundColor: .calculatorDarkGray,
                            foregroundColor: .white
                        ))
                        
                        Button("2") {
                            viewModel.numberPressed(2)
                        }
                        .buttonStyle(CalculatorButtonStyle(
                            backgroundColor: .calculatorDarkGray,
                            foregroundColor: .white
                        ))
                        
                        Button("3") {
                            viewModel.numberPressed(3)
                        }
                        .buttonStyle(CalculatorButtonStyle(
                            backgroundColor: .calculatorDarkGray,
                            foregroundColor: .white
                        ))
                        
                        Button("+") {
                            viewModel.operationPressed(.add)
                        }
                        .buttonStyle(CalculatorButtonStyle(
                            backgroundColor: .calculatorOrange,
                            foregroundColor: .white
                        ))
                    }
                    
                    // Row 5
                    HStack(spacing: 12) {
                        Button("0") {
                            viewModel.numberPressed(0)
                        }
                        .buttonStyle(CalculatorButtonStyle(
                            backgroundColor: .calculatorDarkGray,
                            foregroundColor: .white,
                            isWide: true
                        ))
                        
                        Button(".") {
                            viewModel.decimalPressed()
                        }
                        .buttonStyle(CalculatorButtonStyle(
                            backgroundColor: .calculatorDarkGray,
                            foregroundColor: .white
                        ))
                        
                        Button("=") {
                            viewModel.equalsPressed()
                        }
                        .buttonStyle(CalculatorButtonStyle(
                            backgroundColor: .calculatorOrange,
                            foregroundColor: .white
                        ))
                    }
                }
                .padding(.horizontal, 24)
                .padding(.bottom, 34)
            }
        }
        .background(Color.black)
        .ignoresSafeArea()
    }
}

struct CalculatorButtonStyle: ButtonStyle {
    let backgroundColor: Color
    let foregroundColor: Color
    let isWide: Bool
    
    init(backgroundColor: Color, foregroundColor: Color, isWide: Bool = false) {
        self.backgroundColor = backgroundColor
        self.foregroundColor = foregroundColor
        self.isWide = isWide
    }
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.title)
            .fontWeight(.semibold)
            .foregroundColor(foregroundColor)
            .frame(
                width: isWide ? 180 : 80,
                height: 80
            )
            .background(backgroundColor)
            .clipShape(RoundedRectangle(cornerRadius: 40))
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
            .animation(.easeInOut(duration: 0.1), value: configuration.isPressed)
    }
}

extension Color {
    static let CalculatorOrange = Color.orange
    static let CalculatorGray = Color(UIColor.systemGray)
    static let CalculatorLightGray = Color(UIColor.systemGray5)
    static let CalculatorDarkGray = Color(UIColor.systemGray2)
}

#Preview {
    ContentView()
}
