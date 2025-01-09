import SwiftUI

struct BackgroundView: View {
    @State private var animate = false
    
    var body: some View {
        ZStack {
            // Premier gradient
            RadialGradient(
                gradient: Gradient(colors: [
                    Color.purple.opacity(0.3),
                    Color.clear
                ]),
                center: .topLeading,
                startRadius: 0,
                endRadius: animate ? 400 : 200
            )
            
            // Deuxième gradient
            RadialGradient(
                gradient: Gradient(colors: [
                    Color.pink.opacity(0.2),
                    Color.clear
                ]),
                center: .bottomTrailing,
                startRadius: 0,
                endRadius: animate ? 400 : 300
            )
            
            // Troisième gradient pour plus de profondeur
            RadialGradient(
                gradient: Gradient(colors: [
                    Color.white.opacity(0.3),
                    Color.clear
                ]),
                center: .center,
                startRadius: 0,
                endRadius: animate ? 300 : 200
            )
        }
        .background(Color.white)
        .ignoresSafeArea()
        .onAppear {
            withAnimation(.easeInOut(duration: 7.0).repeatForever(autoreverses: true)) {
                animate.toggle()
            }
        }
    }
}

#Preview {
    BackgroundView()
} 