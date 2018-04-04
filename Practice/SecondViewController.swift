//
//  SecondViewController.swift
//  Practice
//
//  Created by Ammar AlTahhan on 03/04/2018.
//  Copyright © 2018 yarob. All rights reserved.
//

import UIKit
import Spring

class SecondViewController: UIViewController {
    
    @IBOutlet weak var wView: SpringView!

    override func viewDidLoad() {
        super.viewDidLoad()

        wView.animation = "swing"
        wView.autohide = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        wView.animate()
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
