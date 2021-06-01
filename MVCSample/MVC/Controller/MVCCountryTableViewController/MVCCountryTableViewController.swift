//
//  MVCCountryTableViewController.swift
//  MVCSample
//
//  Created by Masato Takamura on 2021/05/30.
//

import UIKit

class MVCCountryTableViewController: UIViewController {
    
//    MARK: - プロパティ
    //"MVCCountryTableViewCell"と同じ
    private let cellNibName = String(describing: MVCCountryTableViewCell.self)
    private let cellId = String(describing: MVCCountryTableViewCell.self)
    
    //MVCCountryModelはCaseIterableに準拠しているため、allCasesパラメータで全てのcaseの配列を取得できる。例えば今回は[.america, .japan, .china, .france]
    private var countries: [MVCCountryModel] = MVCCountryModel.allCases
    
//    MARK: - UI部品
    @IBOutlet private weak var tableView: UITableView! {
        didSet {
            let cellNib = UINib(nibName: cellNibName, bundle: nil)
            tableView.register(cellNib, forCellReuseIdentifier: cellId)
            
            tableView.delegate = self
            tableView.dataSource = self
        }
    }
    
//    MARK: - ライフサイクル
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "MVCCountryTable"
        
        tableView.reloadData()
    }

}

//MARK: - UITableViewDelegate
extension MVCCountryTableViewController: UITableViewDelegate {
    
}

//MARK: - UITableViewDataSource
extension MVCCountryTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as? MVCCountryTableViewCell
        else {
            return UITableViewCell()
        }
        
        let country = countries[indexPath.row]
        //セルの表示更新メソッドにモデルのインスタンスを渡す
        cell.configure(country: country)
        
        return cell
    }
    
    
}
