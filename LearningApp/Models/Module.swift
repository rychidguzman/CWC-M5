//
//  Module.swift
//  LearningApp
//
//  Created by Ryan Christian De Guzman on 11/9/21.
//

import Foundation
struct Module: Decodable, Identifiable {
    
    var id:Int
    var category:String
    var content:Content
    var test:Test
}
struct Content: Decodable, Identifiable {
    
    var id:Int
    var image:String
    var time:String
    var description:String
    var lessons:[Lesson]
}
struct Lesson: Identifiable, Decodable {
    
    var id:Int
    var title:String
    var video:String
    var duration:String
    var explanation:String
}
struct Test: Identifiable, Decodable {
    
    var id:Int
    var image:String
    var time:String
    var description:String
    var questions:[Question]
}
struct Question: Decodable, Identifiable {
    
    var id:Int
    var content:String
    var correctIndex:Int
    var answers:[String]
}
