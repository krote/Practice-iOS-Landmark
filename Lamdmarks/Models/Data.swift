//
//  Data.swift
//  Lamdmarks
//
//  Created by icdadmin on 2023/07/25.
//

import Foundation
import UIKit
import SwiftUI
import CoreLocation

let landmarkData: [Landmark] = load("landmarkData.json")
let hikeData: [Hike] = load("hikeData.json")

var featuresData: [Landmark] {
    landmarkData.filter{ $0.isFeatured }
}

var categoriesData: [String: [Landmark]]{
    Dictionary(
        grouping: landmarkData,     // landmarkに対して
        by: { $0.category.rawValue }    // 列挙型（enum）のカテゴリのrawValue（実際の値）を使ってグループ化
    )
}

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    print(filename)
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else{
        fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do{
        // urlからDataオブジェクトに変換
        data = try Data(contentsOf: file)
    }catch{
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    do{
        // さらにJSONデータからの変換を試みる
        let decoder = JSONDecoder()
        // 成功すれば、ジェネリクスとして受け取ったDecodableなクラス・構造体<T>をデコードして返す
        // ここではT＝Landmarkになる
        return try decoder.decode(T.self, from:data)
    }catch{
        fatalError("Couldn't parse \(filename) as \(T.self): \n\(error)")
    }
}

final class ImageStore{
    // Key:String, Value: CGImageとなるような辞書型を定義
    typealias _ImageDictionary = [String: CGImage]
    // 空配列として初期化
    fileprivate var images: _ImageDictionary = [:]
    
    fileprivate static var scale = 2
    
    static var shared = ImageStore()
    
    func image(name: String) -> Image{
        let index = _guaranteeImage(name: name)
        
        return Image(images.values[index], scale: CGFloat(ImageStore.scale), label: Text(name))
        
    }
    
    static func loadImage(name: String) -> CGImage {
        guard
            // 設定からURLを読み込み
            let url = Bundle.main.url(forResource: name, withExtension: "jpg"),
            // URLからImageSourceを生成
            let imageSource = CGImageSourceCreateWithURL(url as NSURL, nil),
            let image = CGImageSourceCreateImageAtIndex(imageSource, 0, nil)
        else{
            fatalError("Couldn't load image \(name).jpg from main bundle")
        }
        return image
    }
    
    fileprivate func _guaranteeImage(name: String) -> _ImageDictionary.Index {
        // 辞書に登録済画像であればインデックスを返す
        if let index = images.index(forKey: name) { return index }
        // 未登録であれば、追加してそのインデックスを返す
        images[name] = ImageStore.loadImage(name: name)
        return images.index(forKey: name)!
    }
}


