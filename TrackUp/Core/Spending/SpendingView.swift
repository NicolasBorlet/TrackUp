import SwiftUI

struct SpendingView: View {
    @State private var index: Int = 0
    @State private var showSettings = false
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {
                    Picker("", selection: $index){
                        Text("Weekly").tag(0)
                        Text("Monthly").tag(1)
                        Text("Yearly").tag(2)
                    }
                    .font(.FunnelSansRegular)
                    .pickerStyle(.segmented)
                    .background(Color(hue: 1.0, saturation: 0.0, brightness: 0.954))
                    
                    ChartCard()
                }
                .padding()
            }
            .navigationTitle("Spending")
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button {
                        showSettings.toggle()
                    } label: {
                        Image(systemName: "gear")
                    }
                }
            }
            .sheet(isPresented: $showSettings) {
                SettingsView()
            }
            .withGradientBackground()
        }
    }
}
