//
//  TransactionListViewModel.swift
//  BudgetGuy
//
//  Created by Charles Hsieh on 2022/7/16.
//

import BGUtils
import Foundation

public final class TransactionListViewModel: TransactionListPresenter, TransactionListInteractor {
    private static let dateHeaderDateFormatter = BGDateFormatterFactory.dateOnly()

    public weak var delegate: TransactionListPresenterDelegate?

    private let navigator: TransactionListNavigator

    public init(navigator: TransactionListNavigator) {
        self.navigator = navigator
    }

    // MARK: - Presenter
    public func viewLoaded() {
        #if DEBUG
        let sections = [Payout].testData.transactionListSection(dateFormatter: Self.dateHeaderDateFormatter)
        delegate?.presenter(self, didUpdate: sections)
        #endif
    }

    // MARK: - Interactor
    public func requestNewTransaction() {
        navigator.requestNewTransactionFlow()
    }
}

extension Array where Element == Payout {
    func transactionListSection(dateFormatter: DateFormatter) -> [TransactionList.Section] {
        let group = Dictionary(grouping: self) { payout -> DateComponents in
            let date = Calendar.autoupdatingCurrent.dateComponents([.day, .month, .year], from: payout.occurrence)
            return date
        }

        return group
            .sorted { lhs, rhs in
                guard let last1 = lhs.value.last,
                      let last2 = rhs.value.last
                else { return false }

                return last1.occurrence < last2.occurrence
            }
            .compactMap { dateComponents, payouts -> TransactionList.Section? in
                guard let latestPayout = payouts.last else {
                    return nil
                }
                return TransactionList.Section(
                    displayedText: dateFormatter.string(from: latestPayout.occurrence),
                    items: payouts.map(TransactionList.Item.payout)
                )
            }
    }

    static var testData: Self {
        [
            Payout(
                amount: 140,
                description: "Lunch box",
                dateNow: Date().advanced(by: -7 * Double.oneDay)
            ),
            Payout(
                amount: 120,
                description: "Supper",
                dateNow: Date().advanced(by: -7 * Double.oneDay)
            ),
            Payout(
                amount: 10000,
                description: "Buy ETH",
                dateNow: Date().advanced(by: -3 * Double.oneDay)
            ),
            Payout(
                amount: 2790,
                description: "PC mouse",
                dateNow: Date().advanced(by: -1 * Double.oneDay)
            ),
            Payout(
                amount: 35,
                description: "Black tea"
            ),
            Payout(
                amount: 95,
                description: "Bento for lunch"
            ),
            Payout(
                amount: 230,
                description: "Dinner"
            ),
        ]
    }
}
