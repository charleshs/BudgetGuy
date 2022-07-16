import UIKit

open class ListCell: UICollectionViewCell {
    public override init(frame: CGRect) {
        super.init(frame: frame)
        sharedInit()
    }

    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        sharedInit()
    }

    private func sharedInit() {
        backgroundColor = .clear
        contentView.backgroundColor = .clear

        configure()
    }

    open func configure() {}
}
