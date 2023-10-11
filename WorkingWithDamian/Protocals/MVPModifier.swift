import SwiftUI

struct MVPModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width: 100.0, height: 100.0 )
            .background(.blue)
            .foregroundColor(.white)
            .cornerRadius(20)
            .padding()
    }
}
