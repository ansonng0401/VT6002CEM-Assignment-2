//
//  MemoIInputViewController.swift
//  VT6002CEM_Assignment2
//

//  Created by Anson on 10/1/2022.
//

import UIKit
import CoreData
class MemoIInputViewController: UIViewController, UITextFieldDelegate, UITextViewDelegate {
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var DescriptionTextView: UITextView!
    var selectedMemo: Memo? = nil
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        configureTextFields()//The keyboard can be hidden when the user is not pressed keyboard interface
        configuteTapGesture()//The keyboard can be hidden when the user is not pressed keyboard interface
        if(selectedMemo != nil)
        {
            titleTextField.text = selectedMemo?.title
            DescriptionTextView.text = selectedMemo?.desc
        }
    }
    
    
    private func configureTextFields(){//The keyboard can be hidden when the user is not pressed keyboard interface
        titleTextField.delegate = self
        DescriptionTextView.delegate = self
        
    }
    
    private func configuteTapGesture(){ //The keyboard can be hidden when the user is not pressed keyboard interface
        let tapGesture = UITapGestureRecognizer(target: self,action:
                                                    #selector(MemoIInputViewController.handleTap))
        view.addGestureRecognizer(tapGesture)
        
    }
    @objc func handleTap(){ //The keyboard can be hidden when the user is not pressed keyboard interface
        print("handle tap was called")
        view.endEditing(true)
    }
    
    @IBAction func saveAction(_ sender: Any) //save button action
    {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context: NSManagedObjectContext = appDelegate.persistentContainer.viewContext
        if(selectedMemo == nil) //save new memo
        {
            let entity = NSEntityDescription.entity(forEntityName: "Memo", in: context)
            let newMemo = Memo(entity: entity!, insertInto: context)
            newMemo.id = memoList.count as NSNumber
            newMemo.title = titleTextField.text
            newMemo.desc = DescriptionTextView.text
            do
            {
                try context.save()
                memoList.append(newMemo)
                navigationController?.popViewController(animated: true)
            }
            catch
            {
                print("context save error")
            }
        }
        else //save edit memo
        {
            let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Memo")
            do {
                let results:NSArray = try context.fetch(request) as NSArray
                for result in results
                {
                    let meno = result as! Memo
                    if(meno == selectedMemo)
                    {
                        meno.title = titleTextField.text
                        meno.desc = DescriptionTextView.text
                        try context.save()
                        navigationController?.popViewController(animated: true)
                    }
                }
            }
            catch
            {
                print("Fetch Failed")
            }
        }
    }
    @IBAction func deletebtn(_ sender: Any) { // delete memo function
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context: NSManagedObjectContext = appDelegate.persistentContainer.viewContext
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Memo")
        do {
            let results:NSArray = try context.fetch(request) as NSArray
            for result in results
            {
                let memo = result as! Memo
                if(memo == selectedMemo)
                {
                    memo.deletedDate = Date()
                    try context.save()
                    navigationController?.popViewController(animated: true)
                }
            }
        }
        catch
        {
            print("Fetch Failed")
        }
    }
}

