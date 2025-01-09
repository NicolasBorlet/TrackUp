import SwiftUI

struct StatisticsView: View {
    @State private var index: Int = 0
    @State private var showSettings = false
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    
                    Text("Statistiques")
                    
                    Picker("", selection: $index){
                        Text("Weekly").tag(0)
                        Text("Monthly").tag(1)
                        Text("Yearly").tag(2)
                    }
                    .pickerStyle(.segmented)
                    
                    Text("Selected: \(index)")
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
            // Make the toolbar background white with blur
            .toolbarBackground(.white, for: .navigationBar)
            .withGradientBackground()
        }
    }
}
