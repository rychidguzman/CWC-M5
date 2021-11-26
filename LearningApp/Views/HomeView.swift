//
//  ContentView.swift
//  LearningApp
//
//  Created by Ryan Christian De Guzman on 11/9/21.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var model:ContentModel
    
    var body: some View {
        
        NavigationView{
            VStack(alignment: .leading){
                Text("What do you want to do today?")
                    .padding(.leading, 25)
                ScrollView {
                    
                    LazyVStack {
                        
                        ForEach(model.module) { module in
                            
                            VStack(spacing: 20) {
                                
                                NavigationLink {
                                    ContentView()
                                        .onAppear {
                                            model.beginModule(module.id)
                                        }
                                } label: {
                                    //Lesson
                                    HomeViewRow(image: module.content.image, title: "Learn \(module.category)", description: module.content.description, count: "\(module.content.lessons.count) Lessons", time: module.content.time)
                                }

                                
                                
                                //Test
                                HomeViewRow(image: module.test.image, title: "Learn \(module.category)", description: module.test.description, count: "\(module.test.questions.count) Questions", time: module.test.time)
                            }
                            
                        }
                    }
                    .accentColor(.black)
                    .padding()
                }
            }
            .navigationBarTitle("Get Started")
        }
        
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(ContentModel())
    }
}
