import SwiftUI

struct CalendarView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                CalendarComponent()
            }
            .frame(maxWidth: .infinity)
            .navigationTitle("Calendar")
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
