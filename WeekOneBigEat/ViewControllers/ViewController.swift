//
//  ViewController.swift
//  WeekOneBigEat
//
//  Created by Jian Ma on 8/2/19.
//  Copyright © 2019 Jian Ma. All rights reserved.
//

import UIKit
class ViewController: UIViewController {
    @IBOutlet weak var fullnessLabel: UILabel!
    @IBOutlet weak var chickenButton: UIButton!
    
    var fullnessValue = 0 {
        didSet {
            fullnessLabel.text = "\(fullnessValue)"
            if fullnessValue >= 100 {
                chickenButton.isEnabled = false
                return
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver( self, selector: #selector(onDidReceiveData(_:)), name: Notification.Name("didReceieveData")  , object: nil)
    }
  
    @objc func onDidReceiveData(_ notification: Notification) {
        fullnessValue = notification.object as! Int
    }
    @IBAction func chickenDidPressedButton(_ sender: UIButton) {
        let VCTwo = storyboard?.instantiateViewController(withIdentifier: "ViewControllerTwo") as! ViewControllerTwo
        VCTwo.vcTwoDelegate = self
        guard let fullnessLabelText = fullnessLabel.text, var fullNessValue = Int(fullnessLabelText) else { return }
        fullNessValue += Food.chicken.value
        self.fullnessValue = fullNessValue
        self.fullnessLabel.text = "\(fullNessValue)"

//        NotificationCenter.default.post(name: Notification.Name("didReceieveData"), object: String(fullNessValue))
//        present(VCTwo, animated: false, completion: nil)
        //   performSegue(withIdentifier: "sequeFromOneToTwo", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let controller = segue.destination as? ViewControllerTwo {
            controller.fullnessValue = fullnessValue
        }
    }
}
extension ViewController: VCTwoDelegate {
    func getFullness(fullness: Int) {
        fullnessLabel.text = String(fullness)
    }
}
