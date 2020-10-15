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
        
        view.addSubview(infoStackContainer)
        
        view.addSubview(infoStack)
        NSLayoutConstraint.activate([
            infoStackContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            infoStackContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            infoStackContainer.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            
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
        idRow.titleLabel.text = "ID"
        idRow.valueLabel.text = "\(factory.id)"
        
        let nameRow = DetailsDataRow()
        nameRow.titleLabel.text = "Name"
        nameRow.valueLabel.text = factory.name
        
        let divisionRow = DetailsDataRow()
        divisionRow.titleLabel.text = "Division"
        divisionRow.valueLabel.text = factory.division
        
        let addressRow = DetailsDataRow()
        addressRow.titleLabel.text = "Address"
        addressRow.valueLabel.text = factory.address
        
        let countryRow = DetailsDataRow()
        countryRow.titleLabel.text = "Country"
        countryRow.valueLabel.text = factory.country
        
        [idRow, nameRow, divisionRow, addressRow, countryRow].forEach { row in
            infoStack.addArrangedSubview(row)
        }
    }
    
}
