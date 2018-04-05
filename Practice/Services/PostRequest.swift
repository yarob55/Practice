//
//  PostRequest.swift
//  Practice
//
//  Created by يعرب المصطفى on 3/30/18.
//  Copyright © 2018 yarob. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class PostRequest
{
    let baseUrl = "https://jsonplaceholder.typicode.com"
    let postsUrl = "/posts"
    
    
    //the best code for the request : 
    func request(url : String, callback : @escaping (_ post:[Post])->Void)
    {
        let url = URL(string:url)
        Alamofire.request(url!).responseJSON { (response) in
            switch response.result
            {
            case .success(let val):
                let json = JSON(val)
                let data = json["data"]
                print(data," is the data :)")
                var posts = [Post]()
                for row in json
                {
                    var post = Post()
                    let title = row.1["title"].stringValue
                    post.title = title
                    posts.append(post)
                }
                callback(posts)
                
            case .failure(let error):
                print(error)
            }
        }
    }
    
    
    func requestWithErrorHandling(url : String)
    {
        //in alamofire success means almost nothing without using validate function before the response and that's because .success will occur when the connection works fine with the server even if the server returns 400 code
        let url = URL(string:url)
        Alamofire.request(url!)
            .validate(statusCode: 200..<300)//should be only 201 for post requests, because the server returns 200 sometimes when the object is already exist so it won't post a new one
            .responseJSON { (response) in
                switch response.result
                {
                case .success:
                    print("succes!!")
                case .failure(let e):
                    print("failed :(")
                    
                }
                if let result = response.data
                {
                    print(result)
                    
//                    do
//                    {
//                        self.posts = try JSONDecoder().decode([Post].self,from:result)
//                        for post in self.posts
//                        {
//                            print(post.title,":",post.body,":",post.id,":",post.userId)
//                        }
//                    }catch
//                    {
//
//                    }
                }else{
                    print("error occured")
                }
        }
    }
    
    func post(url : String, params : [String:String])
    {
        let url = URL(string:url)
        Alamofire.request(url!, method: HTTPMethod.post, parameters: params,encoding:JSONEncoding.default).responseJSON
            {
                (response) in
                switch response.result
                {
                case .success(let s):
                    print("succes with : ",s)
                case .failure(let e):
                    print("failed :( with ", e)
                    
                }
                
                if let data = response.data
                {
                    print("the data is " , data)
                }else{
                    print("there is no data ")
                }
        }
    }
    
    
    //if you want to use headers in the request :
    func postInWithHeaders(url : String, params : [String:String])
    {
        //the header :
        let headers = ["Content-type":"application/json"]
        
        
        let url = URL(string:url)
        Alamofire.request(url!, method: HTTPMethod.post, parameters: params,encoding:JSONEncoding.default,headers:headers).responseJSON
            {
                (response) in
                switch response.result
                {
                case .success(let s):
                    print("succes with : ",s)
                case .failure(let e):
                    print("failed :( with ", e)
                    
                }
                
                if let data = response.data
                {
                    print("the data is " , data)
                }else{
                    print("there is no data ")
                }
        }
    }
    
    func authRequest(url : String)
    {
        var headers : HTTPHeaders = ["Content-type" : "application/json"]
        let user = "user"
        let password = "12345"
        
        if let authorizationHeader = Request.authorizationHeader(user: user, password: password)
        {
            headers[authorizationHeader.key] = authorizationHeader.value
        }
        
        let url = URL(string:url)
        Alamofire.request(url!,headers:headers).validate().responseJSON { (response) in
            switch response.result
            {
            case .success:
                print("ok")
            case .failure(let e):
                print("failure with",e)
                
            }
        }
        
        //some times you can use Alamofire.authenticate() method but it doesn't alway work
    }
}
