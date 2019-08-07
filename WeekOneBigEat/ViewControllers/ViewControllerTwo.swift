//
//  ViewControllerTwo.swift
//  WeekOneBigEat
//
//  Created by Jian Ma on 8/2/19.
//  Copyright © 2019 Jian Ma. All rights reserved.
//

import UIKit

protocol VCTwoDelegate: class{
    func getFullness(fullness : Int)
}
class ViewControllerTwo : UIViewController{
    weak var vcTwoDelegate : VCTwoDelegate?
    @IBOutlet weak var waterButton: UIButton!
    @IBOutlet weak var fullnessLabel: UILabel!
    var fullnessValue = 0
    
    @IBAction func waterDidPressedButton(_ sender: UIButton) {
        let newFullness : Int = (self.fullnessLabel.text! as NSString).integerValue + Food.water.value
        if(newFullness >= 100){
            waterButton.isEnabled = false
            return
        }
        self.vcTwoDelegate?.getFullness(fullness: newFullness)
        dismiss(animated: false, completion: nil)
        fullnessValue += 5
        NotificationCenter.default.post(name: Notification.Name("didReceieveData"), object: fullnessValue)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fullnessLabel.text = "\(fullnessValue)"
    }
    

    
    @objc func onDidReceiveData(_ notification:Notification) {
        self.fullnessLabel.text = (notification.object as! String)
    }
}
