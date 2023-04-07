//
//  ViewController.swift
//  Protocol&DelegatePassingData
//
//  Created by mayank ranka on 01/04/23.
//

import UIKit

class ViewController: UIViewController , UITableViewDelegate, UITableViewDataSource , changeNameInLabel{
    
    @IBOutlet weak var myTableView: UITableView!
    
    var arrImage = ["apple.jpg","banana.jpg","butter.jpg","lion.jpg","tree.jpg"]
    var arrName = ["apple","banana","butter","lion","tree"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.myTableView.delegate = self
        self.myTableView.dataSource = self
        myTableView.layer.cornerRadius = 50
        myTableView.backgroundColor = .init(red: (153.0 / 255.0), green: (135.0 / 255.0), blue: (222.0/255.0), alpha: 1)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? MyTableViewCell
        cell?.layer.cornerRadius = 50
        cell?.backgroundColor = .init(red: (153.0 / 255.0), green: (135.0 / 255.0), blue: (222.0/255.0), alpha: 1)
        cell?.myImage.image = UIImage(named: arrImage[indexPath.row])
        cell?.myLabel.text = arrName[indexPath.row]
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController{
            vc.img = UIImage(named: arrImage[indexPath.row])!
//            vc.userDict = [self.arrName[indexPath.row]:"name"]
            vc.delegate = self
            vc.index = indexPath.row
            vc.name = arrName[indexPath.row]
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }

    func changeData(name: String, cellIndex: Int) {
//        let de = arrName.insert(name, at: cellIndex)
//        print(de)
//        print(name)
        arrName[cellIndex] = name
        myTableView.reloadData()
//        print(cellIndex)
        
    }
    

    
}

