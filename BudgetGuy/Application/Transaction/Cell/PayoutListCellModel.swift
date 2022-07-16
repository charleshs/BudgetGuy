import BGUtils
import Models

class PayoutListCellModel {
    let occurrenceDate: String
    let description: String
    let amount: String

    init(
        occurrenceDate: String,
        description: String,
        amount: String
    ) {
        self.occurrenceDate = occurrenceDate
        self.description = description
        self.amount = amount
    }
}

extension PayoutListCellModel {
    static var dateFormatter = BGDateFormatterFactory.detailed()

    convenience init(payout: Payout) {
        self.init(
            occurrenceDate: Self.dateFormatter.string(from: payout.occurrence),
            description: payout.description,
            amount: payout.amount.stringValue
        )
    }
}
