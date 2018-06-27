//
//  PokeViewController.swift
//  FinalProject
//
//  Created by User08 on 2018/6/27.
//  Copyright © 2018年 Ｗendy. All rights reserved.
//

import UIKit

class PokeViewController: UIViewController {

    @IBOutlet weak var NameText: UITextField!
    @IBOutlet weak var CpText: UITextField!
    @IBOutlet weak var IvTitle: UILabel!
    @IBOutlet weak var IvLabel: UILabel!
    @IBOutlet weak var IvLow: UILabel!
    
    let 蓋歐卡Cp = ["2303":89,"2304":91,"2305":91,"2306":91,"2307":91,"2308":93,"2309":93,"2310":93,"2311":93,"2312":93,"2313":93,"2314":96,"2315":96,"2316":96,"2318":96,"2319":96,"2320":98,"2322":98,"2323":98,"2328":100]
    let PokeName = ["急凍鳥","火焰鳥","閃電鳥","蓋歐卡","洛奇亞","Peter"]
    
    var selectedName: String?
    
    @IBAction func SearchButton(_ sender: Any) {
        if NameText.text == "Peter" {
            let alertController = UIAlertController(title: "太神啦!", message: "是傳說中神獸中的神獸", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(action)
            present(alertController, animated: true, completion: nil)
            
            return
        }
        if NameText.text == "蓋歐卡"{
            for keys in 蓋歐卡Cp{
                if keys.key == CpText.text{
                    
                    IvLabel.text = String(keys.value)
                    IvTitle.isHidden = false
                    IvLabel.isHidden = false
                    print(keys.value)
                }
            }
        }
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createNamePicker()
        createToolbar()
        
        // Do any additional setup after loading the view.
    }
    
    func createNamePicker() {
        let namePicker = UIPickerView()
        namePicker.delegate = self
        NameText.inputView = namePicker
        
    }
    
    func createToolbar() {
        
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        
        //Customizations
        toolBar.barTintColor = .blue
        toolBar.tintColor = .white
        
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(PokeViewController.dismissKeyboard))
        
        toolBar.setItems([doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        
        NameText.inputAccessoryView = toolBar
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
extension PokeViewController: UIPickerViewDelegate, UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return PokeName.count
    }
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return PokeName[row]
    }
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        selectedName = PokeName[row]
        NameText.text = selectedName
    }

}
