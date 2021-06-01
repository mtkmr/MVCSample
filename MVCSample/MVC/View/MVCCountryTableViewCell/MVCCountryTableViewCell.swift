//
//  MVCCountryTableViewCell.swift
//  MVCSample
//
//  Created by Masato Takamura on 2021/05/30.
//

import UIKit

final class MVCCountryTableViewCell: UITableViewCell {

    @IBOutlet private weak var countryImageView: UIImageView!
    @IBOutlet private weak var countryNameLabel: UILabel!
    @IBOutlet private weak var countryMoneyRatioLabel: UILabel!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        countryImageView.image = nil
        countryNameLabel.text = nil
        countryMoneyRatioLabel.text = nil
    }
    
    func configure(country: MVCCountryModel) {
        countryImageView.image = UIImage(named: country.imageName)
        countryNameLabel.text = country.name
        countryMoneyRatioLabel.text = country.moneyRatio.description
    }
    
}
