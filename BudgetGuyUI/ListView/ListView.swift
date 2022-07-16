import UIKit

open class ListView: UICollectionView {
    public var itemSpacing: CGFloat = .zero {
        didSet {
            collectionViewLayout.invalidateLayout()
        }
    }

    public init(
        appearance: UICollectionLayoutListConfiguration.Appearance,
        alterConfiguration: ((inout UICollectionLayoutListConfiguration) -> Void)? = nil
    ) {
        var configuration = UICollectionLayoutListConfiguration(appearance: appearance)
        configuration.backgroundColor = .clear
        alterConfiguration?(&configuration)

        super.init(frame: .zero, collectionViewLayout: UICollectionViewLayout())

        collectionViewLayout = UICollectionViewCompositionalLayout { [weak self] _, layoutEnvironment in
            let section = NSCollectionLayoutSection.list(using: configuration, layoutEnvironment: layoutEnvironment)
            section.interGroupSpacing = self?.itemSpacing ?? .zero

            return section
        }
    }

    @available(*, unavailable)
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
