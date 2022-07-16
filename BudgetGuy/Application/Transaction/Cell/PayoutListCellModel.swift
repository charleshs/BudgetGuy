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
