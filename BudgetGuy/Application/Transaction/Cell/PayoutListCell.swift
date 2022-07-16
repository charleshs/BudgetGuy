import BudgetGuyUI
import SnapKit
import UIKit

extension PayoutListCell {
    private enum Constants {
        static let edgeInsets = NSDirectionalEdgeInsets(top: 12, leading: 16, bottom: 12, trailing: 16)
    }
}

final class PayoutListCell: ListCell, ModelPopulated {
    private let occurrenceDateLabel = UILabel()
    private let descriptionLabel = UILabel()
    private let amountLabel = UILabel()

    private let contentStackView = UIStackView()
    private let leadingLabelStackView = UIStackView()

    override func configure() {
        contentView.backgroundColor = .systemGray6

        contentStackView.axis = .horizontal
        contentStackView.alignment = .bottom
        contentStackView.distribution = .fill
        contentStackView.spacing = LayoutConstants.cozySpacing

        leadingLabelStackView.axis = .vertical
        leadingLabelStackView.alignment = .leading
        leadingLabelStackView.distribution = .fill
        leadingLabelStackView.spacing = LayoutConstants.compactSpacing

        occurrenceDateLabel.font = .preferredFont(forTextStyle: .caption2)
        descriptionLabel.font = .preferredFont(forTextStyle: .headline)
        amountLabel.font = .preferredFont(forTextStyle: .largeTitle)

        [occurrenceDateLabel, descriptionLabel, amountLabel].forEach {
            $0?.textColor = .label
        }

        contentView.addSubview(contentStackView)

        [leadingLabelStackView, amountLabel].forEach {
            contentStackView.addArrangedSubview($0)
        }

        [occurrenceDateLabel, descriptionLabel].forEach { label in
            leadingLabelStackView.addArrangedSubview(label)
        }

        contentStackView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(Constants.edgeInsets)
        }
    }

    func populate(with model: PayoutListCellModel) {
        occurrenceDateLabel.text = model.occurrenceDate
        descriptionLabel.text = model.description
        amountLabel.text = model.amount
    }
}
