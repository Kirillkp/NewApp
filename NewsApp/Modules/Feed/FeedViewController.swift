import UIKit

final class FeedViewController: UIViewController {
    
    private let output: FeedViewOutput
    private let collectionView: UICollectionView
    private let refreshControl = UIRefreshControl()

    private var viewModels = [FeedCardViewModel]()

    init(output: FeedViewOutput) {
        self.output = output
        let collectionViewLayout = UICollectionViewFlowLayout()
        self.collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        super.loadView()

        self.addSubviews()
        self.setupCollectionView()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        self.addFrame()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.addTarget()
        self.output.viewDidLoad()
        self.navigationItem.rightBarButtonItem = BlockBarButtonItem.item(title: Localization.loginButton,
                                                                         style: .plain,
                                                                         handler: { [weak self] in
            self?.output.onLoginTap()
        })
    }
}

extension FeedViewController: FeedViewInput {
    
    func set(viewModels: [FeedCardViewModel]) {
        self.viewModels = viewModels
        self.collectionView.reloadData()
    }
}

extension FeedViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.viewModels.count
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let viewModel = self.viewModels[indexPath.item]
        let cell = collectionView.dequeueCell(cellType: FeedViewCell<FeedCardView>.self, for: indexPath)
        cell.containerView.update(with: viewModel)
        return cell
    }
}

extension FeedViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let ratio: CGFloat = 1.2
        let width = collectionView.frame.width - collectionView.contentInset.left - collectionView.contentInset.right
        let height = width * ratio
        return CGSize(width: width, height: height)
    }

    func collectionView(_ collectionView: UICollectionView,
                        willDisplay cell: UICollectionViewCell,
                        forItemAt indexPath: IndexPath) {
        self.output.willDisplay(at: indexPath.item)
        
    }
}

private extension FeedViewController {
    
    func addSubviews() {
        view.addSubview(self.collectionView)
    }
    
    func addFrame() {
        self.collectionView.frame = self.view.bounds
    }
    
    func setupCollectionView() {
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.register(FeedViewCell<FeedCardView>.self)
        self.collectionView.refreshControl = refreshControl
        self.collectionView.backgroundColor = .white
        self.collectionView.contentInset = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
    }
    
    func addTarget() {
        refreshControl.addTarget(self, action: #selector(refreshCollectionView), for: .valueChanged)
    }
    
    @objc
    func refreshCollectionView(_ sender: UIRefreshControl) {
        self.output.viewDidLoad()
        self.collectionView.reloadData()
        sender.endRefreshing()
    }
}
