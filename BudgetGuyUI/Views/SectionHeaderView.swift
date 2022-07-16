import UIKit

open class SectionHeaderView<Body: UIView>: UICollectionReusableView {
    public let body: Body

    public private(set) lazy var directionalEdgeConstraints = DirectionalEdgeConstraints(
        top: body.topAnchor.constraint(equalTo: topAnchor),
        leading: body.leadingAnchor.constraint(equalTo: leadingAnchor),
        bottom: trailingAnchor.constraint(equalTo: body.trailingAnchor),
        trailing: bottomAnchor.constraint(equalTo: body.bottomAnchor)
    )

    public override init(frame: CGRect) {
        self.body = Body.init(frame: .zero)
        super.init(frame: frame)
        sharedInit()
    }

    public required init?(coder: NSCoder) {
        self.body = Body.init(frame: .zero)
        super.init(coder: coder)
        sharedInit()
    }

    private func sharedInit() {
        body.translatesAutoresizingMaskIntoConstraints = false

        addSubview(body)
        NSLayoutConstraint.activate(directionalEdgeConstraints.constraints)

        configure()
    }

    open func configure() {}
}
