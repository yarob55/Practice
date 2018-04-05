//
//  Post.swift
//  Practice
//
//  Created by يعرب المصطفى on 4/4/18.
//  Copyright © 2018 yarob. All rights reserved.
//

import Foundation
struct Post:Decodable
{
    var userId:Int?
    var id:Int?
    var title:String?
    var body:String?
    
    init()
    {
        self.userId = nil
        self.title = nil
        self.id = nil
        self.body = nil
    }
}
