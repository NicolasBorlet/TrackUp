import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    VStack(spacing: 16) {
                        Text("This month spend")
                            .font(.FunnelSansRegular)
                        
                        Text("$1,200.11")
                            .font(.HugeText)
                    }
                    
                    ExpenseCard(
                        title: "Github Inc",
                        subtitle: "Monthly",
                        amount: "$11.00",
                        dueDate: "due tomorrow"
                    )
                }
                .padding()
            }
            .frame(maxWidth: .infinity)
            .navigationTitle("Home")
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    NavigationLink {
                        // Navigate to notification screen
                        NotificationsView()
                    } label: {
                        // Notification image
                        Image(systemName: "bell")
                    }
                }
            }
            .withGradientBackground()
        }
    }
}
