//
//  API.swift
//  MVCSumple
//
//  Created by Masato Takamura on 2021/05/29.
//

import Foundation

//エラー定義
enum APIError: Error {
    case error
}

final class API {
  static let shared = API()
  private init() { }

  //userデータを取得する
  func getUsers(completion: ((Result<[UserModel], APIError>) -> Void)? = nil) {
    //仮想API通信
    //本来はサーバーから取得するが、、
    //ここではサンプルとしてsampeDataを0.3sec後に受け取っている
    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
        guard
            let data = API.sampleData.data(using: .utf8),
            //Codable(Decodable)に準拠したモデルはjson文字列から自動で変わる
            let users = try? JSONDecoder().decode([UserModel].self, from: data)
        else {
            completion?(.failure(.error))
            return
        }
        completion?(.success(users))
    }
  }
    
    //サーバーからこんな感じでデータが返ってくると想定する
    private static var sampleData: String {
        let json =
            """
[
    {
        "name": "tanaka",
        "at_name": "@tanaka",
        "switch": false
    },
    {
        "name": "suzuki",
        "at_name": "@suzuki",
        "switch": true
    },
    {
        "name": "yoshida",
        "at_name": "@yoshida",
        "switch": true
    },
    {
        "name": "tanaka",
        "at_name": "@tanaka",
        "switch": false
    },
    {
        "name": "suzuki",
        "at_name": "@suzuki",
        "switch": true
    },
    {
        "name": "yoshida",
        "at_name": "@yoshida",
        "switch": true
    },
    {
        "name": "tanaka",
        "at_name": "@tanaka",
        "switch": false
    },
    {
        "name": "suzuki",
        "at_name": "@suzuki",
        "switch": true
    },
    {
        "name": "yoshida",
        "at_name": "@yoshida",
        "switch": true
    },
    {
        "name": "tanaka",
        "at_name": "@tanaka",
        "switch": false
    },
    {
        "name": "suzuki",
        "at_name": "@suzuki",
        "switch": true
    },
    {
        "name": "yoshida",
        "at_name": "@yoshida",
        "switch": true
    },
    {
        "name": "tanaka",
        "at_name": "@tanaka",
        "switch": false
    },
    {
        "name": "suzuki",
        "at_name": "@suzuki",
        "switch": true
    },
    {
        "name": "yoshida",
        "at_name": "@yoshida",
        "switch": true
    },
    {
        "name": "tanaka",
        "at_name": "@tanaka",
        "switch": false
    },
    {
        "name": "suzuki",
        "at_name": "@suzuki",
        "switch": true
    },
    {
        "name": "yoshida",
        "at_name": "@yoshida",
        "switch": true
    },
    {
        "name": "tanaka",
        "at_name": "@tanaka",
        "switch": false
    },
    {
        "name": "suzuki",
        "at_name": "@suzuki",
        "switch": true
    },
    {
        "name": "yoshida",
        "at_name": "@yoshida",
        "switch": true
    }
]
"""
    return json
  }
}

