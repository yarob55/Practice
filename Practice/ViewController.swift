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
        requestPosts(url : baseUrl+postsUrl)
        print("retreiving the data")
        print("new feature")
        print("feature 3")
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


}

