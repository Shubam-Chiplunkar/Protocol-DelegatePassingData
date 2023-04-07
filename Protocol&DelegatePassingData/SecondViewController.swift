//
//  SecondViewController.swift
//  Protocol&DelegatePassingData
//
//  Created by mayank ranka on 01/04/23.
//

import UIKit
protocol changeNameInLabel{
    func changeData(name : String, cellIndex: Int)
}
class SecondViewController: UIViewController {

    var delegate : changeNameInLabel!
    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var myImage: UIImageView!
    @IBOutlet weak var myTextField: UITextField!
    
    @IBOutlet weak var changeButton: UIButton!
    @IBOutlet weak var myTextfield: UITextField!
    var img = UIImage()
    var name = ""
    var userDict = [String : String]()
    var index : Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myLabel.text = name
        myImage.image = img
//        myTextfield.text = userDict.updateValue(name, forKey: "name")
        myImage.layer.cornerRadius = 30
        myImage.clipsToBounds = true
        
    }

    @IBAction func change(_ sender: Any) {
        
        delegate.changeData(name: myTextfield.text!, cellIndex: index)
        self.navigationController?.popToRootViewController(animated: true)
//        if storyboard?.instantiateViewController(withIdentifier: "ViewController") is ViewController{
//            self.userDict.updateValue(self.myTextfield.text!, forKey: "name")
//            self.delegate.changedLabel(name: self.userDict, iindex: self.index)
//        }
    }
   

}
