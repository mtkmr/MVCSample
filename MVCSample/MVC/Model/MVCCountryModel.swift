//
//  MVCCountryModel.swift
//  MVCSample
//
//  Created by Masato Takamura on 2021/05/30.
//

import Foundation

//数が分かりきっている場合はenumでmodelを作るのが良さげ
//CaseIteratableを継承すると全パターンの入った配列を生成するパラメータがつく
enum MVCCountryModel: CaseIterable {
  case america
  case japan
  case china
  case france

  var name: String {
    switch self {
    case .america:
      return "アメリカ"
    case .japan:
      return "日本"
    case .china:
      return "中国"
    case .france:
      return "フランス"
    }
  }

  var imageName: String {
    switch self {
    case .america:
      return "america"
    case .japan:
      return "japan"
    case .china:
      return "china"
    case .france:
      return "france"
    }
  }

  var moneyRatio: Double {
    switch self {
    case .america:
      return 0.01
    case .japan:
      return 1
    case .china:
      return 0.5
    case .france:
      return 0.2
    }
  }
}

