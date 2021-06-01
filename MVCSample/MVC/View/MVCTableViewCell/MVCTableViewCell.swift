//
//  MVCTableViewCell.swift
//  MVCSumple
//
//  Created by Masato Takamura on 2021/05/29.
//

import UIKit

final class MVCTableViewCell: UITableViewCell {
    
    static var className: String {
        String(describing: MVCTableViewCell.self)
    }
    
    @IBOutlet private weak var userNameLabel: UILabel!
    @IBOutlet private weak var atNameLabel: UILabel!
    @IBOutlet private weak var userSwitch: UISwitch!
    
    ///セルが再利用されるときに呼ばれる初期化メソッド
    override func prepareForReuse() {
        super.prepareForReuse()
        userNameLabel.text = nil
        atNameLabel.text = nil
        userSwitch.isOn = false
    }
    
    ///モデルを受け取ってセルを更新する
    func configure(user: UserModel) {
        userNameLabel.text = user.name
        atNameLabel.text = user.atName
        userSwitch.isOn = user.isOn
    }
    
}
