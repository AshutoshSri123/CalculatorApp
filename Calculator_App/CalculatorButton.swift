import SwiftUI

struct CalculatorButton: View {
    let title: String
    let backgroundColor: Color
    let foregroundColor: Color
    let isWide: Bool
    let action: () -> Void
    
    init(
        title: String,
        backgroundColor: Color = .secondary,
        foregroundColor: Color = .primary,
        isWide: Bool = false,
        action: @escaping () -> Void
    ) {
        self.title = title
        self.backgroundColor = backgroundColor
        self.foregroundColor = foregroundColor
        self.isWide = isWide
        self.action = action
    }
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.title)
                .fontWeight(.semibold)
                .foregroundColor(foregroundColor)
                .frame(
                    width: isWide ? 180 : 80,
                    height: 80
                )
                .background(backgroundColor)
                .clipShape(RoundedRectangle(cornerRadius: 40))
        }
        .buttonStyle(PlainButtonStyle())
    }
}

extension Color {
    static let calculatorOrange = Color.orange
    static let calculatorGray = Color(UIColor.systemGray)
    static let calculatorLightGray = Color(UIColor.systemGray5)
    static let calculatorDarkGray = Color(UIColor.systemGray2)
}
