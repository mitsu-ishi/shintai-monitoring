//
//  NextViewController.swift
//  shintai-monitoring
//
//  Created by mitsunori ishigaki on 2020/06/27.
//  Copyright © 2020 mitsu.ishi. All rights reserved.
//

import UIKit

class NextViewController: UIViewController {
    
    var data:Dictionary<String,String> = [:]
    
    // @IBOutlet weak var shushojoLabel: UILabel!
    @IBOutlet weak var shojoDetailLabel: UILabel!
    // @IBOutlet weak var highriskLabel: UILabel!
    @IBOutlet weak var riskDetailLabel: UILabel!
    // @IBOutlet weak var ekigakuLabel: UILabel!
    @IBOutlet weak var ekigakuDetailLabel: UILabel!
    // @IBOutlet weak var jikiLabel: UILabel!
    @IBOutlet weak var jikiDetailLabel: UILabel!
    // @IBOutlet weak var shinsatsuLabel: UILabel!
    @IBOutlet weak var shinsatsuDetailLabel: UILabel!
    // @IBOutlet weak var yobouLabel: UILabel!
    @IBOutlet weak var yobouDetailLabel: UILabel!
    //@IBOutlet weak var chuuiLabel: UILabel!
    @IBOutlet weak var chuuiDetailLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    self.shojoDetailLabel.text = self.data["firstDetail"]
    self.riskDetailLabel.text = self.data["secondDetail"]
    self.ekigakuDetailLabel.text = self.data["thirdDetail"]
    self.jikiDetailLabel.text = self.data["fourthDetail"]
    self.shinsatsuDetailLabel.text = self.data["fifthDetail"]
    self.yobouDetailLabel.text = self.data["sixthDetail"]
    self.chuuiDetailLabel.text = self.data["seventhDetail"]
       
    }

}
