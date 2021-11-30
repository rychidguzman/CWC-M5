//
//  ContentModel.swift
//  LearningApp
//
//  Created by Ryan Christian De Guzman on 11/9/21.
//

import Foundation
class ContentModel: ObservableObject {
    
    //List of Module
    @Published var module:[Module] = [Module]()
    
    //Current Module
    @Published var currentModule:Module?
    var currentModuleIndex:Int = 0
    
    //Current Lesson
    @Published var currentLesson:Lesson?
    var currentLessonIndex = 0
    
    //Current Explanation
    @Published var lessonDescription = NSAttributedString()
    var styleData:Data?
    
    init(){
        getLocalData()
    }
    
    //MARK: - Data Methods
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
    
    //MARK: - Module Navigation Methods
    func beginModule(_ moduleId:Int){
        
        //Find the index for this module ID
        for index in 0..<module.count {
            if module[index].id == moduleId {
                currentModuleIndex = index
                break
            }
        }
        
        //Set the current module
        currentModule = module[currentModuleIndex]
    }
    
    func beginLesson(_ lessonId:Int){
        
        //Check if the current lesson is within the range
        if lessonId<currentModule!.content.lessons.count {
            currentLessonIndex = lessonId
        } else {
            currentLessonIndex = 0
        }
        
        //Set the current lesson
        currentLesson = currentModule!.content.lessons[currentLessonIndex]
        lessonDescription = addStyling(currentLesson!.explanation)
    }
    
    func nextLesson() {
        
        //Advance the lesson indec
        currentLessonIndex += 1
        
        //Chek if within the range
        if currentLessonIndex < currentModule!.content.lessons.count {
            //Set the current lesson property
            currentLesson = currentModule!.content.lessons[currentLessonIndex]
            lessonDescription = addStyling(currentLesson!.explanation)
        } else {
            currentLessonIndex = 0
            currentLesson = nil
        }
    }
    
    
    func hasNextLesson() -> Bool {
        
        return currentLessonIndex + 1<currentModule!.content.lessons.count
    }
    
    //MARK: - Code Styling
    
    private func addStyling(_ htmlString:String) -> NSAttributedString {
        
        var resultString = NSAttributedString()
        var data = Data()
        
        //Add styling data
        if styleData != nil {
            data.append(styleData!)
        }
        //Add the html data
        data.append(Data(htmlString.utf8))
        //Convert to NSAttributed String
        if let attributedString = try? NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html], documentAttributes: nil) {
            resultString = attributedString
        }
        
        return resultString
    }
}
