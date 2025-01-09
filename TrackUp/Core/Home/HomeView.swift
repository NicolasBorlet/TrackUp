import SwiftUI

struct HomeView: View {
    @Binding var selectedTab: Int
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 48) {
                    VStack(spacing: 16) {
                        Text("This month spend")
                            .font(.FunnelSansRegular)
                        
                        Text("$1,200.11")
                            .font(.HugeText)
                    }
                    
                    VStack(spacing: 12) {
                        HStack {
                            Text("Upcoming")
                                .foregroundStyle(.appGray)
                                .font(.CardTitle)
                            
                            Spacer()
                            
                            Button(action: {
                                selectedTab = 2
                            }) {
                                HStack {
                                    Text("See all")
                                    Image(systemName: "chevron.right")
                                }
                                .font(.FunnelSansRegular)
                            }
                        }
                        
                        ExpenseCard(
                            title: "Github Inc",
                            subtitle: "Monthly",
                            amount: "$11.00",
                            dueDate: "due tomorrow"
                        )
                        
                        ExpenseCard(
                            title: "Github Inc",
                            subtitle: "Monthly",
                            amount: "$11.00",
                            dueDate: "due tomorrow"
                        )

                    }
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
