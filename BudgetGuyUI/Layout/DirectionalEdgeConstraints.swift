import UIKit

public struct DirectionalEdgeConstraints {
    public let top: NSLayoutConstraint
    public let leading: NSLayoutConstraint
    public let bottom: NSLayoutConstraint
    public let trailing: NSLayoutConstraint

    public var constraints: [NSLayoutConstraint] {
        return [top, leading, bottom, trailing]
    }

    public func update(by insets: NSDirectionalEdgeInsets) {
        top.constant = insets.top
        leading.constant = insets.leading
        bottom.constant = insets.bottom
        trailing.constant = insets.trailing
    }
}
