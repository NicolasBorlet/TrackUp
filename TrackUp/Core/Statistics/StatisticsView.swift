import SwiftUI

struct StatisticsView: View {
    @State private var index: Int = 0
    @State private var showSettings = false
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    Picker("", selection: $index){
                        Text("Weekly").tag(0)
                        Text("Monthly").tag(1)
                        Text("Yearly").tag(2)
                    }
                    .font(.FunnelSansRegular)
                    .pickerStyle(.segmented)
                    .background(Color(red: 0.949, green: 0.969, blue: 0.969))
                    
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
