//
//  TestView.swift
//  LearningApp
//
//  Created by Ryan Christian De Guzman on 12/17/21.
//

import SwiftUI

struct TestView: View {
    @EnvironmentObject var model:ContentModel
    
    var body: some View {
        
        if model.currentQuestion != nil {
            
            VStack{
                
                //Quetion Number
                Text("Questions \(model.currentQuestionIndex + 1) of \(model.currentModule?.test.questions.count ?? 0)")
                //Question
                CodeTextView()
                //Answer
                
                //Button
            }
            .navigationBarTitle("\(model.currentModule?.category ?? "") Test")  
        } else {
            ProgressView()
        }
           
        
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
