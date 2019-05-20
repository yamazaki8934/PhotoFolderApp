//
//  StockStars.swift
//  PhotoFolderApp
//
//  Created by 山崎浩毅 on 2019/05/18.
//  Copyright © 2019 山崎浩毅. All rights reserved.
//

import UIKit
import Alamofire


class StockStars: NSObject {
    
    // 保存ボタンが押されたときに呼ばれるメソッドを定義
    class func postStar(person: Person) {
        
        let params: [String: String] = [
            "name": person.name
        ]
        
        // HTTP通信
        Alamofire.request("https://0acae4f9.ngrok.io/api/v1/stars",
                          method: .post,
                          parameters: params,
                          encoding: JSONEncoding.default)
            .responseJSON { response in
            
            print("=============response============")
            print(response)
        }
        
    }
    
    class func getStars() {
        Alamofire.request("https://0acae4f9.ngrok.io/api/v1/stars",
                          method: .get)
            .responseJSON { response in
                
        }
    }
}

//let url = URL(string: "https://8cbe7f88.ngrok.io/api/v1/stars")
//var request = URLRequest(url: url!)
//request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
//request.httpMethod = "POST"
//let parameters: [String: Any] = [
//    "name": name
//]
//request.httpBody = parameters.percentEscaped().data(using: .utf8)
//
//let task = URLSession.shared.dataTask(with: request) { data, response, error in
//    guard let data = data,
//        let response = response as? HTTPURLResponse,
//        error == nil else {                                              // check for fundamental networking error
//            print("error", error ?? "Unknown error")
//            return
//    }
//
//    guard (200 ... 299) ~= response.statusCode else {                    // check for http errors
//        print("statusCode should be 2xx, but is \(response.statusCode)")
//        print("response = \(response)")
//        return
//    }
//
//    let responseString = String(data: data, encoding: .utf8)
//    print("responseString = \(responseString)")
//}
//
//task.resume()
