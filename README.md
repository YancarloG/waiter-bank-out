My Story: My constant motivation is to identify ways to increase productivity and make things easier. 
One problem I frequently faced as a waiter studying computer science was settling sales and tips with the general teller at the conclusion of each shift. 
Because there was so much documentation involved, this process was frequently time-consuming and prone to mistakes.

I created the Bank-eze Payment Tracker software in order to solve this. 
My objective was to improve the efficiency and cleanliness of the reconciliation process by streamlining it. 
Additionally, as Swift was not included in my school curriculum, this project gave me a great opportunity to learn it on my own. 
My goal in undertaking this project was to improve my technical abilities as well as my other servers' daily tasks.

Product: Bank-eze Payment Tracker

Introduction
The Bank-eze Payment Tracker is a SwiftUI-based application designed to assist users in managing and tracking various forms of payments. This app supports input for multiple payment types, calculates the total for each, and allows users to view, edit, and delete individual transactions.

Features
Supports Multiple Payment Types: Visa, Mastercard, Discover, Amex, Disney Rewards, Guest ID, Gift Card, Dining Plan Adult, and Dining Plan Child.
Real-Time Calculation: Calculates and displays the total amount for each payment type.
Transaction Management: Allows users to add, view, edit, and delete individual transactions.
User-Friendly Interface: Simple navigation with an intuitive user interface.
Goals
User Input Handling: Enable users to select a payment type, input an amount, and update the total for that type.
Detailed Tracking: Maintain a list of all transactions, allowing for easy editing and deletion.
Real-Time Updates: Reflect changes in transaction totals across the application in real time.
Screenshots
Include screenshots here to give a visual overview of the app.

How to Use
Download and Install: Clone the repository and open the project in Xcode.
Run the App: Build and run the app on a simulator or device.
Navigate the App:
On the main screen, select a payment type.
Input an amount and add it to the total.
View all transactions for a selected payment type.
Edit or delete transactions as needed.
Code Overview
Main Components
ContentView.swift: The entry point of the app, welcoming users and navigating to the main PaymentView.
PaymentView.swift: Displays a list of payment types with their respective totals and navigates to detailed views.
PaymentDetail.swift: Allows for adding, viewing, editing, and deleting transactions for a specific payment type.
EditTransactionView.swift: Provides the interface to edit a specific transaction.

Sample Code
{
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
            }
            .navigationTitle("Bank-eze Payments")
        }
    }
}
Enhanced Features
Edit and Delete Transactions: Implemented in PaymentDetail.swift and EditTransactionView.swift, allowing users to maintain accurate records by modifying or removing entries.
Future Enhancements
Data Persistence: Implement data persistence to save transactions between app sessions.
Multi-User Support: Allow multiple users to track their payments separately.
Advanced Analytics: Provide insights and summaries based on the recorded transactions.
Voice to text and photo to text for even faster data gathering.
Contribution
If you have suggestions or find any issues, feel free to open an issue or submit a pull request. Contributions are always welcome!

License
This project is licensed under the MIT License - see the LICENSE file for details.

Contact
For any questions or feedback, please contact me at yancarlog@live.com

