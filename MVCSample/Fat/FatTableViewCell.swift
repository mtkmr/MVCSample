//
//  FatTableViewCell.swift
//  MVCSumple
//
//  Created by Masato Takamura on 2021/05/29.
//

import UIKit

final class FatTableViewCell: UITableViewCell {
    //* セルの中のviewがカプセル化されていない
    //* 外部から好きなように書き換えられることになる
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var atNameLabel: UILabel!
    @IBOutlet weak var userSwitch: UISwitch!
    
    
    //セルの再利用時に呼ばれる初期化メソッド
    override func prepareForReuse() {
        super.prepareForReuse()
        userNameLabel.text = nil
        atNameLabel.text = nil
        userSwitch.isOn = false
    }
}

