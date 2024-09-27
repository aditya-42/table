//
//  StudentModel.swift
//  Week4
//
//  Created by Aditya Sanjeev Purohit on 2024-09-27.
//

import Foundation

class StudentModel{
    var fullname:String = ""
    var program:String = ""
    var semester:String = ""
    
    // Constructor
    
    init(fullname: String, program: String, semester: String) {
        self.fullname = fullname
        self.program = program
        self.semester = semester
    }
    
    func toString() -> String{
        return "\(fullname) \(program) \(semester)"
    }
}
