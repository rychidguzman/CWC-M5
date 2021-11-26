//
//  ContentModel.swift
//  LearningApp
//
//  Created by Ryan Christian De Guzman on 11/9/21.
//

import Foundation
class ContentModel: ObservableObject {
    
    @Published var module:[Module] = [Module]()
    var styleData:Data?
    
    init(){
        getLocalData()
    }
    
    func getLocalData() {
        
        //Get url path of a json file
        let jsonURL = Bundle.main.url(forResource: "data", withExtension: "json")
        
        do {
            //Create a Data Object
            let data = try Data(contentsOf: jsonURL!)
            
            //Decode the data with Json Decoder
            let decoder = JSONDecoder()

                let module = try decoder.decode([Module].self, from: data)
                self.module = module

        } catch {
            print("Coudn't parse json file.")
        }
        
        //Get url of a json file
        let styleURL = Bundle.main.url(forResource: "style", withExtension: "html")
        
        do{
            //Create a data OObject
            let styledata = try Data(contentsOf: styleURL!)
            self.styleData = styledata
            
        } catch {
            print("Error can't parse HTML data file.")
        }
    }
}
