import BudgetGuyUI
import UIKit

final class DateGroupHeaderView: SectionHeaderView<UILabel> {
    var label: UILabel { body }

    override func configure() {
        let insets = NSDirectionalEdgeInsets(top: 12, leading: 16, bottom: 12, trailing: 16)
        directionalEdgeConstraints.update(by: insets)

        label.textColor = .label
        label.font = .preferredFont(forTextStyle: .title1)
    }
}
