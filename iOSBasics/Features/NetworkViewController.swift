//
//  NetworkViewController.swift
//  iOSBasics
//
//  Created by kyoung hee park on 15/11/2018.
//  Copyright © 2018 MayPark. All rights reserved.
//

// Alamofire
// https://github.com/Alamofire/Alamofire
// https://outofbedlam.github.io/swift/2016/02/04/Alamofire/
// - chainable request and response
// - JSON parameter
// - Response serialization
// - Athentication



// ATS
// - http://gogorchg.tistory.com/entry/iOS-Alamofire

// NSURLConnection ==> NSSession
// https://stackoverflow.com/questions/24016142/how-to-make-an-http-request-in-swift

// JSON parsing 
// Codable - Swift standard library. from 4.0
// https://developer.apple.com/documentation/foundation/archives_and_serialization/encoding_and_decoding_custom_types
// http://minsone.github.io/programming/swift-codable-and-exceptions-extension


import Foundation
import UIKit
import Alamofire
import CocoaLumberjack


// Sample JSON Struct - Codable protocol (Encodable, Decodable)
struct SampleJson: Codable {
    var a: String
    var b: String
}

struct SampleJson2: Codable {
    var a: String?
    var y: String?
    
    enum CodingKeys: String, CodingKey {
        case a, y = "b" // using coding key
    }
    
    // define custom decoder, allow optional variable
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        a = try values.decodeIfPresent(String.self, forKey: .a)
        y = try values.decodeIfPresent(String.self, forKey: .y)
    }
}


class NetworkViewController : UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        performHttpRequestUsingNSURLConnection()
        
        performSimpleHttpRequestUsingAlamofire()
        performSimpleHttpRequestUsingURLSession()
        
        
        performJSONDecodeUsingCodableStruct()
        performJSONDecodeUsingCodableStruct2()
    }
    
    // MARK: - http request
    // NSURLConnection.sendAsynchronousRequest deprecated in iOS 9
    func performHttpRequestUsingNSURLConnection(){
        let url = URL(string: "http://www.stackoverflow.com")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        NSURLConnection.sendAsynchronousRequest(request, queue: OperationQueue.main) {(response, data, error) in
            guard let data = data else { return }
            print(String(data: data, encoding: .utf8)!)
        }
    }
    
    func performSimpleHttpRequestUsingURLSession(){
        
        let url = URL(string: "https://api.myjson.com/bins/vi56v")
        let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            
            guard error == nil else {
                DDLogError("returned error")
                return
            }
            
            guard let content = data else {
                DDLogWarn("No data")
                return
            }
            
            guard let json = (try? JSONSerialization.jsonObject(with: content, options: JSONSerialization.ReadingOptions.mutableContainers)) as? [String:Any] else {
                DDLogError("Not containing JSON")
                return
            }
            
            var tableArray = [String]()
            if let array = json["companies"] as? [String] {
                tableArray = array
            }
            
            DDLogDebug("*** performSimpleHttpRequestUsingURLSession : \(tableArray)")
            
            DispatchQueue.main.async {
                DDLogDebug("Refresh UI on main queue!")
            }
        }
        task.resume()
    }
    
    func performSimpleHttpRequestUsingAlamofire(){
        
        Alamofire.request("https://httpbin.org/get")
            .responseJSON { (response) in
                
                print(response.request ?? "request is nil")
                print(response.response ?? "response is nil")
                print(response.data ?? "data is nil")
                print(response.result)
                
                if let jsonData = response.result.value {
                    print("JSON: \(jsonData)")
                }
                
        }
        // ref. responseJSON, responseString, responseData
    }
    
    
    
 
    // MARK: - JSON Codable
    func performJSONDecodeUsingCodableStruct(){
        let sample1Data = """
            {
                "a": "aa",
                "b": "bb"
            }
            """.data(using: .utf8)!
        
        let decode = try! JSONDecoder().decode(SampleJson.self, from: sample1Data)
        DDLogDebug("*** JSON Decode1  = \(decode)")
    }
    
    func performJSONDecodeUsingCodableStruct2(){
        let sample1Data = """
            {
                "a": "aa",
                "b": null
            }
            """.data(using: .utf8)!
        
        let decode = try! JSONDecoder().decode(SampleJson2.self, from: sample1Data)
        DDLogDebug("*** JSON Decode2  = \(decode)")
    }
}



