//
//  ContentView.swift
//  Bank-eze
//
//  Created by Yancarlo Guzman on 1/30/24.
//
//

import SwiftUI

struct PaymentView: View {
    @State private var paymentTotals: [String: [Double]] = [
        "Visa": [],
        "Mastercard": [],
        "Discover": [],
        "Amex": [],
        "Disney Rewards": [],
        "Guest ID": [],
        "Gift Card": [],
        "Dining Plan Adult": [],
        "Dining Plan Child": []
    ]

    var body: some View {
        NavigationView {
            List {
                ForEach(Array(paymentTotals.keys).sorted(), id: \.self) { paymentType in
                    NavigationLink(destination: PaymentDetail(paymentType: paymentType, entries: paymentTotals[paymentType] ?? [], updateTotal: { entries in
                        paymentTotals[paymentType] = entries
                    })) {
                        HStack {
                            Text(paymentType)
                            Spacer()
                            Text(String(format: "$%.2f", paymentTotals[paymentType]?.reduce(0, +) ?? 0))
                        }
                    }
                }
                .onDelete(perform: deletePayment)
            }
            .navigationTitle("Bank-eze Payments")
        }
    }

    private func deletePayment(at offsets: IndexSet) {
        for index in offsets {
            let paymentType = Array(paymentTotals.keys).sorted()[index]
            paymentTotals[paymentType] = []
        }
    }
}

struct PaymentDetail: View {
    var paymentType: String
    var entries: [Double]
    var updateTotal: ([Double]) -> Void

    @State private var amountText = ""

    var body: some View {
        VStack {
            Text("Enter amount for \(paymentType):")
                .padding()

            TextField("Amount", text: $amountText)
                .keyboardType(.decimalPad)
                .padding()

            Button(action: {
                if let amount = Double(amountText) {
                    var updatedEntries = entries
                    updatedEntries.append(amount)
                    updateTotal(updatedEntries)
                    amountText = ""
                }
            }) {
                Text("Add Amount")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(8)
            }
            .padding()

            List {
                ForEach(entries, id: \.self) { entry in
                    HStack {
                        Text(String(format: "$%.2f", entry))
                        Spacer()
                        Button(action: {
                            if let index = entries.firstIndex(of: entry) {
                                var updatedEntries = entries
                                updatedEntries.remove(at: index)
                                updateTotal(updatedEntries)
                            }
                        }) {
                            Image(systemName: "trash")
                                .foregroundColor(.red)
                        }
                    }
                }
                .onDelete(perform: deleteEntry)
            }

            Spacer()
        }
        .navigationTitle(paymentType)
    }

    private func deleteEntry(at offsets: IndexSet) {
        var updatedEntries = entries
        updatedEntries.remove(atOffsets: offsets)
        updateTotal(updatedEntries)
    }
}

struct ContentView: View {
    var body: some View {
        NavigationView {
            NavigationLink(destination: PaymentView()) {
                VStack {
                    Image("homelogo")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200)
                        .padding()

                    Text("Welcome to Bank-eze!")
                        .fontWeight(.heavy)
                        .padding()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
