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
    var postRequest = PostRequest();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //testing get :
        postRequest.request(url : baseUrl+postsUrl)
        
        //testing post :
        let params = ["title" : "hello yarob :)","body":"hhhhh"]
        postRequest.post(url: baseUrl+postsUrl, params: params)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    


}

