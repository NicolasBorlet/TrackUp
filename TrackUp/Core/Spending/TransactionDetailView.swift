import SwiftUI

struct TransactionDetailView: View {
    let transaction: TransactionDetailData

    var body: some View {
        VStack(spacing: 20) {
            Text(transaction.title)
                .font(.largeTitle)
                .padding()
            Text("Amount: \(transaction.amount)")
                .font(.title2)
            Text("Due Date: \(transaction.dueDate)")
                .font(.title3)
            Spacer()
        }
        .padding()
        .background(Color.white)
        .cornerRadius(20)
        .shadow(radius: 10)
    }
}