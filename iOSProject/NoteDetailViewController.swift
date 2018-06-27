
import UIKit

class NoteDetailViewController: UIViewController {
    
    var noteIndex:Int = 0
    var titlesArray = [String]()
    var contentsArray = [String]()
    
    @IBOutlet weak var noteContent: UITextView!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if segue.destination is EditNoteViewController {
            let controller = segue.destination as? EditNoteViewController
            controller?.noteIndex = self.noteIndex
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
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
        
        self.title = titlesArray[noteIndex]
        noteContent.text = contentsArray[noteIndex]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        noteContent.layer.borderColor =  UIColor(red:255/255.0, green:255/255.0, blue:255/255.0, alpha: 1.0).cgColor
        
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
        
        print(noteIndex)

        self.title = titlesArray[noteIndex]
        noteContent.text = contentsArray[noteIndex]
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
