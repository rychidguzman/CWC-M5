//
//  ContentView.swift
//  LearningApp
//
//  Created by Ryan Christian De Guzman on 11/26/21.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var model:ContentModel
    
    var body: some View {
       
        ScrollView{
            
            LazyVStack{
                
                if model.currentModule != nil {
                    
                    ForEach(0..<model.currentModule!.content.lessons.count) { index in
                        
                        ContentViewRow(index: index)
                        
                    }
                    
                }
                
            }
            .padding()
            .navigationTitle("Learn \(model.currentModule?.category ?? "")")
        }
        
    }
}

