//
//  DeliciousClient.swift
//  Delicious-Swift
//
//  Created by Yusuke Ohashi on 3/12/15.
//  Copyright (c) 2015 Yusuke Ohashi. All rights reserved.
//

import UIKit

class DeliciousClient: NSObject {
    /// constants
    let delicious_endpoint : String = "https://api.del.icio.us/"
    let delicious_oauth_endpoint : String = "https://avosapi.delicious.com/api/v1/"

    /// variables
    var clientid : String = ""
    var clientsecret : String = ""
    
    class var sharedInstance: DeliciousClient {
        struct Static {
            static var onceToken : dispatch_once_t = 0
            static var instance : DeliciousClient? = nil
        }
        
        dispatch_once(&Static.onceToken) {
            Static.instance = DeliciousClient()
        }
        
        return Static.instance!
    }
   
    /**
    setup client
    
    :param: client_id     Delicious Client ID
    :param: client_secret Delicious Client Secret
    */
    class func setup(client_id: String, client_secret: String) {
        let cli = DeliciousClient.sharedInstance
        cli.clientid = client_id
        cli.clientsecret = client_secret
    }
    
    /**
    get Access Token
    
    :param: username Delicious Username
    :param: password Delicious Password
    */
    func getToken(username: String, password: String) {
        var request = NSMutableURLRequest(URL: NSURL(string: "http://www.google.com")!)
        httpGet(request){
            (data, error) -> Void in
            if error != nil {
                println(error)
            } else {
                println(data)
            }
        }
    }
    
    /**
    Get Request
    
    :param: request  request
    :param: callback callback
    */
    func httpGet(request: NSURLRequest!, callback: (String, String?) -> Void) {
        var session = NSURLSession.sharedSession()
        var task = session.dataTaskWithRequest(request){
            (data, response, error) -> Void in
            if error != nil {
                callback("", error.localizedDescription)
            } else {
                var result = NSString(data: data, encoding:
                    NSASCIIStringEncoding)!
                callback(result, nil)
            }
        }
        task.resume()
    }
    
    /**
    test
    */
    func sayHello() {
        println("hello")
    }
}
