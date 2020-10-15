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
    
    private lazy var infoStack: UIStackView = {
        let stv = UIStackView()
        stv.axis = .vertical
        stv.translatesAutoresizingMaskIntoConstraints = false
        return stv
    }()
    
    // MARK: Lifecycle
    
    init(viewModel: DetailsViewModelType) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

private extension DetailsViewController {
    
    func configureLayout() {
        view.backgroundColor = .secondarySystemBackground
        
        infoStack.layer.cornerRadius = 6
        infoStack.backgroundColor = .systemBackground
        
        view.addSubview(infoStack)
        NSLayoutConstraint.activate([
            infoStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            infoStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            infoStack.topAnchor.constraint(equalTo: view.topAnchor, constant: 16),
        ])
    }
    
    func configureStack(with factory: Factory) {
        let idRow = DetailsDataRow()
        idRow.titleLabel.text = "ID"
        idRow.titleLabel.text = "\(factory.id)"
        
        let nameRow = DetailsDataRow()
        nameRow.titleLabel.text = "Name"
        nameRow.titleLabel.text = factory.name
        
        let divisionRow = DetailsDataRow()
        divisionRow.titleLabel.text = "Division"
        divisionRow.titleLabel.text = factory.division
        
        let addressRow = DetailsDataRow()
        addressRow.titleLabel.text = "Address"
        addressRow.titleLabel.text = factory.address
        
        let countryRow = DetailsDataRow()
        countryRow.titleLabel.text = "Country"
        countryRow.titleLabel.text = factory.country
        
        [idRow, nameRow, divisionRow, addressRow, countryRow].forEach { row in
            infoStack.addArrangedSubview(row)
        }
    }
    
}
