import SwiftUI

class CalculatorViewModel: ObservableObject {
    @Published var display = "0"
    
    private var currentNumber: Double = 0
    private var previousNumber: Double = 0
    private var operation: Operation?
    private var shouldResetDisplay = false
    
    enum Operation: CaseIterable {
        case add, subtract, multiply, divide
        
        func calculate(_ a: Double, _ b: Double) -> Double {
            switch self {
            case .add:
                return a + b
            case .subtract:
                return a - b
            case .multiply:
                return a * b
            case .divide:
                return b != 0 ? a / b : 0
            }
        }
        
        var symbol: String {
            switch self {
            case .add: return "+"
            case .subtract: return "-"
            case .multiply: return "×"
            case .divide: return "÷"
            }
        }
    }
    
    func numberPressed(_ number: Int) {
        if shouldResetDisplay {
            display = "0"
            shouldResetDisplay = false
        }
        
        if display == "0" {
            display = "\(number)"
        } else {
            display += "\(number)"
        }
        
        currentNumber = Double(display) ?? 0
    }
    
    func decimalPressed() {
        if shouldResetDisplay {
            display = "0"
            shouldResetDisplay = false
        }
        
        if !display.contains(".") {
            display += "."
        }
    }
    
    func operationPressed(_ op: Operation) {
        if operation != nil {
            calculateResult()
        }
        
        operation = op
        previousNumber = currentNumber
        shouldResetDisplay = true
    }
    
    func equalsPressed() {
        calculateResult()
        operation = nil
    }
    
    func clearPressed() {
        display = "0"
        currentNumber = 0
        previousNumber = 0
        operation = nil
        shouldResetDisplay = false
    }
    
    func toggleSign() {
        if currentNumber != 0 {
            currentNumber *= -1
            display = formatNumber(currentNumber)
        }
    }
    
    func percentPressed() {
        currentNumber /= 100
        display = formatNumber(currentNumber)
    }
    
    private func calculateResult() {
        guard let op = operation else { return }
        
        let result = op.calculate(previousNumber, currentNumber)
        currentNumber = result
        display = formatNumber(result)
        shouldResetDisplay = true
    }
    
    private func formatNumber(_ number: Double) -> String {
        if number.truncatingRemainder(dividingBy: 1) == 0 {
            return String(Int(number))
        } else {
            return String(number)
        }
    }
}
