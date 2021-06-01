//
//  MVCTableViewController.swift
//  MVCSumple
//
//  Created by Masato Takamura on 2021/05/29.
//

import UIKit

final class MVCTableViewController: UIViewController {
    
//    MARK: - プロパティ
    //apiから取得したものを保存する
    private var users: [UserModel] = []
    
//    MARK: - UI部品
    @IBOutlet private weak var tableView: UITableView! {
        didSet {
            //storyboardから読み込んだ時点でセルの登録を済ませる
            let cellNib = UINib(nibName: MVCTableViewCell.className, bundle: nil)
            tableView.register(cellNib, forCellReuseIdentifier: MVCTableViewCell.className)
            //データを取得するまではtableViewを隠しておく
            tableView.isHidden = true
            //委任先をselfにしてインターフェースの中身を実装
            tableView.delegate = self
            tableView.dataSource = self
        }
    }
    
//    MARK: - ライフサイクル
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "MVC"
        //apiからユーザーデータを取得
        API.shared.getUsers { [weak self] (result) in
            //データを取得したらテーブルをリロードする
            switch result {
            case .failure(let error):
                print(error)
            case .success(let users):
                self?.users = users
                self?.tableView.reloadData()
                self?.tableView.isHidden = false
            }
            
        }
    }
}

//MARK: - privateメソッド
private extension MVCTableViewController {
    ///アラートを出すメソッド
    func showAlert(user: UserModel) {
        let alertVC = UIAlertController(title: "セルが選択されました", message: user.alertText, preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alertVC, animated: true, completion: nil)
    }
}

//MARK: - UITableViewDelegate
extension MVCTableViewController: UITableViewDelegate {
    ///セルをタップしたときの処理
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //apiから取得したデータのindexPath番目のインスタンスを取得
        let user = users[indexPath.row]
        showAlert(user: user)
    }
}

//MARK: - UITableViewDataSource
extension MVCTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: MVCTableViewCell.className, for: indexPath) as? MVCTableViewCell
        else {
            //想定外の強制終了エラー
            fatalError()
        }
        //apiから取得したデータのindexPath番目を取得
        let user = users[indexPath.row]
        //cellの更新メソッドに取得したuser情報を渡す
        cell.configure(user: user)
        
        return cell
    }
    
}
