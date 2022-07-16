import UIKit

open class BGViewController: UIViewController {
    public var sceneColor: UIColor? {
        get {
            view.backgroundColor
        }
        set {
            view.backgroundColor = newValue
        }
    }

    open override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupHierarchy()
        setupConstraints()
    }

    open func setupViews() {}
    open func setupHierarchy() {}
    open func setupConstraints() {}
}
