import BGUtils
import BudgetGuyUI
import SnapKit
import UIKit

class TransactionListViewController: BGViewController {
    lazy var listView = ListView(appearance: .plain) { configuration in
        configuration.showsSeparators = false
    }

    var configuration = Configuration() {
        didSet {
            applyConfiguration()
        }
    }

    private let presenter: TransactionListPresenter
    private let interactor: TransactionListInteractor

    private lazy var dataSource = makeDataSource()

    init(
        presenter: TransactionListPresenter,
        interactor: TransactionListInteractor
    ) {
        self.presenter = presenter
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Life Cycles
    override func viewDidLoad() {
        super.viewDidLoad()

        presenter.delegate = self
        presenter.viewLoaded()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        applyConfiguration()
    }

    // MARK: - Setups
    override func setupViews() {
        sceneColor = .systemBackground

        let addBarButton = makeAddBarButton()
        navigationItem.setRightBarButtonItems([addBarButton], animated: false)
    }

    override func setupHierarchy() {
        view.addSubview(listView)
    }

    override func setupConstraints() {
        listView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
}

// MARK: - TransactionListPresenterDelegate
extension TransactionListViewController: TransactionListPresenterDelegate {
    func presenter(_ presenter: TransactionListPresenter, didUpdate sections: [TransactionList.Section]) {
        var snapshot = NSDiffableDataSourceSnapshot<TransactionList.Section, TransactionList.Item>()
        snapshot.appendSections(sections)
        snapshot = sections.reduce(into: snapshot) { snapshot, section in
            snapshot.appendItems(section.items, toSection: section)
        }
        dataSource.apply(snapshot, animatingDifferences: true)
    }
}

extension TransactionListViewController {
    // MARK: - Configuration
    struct Configuration {
        var itemSpacing: CGFloat = LayoutConstants.compactSpacing
    }

    func applyConfiguration() {
        listView.itemSpacing = configuration.itemSpacing
    }

    // MARK: - 'Add' BarButtonItem
    private func makeAddBarButton() -> UIBarButtonItem {
        let item = UIBarButtonItem(
            image: SFSymbolImage.plus,
            style: .plain,
            target: self,
            action: #selector(didSelectAddBarButtonItem)
        )
        return item
    }

    @objc
    private func didSelectAddBarButtonItem() {
        interactor.requestNewTransaction()
    }
}

// MARK: - Data Source
private extension TransactionListViewController {
    typealias DataSource = UICollectionViewDiffableDataSource<TransactionList.Section, TransactionList.Item>

    func makeDataSource() -> DataSource {
        let payoutListCellRegistration = UICollectionView.CellRegistration<PayoutListCell, Payout>.init { cell, indexPath, payout in
            cell.populate(with: .init(payout: payout))
        }

        return .init(collectionView: listView) { collectionView, indexPath, itemIdentifier in
            switch itemIdentifier {
            case .payout(let payout):
                return collectionView.dequeueConfiguredReusableCell(using: payoutListCellRegistration, for: indexPath, item: payout)
            }
        }
    }
}

// MARK: - Fileprivate Extensions
private extension PayoutListCellModel {
    static var dateFormatter = BGDateFormatterFactory.verbose()

    convenience init(payout: Payout) {
        self.init(
            occurrenceDate: Self.dateFormatter.string(from: payout.occurrence),
            description: payout.description,
            amount: payout.amount.stringValue
        )
    }
}
