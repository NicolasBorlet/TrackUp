import SwiftUI

struct SpendingView: View {
    @State private var index: Int = 0
    @State private var showSettings = false
    @State private var selectedTransaction: TransactionDetailData? // New state for selected transaction
    @State private var showDetailSheet = false // New state for showing the bottom sheet

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
                    
                    HStack(spacing: 12) {
                        InfoCard(
                            title: "Income",
                            amount: "+$37.00"
                        )
                                                
                        InfoCard(
                            title: "Saving (0%)",
                            amount: "$0"
                        )
                    }
                    
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Recent transactions")
                            .foregroundStyle(.appGray)
                            .font(.CardTitle)
                        
                        // Modified ExpenseCard to show transaction detail
                        ExpenseCard(
                            title: "Github Inc",
                            subtitle: "Monthly",
                            amount: "$11.00",
                            dueDate: "due tomorrow",
                            onTap: {
                                selectedTransaction = TransactionDetailData(title: "Github Inc", amount: "$11.00", dueDate: "due tomorrow") // Prepare data for bottom sheet
                                showDetailSheet.toggle()
                            }
                        )
                        
                        ExpenseCard(
                            title: "Github Inc",
                            subtitle: "Monthly",
                            amount: "$11.00",
                            dueDate: "due tomorrow",
                            onTap: {
                                selectedTransaction = TransactionDetailData(title: "Github Inc", amount: "$11.00", dueDate: "due tomorrow")
                                showDetailSheet.toggle()
                            }
                        )
                    }
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

// New struct for transaction detail data
struct TransactionDetailData {
    let title: String
    let amount: String
    let dueDate: String
}
