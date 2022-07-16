//
//  TransactionListViewModel.swift
//  BudgetGuy
//
//  Created by Charles Hsieh on 2022/7/16.
//

import Foundation

public final class TransactionListViewModel: TransactionListPresenter, TransactionListInteractor {
    public weak var delegate: TransactionListPresenterDelegate?

    private let navigator: TransactionListNavigator

    public init(navigator: TransactionListNavigator) {
        self.navigator = navigator
    }

    // MARK: - Presenter
    public func viewLoaded() {
        #if DEBUG
        delegate?.presenter(self, didUpdate: .testData)
        #endif
    }

    // MARK: - Interactor
    public func requestNewTransaction() {
        navigator.requestNewTransactionFlow()
    }
}

extension Array where Element == TransactionList.Section {
    static var testData: Self {
        [
            .init(items: [
                .payout(.init(amount: 35, description: "Black tea")),
                .payout(.init(amount: 95, description: "Bento for lunch")),
                .payout(.init(amount: 230, description: "Dinner")),
            ])
        ]
    }
}
