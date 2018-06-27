import UIKit

class NoteTableViewController: UITableViewController {

    var titlesArray = [String]()
    var contentsArray = [String]()
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if segue.destination is NoteDetailViewController {
            let controller = segue.destination as? NoteDetailViewController
            let indexPath = tableView.indexPathForSelectedRow
            controller?.noteIndex = indexPath!.row
        }
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        print("delete note...")
        print(indexPath.row)
        let fileManager = FileManager.default
        let docUrls = fileManager.urls(for: .documentDirectory, in: .userDomainMask)
        let docUrl = docUrls.first

        var url = docUrl?.appendingPathComponent("noteTitles.txt")
        var titles = NSArray(contentsOf: url!)
        var titlesArray = [String]();
        if titles != nil {
            for title in titles! {
                titlesArray.append(title as! String);
            }
        }
        titlesArray.remove(at: indexPath.row)
        (titlesArray as NSArray).write(to: url!, atomically: true)
        
        url = docUrl?.appendingPathComponent("noteContents.txt")
        var contents = NSArray(contentsOf: url!)
        var contentsArray = [String]()
        if contents != nil {
            for content in contents! {
                contentsArray.append(content as! String)
            }
        }
        contentsArray.remove(at: indexPath.row)
        (contentsArray as NSArray).write(to: url!, atomically: true)
        
        /*read file to check*/
        url = docUrl?.appendingPathComponent("noteTitles.txt")
        titles = NSArray(contentsOf: url!)
        for title in titles! {
            print("\(title)")
        }
        
        url = docUrl?.appendingPathComponent("noteContents.txt")
        contents = NSArray(contentsOf: url!)
        for content in contents! {
            print("\(content)")
        }
        
        self.viewDidAppear(true)
        //self.tableView.deleteRows(at:[indexPath], with: UITableViewRowAnimation.fade)
        self.tableView.reloadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("in note did appear")
        
        titlesArray.removeAll()
        contentsArray.removeAll()
        
        let fileManager = FileManager.default
        let docUrls = fileManager.urls(for: .documentDirectory, in: .userDomainMask)
        let docUrl = docUrls.first
        
        var url = docUrl?.appendingPathComponent("noteTitles.txt")
        let titles = NSArray(contentsOf: url!)
        if titles != nil {
            for title in titles! {
                titlesArray.append(title as! String)
            }
        }

        url = docUrl?.appendingPathComponent("noteContents.txt")
        let contents = NSArray(contentsOf: url!)
        if contents != nil {
            for content in contents! {
                contentsArray.append(content as! String)
            }
        }
        
        /*print file*/
        for title in titlesArray {
            print(title)
        }
        for content in contentsArray {
            print(content)
        }
        
        self.tableView.reloadData()
    } 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("in note did load")
        
        let fileManager = FileManager.default
        let docUrls = fileManager.urls(for: .documentDirectory, in: .userDomainMask)
        let docUrl = docUrls.first
        
        var url = docUrl?.appendingPathComponent("noteTitles.txt")
        let titles = NSArray(contentsOf: url!)
        if titles != nil {
            for title in titles! {
                titlesArray.append(title as! String)
            }
        }

        url = docUrl?.appendingPathComponent("noteContents.txt")
        let contents = NSArray(contentsOf: url!)
        if contents != nil {
            for content in contents! {
                contentsArray.append(content as! String)
            }
        }
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return titlesArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NoteCell", for: indexPath)
        
        // Configure the cell...
        
        cell.textLabel?.text = titlesArray[indexPath.row] as? String
        
        
        return cell
    }
    
}
