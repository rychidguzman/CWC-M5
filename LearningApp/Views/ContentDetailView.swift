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
                    .scaledToFit()
            }
            
            //Descriptins
            CodeTextView()
            
            //Show next Lesson Button if there is a next lesson
            if model.hasNextLesson() {
                Button {
                    model.nextLesson()
                } label: {
                    ZStack{
                        Rectangle()
                            .frame(height: 48)
                            .foregroundColor(.green)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                    
                        Text("Next Lesson: \(model.currentModule!.content.lessons[model.currentLessonIndex+1].title)")
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
