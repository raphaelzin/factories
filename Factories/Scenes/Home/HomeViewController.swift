//
//  HomeViewController.swift
//  Factories
//
//  Created by Raphael Souza on 2020-10-10.
//

import UIKit

protocol HomeViewControllerCoordinatorDelegate: class {
    func didSelect(_ factory: Factory)
}

class HomeViewController: UIViewController {

    // MARK: Attibutes
    
    private let viewModel: HomeViewModelType
    
    weak var coordinatorDelegate: HomeViewControllerCoordinatorDelegate?
    
    // MARK: Subviews
    
    private lazy var tableView: UITableView = {
        let tv = UITableView(frame: .zero, style: .plain)
        tv.register(UITableViewCell.self, forCellReuseIdentifier: "factory-cell")
        tv.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 24, right: 0)
        tv.translatesAutoresizingMaskIntoConstraints = false
        
        tv.delegate = self
        tv.dataSource = self
        return tv
    }()
    
    // MARK: Lifecycle
    
    init(viewModel: HomeViewModelType = HomeViewModel()) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        
        viewModel.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureNavgationBar()
        configureLayout()
        viewModel.fetchPage()
    }

}

// MARK: View Configuration

private extension HomeViewController {
    
    func configureNavgationBar() {
        navigationItem.title = NSLocalizedString("factories", comment: "Home title")
    }
    
    func configureLayout() {
        view.addSubview(tableView)
        
        // Usually I would use SnapKit, but for such simple UI,
        // there's no need for extra dependencies
        NSLayoutConstraint.activate([
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor)
        ])
    }
    
}

// MARK: TableView Management

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.factories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "factory-cell")
        let factory = viewModel.factories[indexPath.row]
        
        // Due to how simple this cell is, I'll just use the default one and
        // set its fields from this method. On more complex cells, it's better
        // to create a method in the cell so it configures itself.
        cell.textLabel?.text = factory.name
        cell.detailTextLabel?.text = factory.division
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let factory = viewModel.factories[indexPath.row]
        coordinatorDelegate?.didSelect(factory)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row >= viewModel.factories.count - 3 && !viewModel.hasReachedEnd {
            viewModel.fetchPage()
        }
    }
    
}

// MARK: ViewModel delegate conformance

extension HomeViewController: HomeViewModelDelegate {
    
    func didFetchFactories() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func didFailedFetchingFactories(with error: Error) {
        print(error.localizedDescription)
    }
    
}
