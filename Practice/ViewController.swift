//
//  ViewController.swift
//  Practice
//
//  Created by يعرب المصطفى on 3/30/18.
//  Copyright © 2018 yarob. All rights reserved.
//


struct Post:Decodable
{
    let userId:Int
    let id:Int
    let title:String
    let body:String
    
}

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    let baseUrl = "https://jsonplaceholder.typicode.com"
    let postsUrl = "/posts"
    var posts = [Post]();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //testing get :
        //requestPosts(url : baseUrl+postsUrl)
        
        //testing post :
        let params = ["title" : "hello yarob :)","body":"hhhhh"]
        postInPosts(url: baseUrl+postsUrl, params: params)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func requestPosts(url : String)
    {
        let url = URL(string:url)
        Alamofire.request(url!).responseJSON { (response) in
            if let result = response.data
            {
                print(result)
               
                do
                {
                    self.posts = try JSONDecoder().decode([Post].self,from:result)
                    for post in self.posts
                    {
                        print(post.title,":",post.body,":",post.id,":",post.userId)
                    }
                }catch
                {
                    
                }
            }else{
                print("error occured")
            }
        }
    }
    
    
    func requestPostWithErrorHandling(url : String)
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
                
                do
                {
                    self.posts = try JSONDecoder().decode([Post].self,from:result)
                    for post in self.posts
                    {
                        print(post.title,":",post.body,":",post.id,":",post.userId)
                    }
                }catch
                {
                    
                }
            }else{
                print("error occured")
            }
        }
    }
    
    func postInPosts(url : String, params : [String:String])
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
    func postInPostsWithHeaders(url : String, params : [String:String])
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

