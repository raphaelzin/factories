//
//  DetailsViewController.swift
//  Factories
//
//  Created by Raphael Souza on 2020-10-14.
//

import UIKit

class DetailsViewController: UIViewController {
    
    // MARK: Attributes
    
    private let viewModel: DetailsViewModelType
    
    // MARK: Subviews
    
    private lazy var infoStackContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var infoStack: UIStackView = {
        let stv = UIStackView()
        stv.axis = .vertical
        stv.spacing = 8
        stv.translatesAutoresizingMaskIntoConstraints = false
        return stv
    }()
    
    private lazy var scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        return scroll
    }()
    
    // MARK: Lifecycle
    
    init(viewModel: DetailsViewModelType) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        
        configureLayout()
        configureInfoStack()
        configureNavBar()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        infoStackContainer.layer.shadowPath = UIBezierPath(roundedRect: infoStackContainer.bounds, cornerRadius: 12).cgPath
    }
    
}

private extension DetailsViewController {
    
    func configureLayout() {
        view.backgroundColor = .secondarySystemBackground
        
        infoStackContainer.layer.cornerRadius = 12
        infoStackContainer.backgroundColor = .systemBackground
        
        // Setup shadow
        infoStackContainer.layer.shadowColor = UIColor.black.withAlphaComponent(0.2).cgColor
        infoStackContainer.layer.shadowOpacity = 0.8
        infoStackContainer.layer.shadowRadius = 6
        infoStackContainer.layer.shadowOffset = .zero
        
        view.addSubview(scrollView)
        scrollView.addSubview(infoStackContainer)
        infoStackContainer.addSubview(infoStack)
        
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            scrollView.contentLayoutGuide.widthAnchor.constraint(equalTo: view.widthAnchor),

            infoStackContainer.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor, constant: 16),
            infoStackContainer.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor, constant: -16),
            infoStackContainer.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor, constant: 16),
            infoStackContainer.bottomAnchor.constraint(lessThanOrEqualTo: scrollView.contentLayoutGuide.bottomAnchor),
            
            infoStack.leadingAnchor.constraint(equalTo: infoStackContainer.leadingAnchor, constant: 16),
            infoStack.trailingAnchor.constraint(equalTo: infoStackContainer.trailingAnchor, constant: -16),
            infoStack.topAnchor.constraint(equalTo: infoStackContainer.topAnchor, constant: 16),
            infoStack.bottomAnchor.constraint(equalTo: infoStackContainer.bottomAnchor, constant: -16)
        ])
    }
    
    func configureNavBar() {
        navigationItem.title = viewModel.factory.name
    }
    
    func configureInfoStack() {
        let factory = viewModel.factory
        
        let idRow = DetailsDataRow()
        idRow.titleLabel.text = NSLocalizedString("id", comment: "ID title")
        idRow.valueLabel.text = "\(factory.id)"
        
        let nameRow = DetailsDataRow()
        nameRow.titleLabel.text = NSLocalizedString("name", comment: "Name title")
        nameRow.valueLabel.text = factory.name
        
        let divisionRow = DetailsDataRow()
        divisionRow.titleLabel.text = NSLocalizedString("division", comment: "Division title")
        divisionRow.valueLabel.text = factory.division
        
        let addressRow = DetailsDataRow()
        addressRow.titleLabel.text = NSLocalizedString("address", comment: "Address title")
        addressRow.valueLabel.text = factory.address
        
        let countryRow = DetailsDataRow()
        countryRow.titleLabel.text = NSLocalizedString("country", comment: "Country title")
        
        countryRow.valueLabel.text = [factory.country.asCountryName,
                                      factory.country.asCountryFlag]
            .compactMap { $0 }
            .joined(separator: " ")
        
        [idRow, nameRow, divisionRow, addressRow, countryRow].forEach { row in
            infoStack.addArrangedSubview(row)
        }
    }
    
}
