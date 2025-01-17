import SwiftUI

struct ExpenseCard: View {
    var title: String
    var subtitle: String
    var amount: String
    var dueDate: String
    var onTap: (() -> Void)? // New optional closure for tap action

    var body: some View {
        HStack {
            HStack(alignment: .center, spacing: 12) {
                ZStack {
                    Image(systemName: "pencil.circle.fill")
                }
                .frame(width: 35, height: 35)
                .padding(5)
                .background(.lightGray)
                .cornerRadius(5)
                
                VStack(alignment: .leading) {
                    Text(title)
                        .font(.CardTitle)
                    Text(subtitle)
                        .font(.FunnelSansRegular)
                }
            }
            
            Spacer()
            
            VStack(alignment: .trailing) {
                Text(amount)
                    .font(.CardTitle)
                Text(dueDate)
                    .font(.FunnelSansRegular)
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 1)
        .frame(maxWidth: .infinity)
        .onTapGesture {
            onTap?() // Trigger the tap action if provided
        }
    }
}