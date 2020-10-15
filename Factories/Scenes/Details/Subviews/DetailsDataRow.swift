//
//  DetailsDataRow.swift
//  Factories
//
//  Created by Raphael Souza on 2020-10-14.
//

import UIKit

class DetailsDataRow: UIStackView {
    
    // MARK: Subviews
    
    lazy var titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .secondaryLabel
        lbl.font = .boldSystemFont(ofSize: 12)
        return lbl
    }()
    
    lazy var valueLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .label
        lbl.font = .systemFont(ofSize: 17)
        return lbl
    }()
    
    // MARK: Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        configureLayout()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: Configuration methods

private extension DetailsDataRow {
    
    func configureLayout() {
        axis = .vertical
        spacing = 2
        
        addArrangedSubview(titleLabel)
        addArrangedSubview(valueLabel)
    }
    
}
