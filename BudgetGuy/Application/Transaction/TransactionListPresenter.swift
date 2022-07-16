import Foundation

public protocol TransactionListPresenterDelegate: AnyObject {
    func presenter(_ presenter: TransactionListPresenter, didUpdate sections: [TransactionList.Section])
}

public protocol TransactionListPresenter: AnyObject {
    var delegate: TransactionListPresenterDelegate? { get set }

    func viewLoaded()
}

public enum TransactionList {
    public struct Section: Hashable {
        public var items: [Item]
    }

    public enum Item: Hashable {
        case payout(Payout)
    }
}
