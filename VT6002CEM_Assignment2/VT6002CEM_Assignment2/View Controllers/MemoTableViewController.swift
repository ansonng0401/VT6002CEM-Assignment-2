//
//  MemoTableViewController.swift
//  VT6002CEM_Assignment2
//
//  Created by Anson on 10/1/2022.


import UIKit
import CoreData
var memoList = [Memo]()

class MemoTableViewController: UITableViewController {
var firstLoad = true
    

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if(segue.identifier == "editMemo")
        {
            
            
         let indexPath = tableView.indexPathForSelectedRow
            
            let memoDetail = segue.destination as? MemoIInputViewController
            
            let selectedMemo : Memo!
            selectedMemo = nonDeletedMemo()[indexPath!.row]
           memoDetail!.selectedMemo = selectedMemo

     tableView.deselectRow(at: indexPath!, animated: true)
        }
     
    }
    
    
    override func viewDidLoad()
    {
        if(firstLoad)
        {
            firstLoad = false
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let context: NSManagedObjectContext = appDelegate.persistentContainer.viewContext
            let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Memo")
            do {
                let results:NSArray = try context.fetch(request) as NSArray
                for result in results
                {
                    let memo = result as! Memo
                    memoList.append(memo)
                }
            }
            catch
            {
                print("Fetch Failed")
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
          let memoCell = tableView.dequeueReusableCell(withIdentifier: "memoCellID", for: indexPath) as! MemoCell
        
        let thisMemo: Memo!
        thisMemo = nonDeletedMemo()[indexPath.row]
        
        memoCell.titleLabel.text = thisMemo.title
        memoCell.descriptionLabel.text = thisMemo.desc
        
        return memoCell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nonDeletedMemo().count
    }
     
    

    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "editMemo", sender: self)
    }

   
    
    func nonDeletedMemo() -> [Memo]
    {
        var noDeleteMemoList = [Memo]()
        for memo in memoList
        {
            if(memo.deletedDate == nil)
            {
                noDeleteMemoList.append(memo)
            }
        }
        return noDeleteMemoList
    }
    }
