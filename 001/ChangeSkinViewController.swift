//
//  ChangeSkinViewController.swift
//  001
//
//  Created by Kede on 2019/12/12.
//  Copyright © 2019 Clare. All rights reserved.
//

import UIKit

class ChangeSkinViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func dismiss(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func changeSkin(_ sender: Any) {
        LJThemeManager.shared.activeNextTheme()
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
