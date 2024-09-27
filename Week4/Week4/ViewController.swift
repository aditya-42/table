//
//  ViewController.swift
//  Week4
//
//  Created by Aditya Sanjeev Purohit on 2024-09-27.
//

import UIKit

class ViewController: UIViewController , UIPickerViewDelegate, UIPickerViewDataSource, UITableViewDelegate, UITableViewDataSource{

    var semesters = ["Fall", "Winter", "Summer"]
    var selectedSemesterIndex = 0
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1;
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return semesters.count;
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return semesters[row];
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedSemesterIndex = row
    }
    @IBOutlet weak var studentTable: UITableView!
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stdArray.count;
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        var stdIndex = indexPath.row
        cell?.textLabel?.text = "\(stdArray[stdIndex].fullname) \(stdArray[stdIndex].program)"
        cell?.detailTextLabel?.text = "\(stdArray[stdIndex].semester)"
        return cell!
        
    }
    

    @IBOutlet weak var fullName: UITextField!
    @IBOutlet weak var programName: UITextField!
    
    var stdArray = (UIApplication.shared.delegate as! AppDelegate).allStudents;
    
    
    @IBAction func saveStudent(_ sender: UIButton) {
        if let studentName = fullName.text,
           let studentProgram = programName.text
        {
            if !studentName.isEmpty, !studentProgram.isEmpty{
                var newStd = StudentModel(fullname: studentName, program: studentProgram, semester: semesters[selectedSemesterIndex])
                print(newStd.toString())
                (UIApplication.shared.delegate as! AppDelegate).allStudents.append((newStd))
                stdArray = (UIApplication.shared.delegate as! AppDelegate).allStudents
            
                studentTable.reloadData()
                fullName.text=""
                programName.text=""
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

