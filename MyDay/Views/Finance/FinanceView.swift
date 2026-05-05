//
//  FinanceView.swift
//  MyDay
//
//  Created by Maxim Vershinin on 05.05.2026.
//

import SwiftUI
import SwiftData

struct FinanceView: View {
    @Environment(FinanceViewModel.self) private var viewModel
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text("How we spend money today?")
                    .foregroundStyle(Color.appText)
                VStack(alignment: .leading) {
                 Text("Balance for this month")
                        .font(.caption)
                        .foregroundStyle(Color.appText2)
                    Text(viewModel.balance.formatted())
                        .foregroundStyle(Color.appText)
                        .bold()
                        .font(.system(size: 36))
                    HStack() {
                        VStack {
                            HStack {
                                Image(systemName: "arrow.down")
                                    .foregroundStyle(Color.appRed)
                                    .font(.caption)
                                Text("Expense")
                                    .font(.caption)
                                    .foregroundStyle(Color.appText2)
                            }
                            Text(viewModel.totalExpense.formatted())
                                .foregroundStyle(Color.appRed)
                        }
                        Spacer()
                        VStack {
                            HStack {
                                Image(systemName: "arrow.up")
                                    .foregroundStyle(Color.appGreen)
                                    .font(.caption)
                                Text("Income")
                                    .font(.caption)
                                    .foregroundStyle(Color.appText2)
                            }
                            Text(viewModel.totalIncome.formatted())
                                .foregroundStyle(Color.appGreen)

                        }
                    }
                    .frame(maxWidth: .infinity)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 28)
                .padding(.vertical, 12)
                .background(Color.appSurface)
                .clipShape(RoundedRectangle(cornerRadius: 24))
            }
            .padding(.horizontal, 16)
        }
            }
}

#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: Transaction.self, Category.self, configurations: config)

    let income = Transaction()
    income.amount = 50000
    income.type = .income

    let expense1 = Transaction()
    expense1.amount = 12000
    expense1.type = .expense

    let expense2 = Transaction()
    expense2.amount = 3500
    expense2.type = .expense

    container.mainContext.insert(income)
    container.mainContext.insert(expense1)
    container.mainContext.insert(expense2)

    return FinanceView()
        .modelContainer(container)
        .environment(FinanceViewModel(context: container.mainContext))
        .background(Color.appBg)
}
