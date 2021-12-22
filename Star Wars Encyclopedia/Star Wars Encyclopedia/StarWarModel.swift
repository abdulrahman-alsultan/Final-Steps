//
//  StarWarModel.swift
//  Star Wars Encyclopedia
//
//  Created by admin on 22/12/2021.
//

import Foundation

class StarWarModel{
    
    static func getAllFilms(completionHandler:@escaping (_ data: Data?, _ response: URLResponse?, _ error: Error?) -> Void){
        
        let url = URL(string: "https://swapi.dev/api/films/?format=json")
        
        let task = URLSession.shared.dataTask(with: url!, completionHandler: completionHandler)
        
        task.resume()
    }
    
    
    static func getAllPeople(completionHandler:@escaping (_ data: Data?, _ response: URLResponse?, _ error: Error?) -> Void){
        
        let url = URL(string: "https://swapi.dev/api/people/?format=json")
        
        let task = URLSession.shared.dataTask(with: url!, completionHandler: completionHandler)
        
        task.resume()
    }
    
}
