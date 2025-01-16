import SwiftUI

extension View {
    func withGradientBackground() -> some View {
        self.background(BackgroundView())
    }
} 
