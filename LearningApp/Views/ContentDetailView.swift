//
//  ContentDetailView.swift
//  LearningApp
//
//  Created by Ryan Christian De Guzman on 11/27/21.
//

import SwiftUI
import AVKit

struct ContentDetailView: View {
    
    @EnvironmentObject var model:ContentModel
    
    var body: some View {
        
        let lesson = model.currentLesson
        let url = URL(string: Constants.videoHstUrl + (lesson?.video ?? ""))
        VStack{
            if url != nil {
                VideoPlayer(player: AVPlayer(url: url!))
                    .cornerRadius(10)
            }
            
            //Descriptins
            CodeTextView()
            
            //Show next Lesson Button if there is a next lesson
            if model.hasNextLesson() {
                Button {
                    model.nextLesson()
                } label: {
                    ZStack{
                        RectangleView(color: Color.green)
                            .frame(height: 48)
                    
                        Text("Next Lesson: \(model.currentModule!.content.lessons[model.currentLessonIndex+1].title)")
                            .foregroundColor(.white)
                            .bold()
                    }
                }
            } else {
                //Show complete if in the last lesson
                Button {
                    model.currentContentSelected = nil
                } label: {
                    ZStack{
                        RectangleView(color: Color.green)
                            .frame(height: 48)
                    
                        Text("Complete!")
                            .foregroundColor(.white)
                            .bold()
                    }
                }
            }

        }
        .navigationBarTitle(lesson?.title ?? "")
        .padding()
    }
}
