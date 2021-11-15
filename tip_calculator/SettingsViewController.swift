//
//  SettingsViewController.swift
//  code_path
//
//  Created by Jonah Tjandra on 11/14/21.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var tip1Edit: UITextField!
    
    @IBOutlet weak var tip2Edit: UITextField!
    
    @IBOutlet weak var tip3Edit: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func saveClicked(_ sender: Any) {
        let defaults = UserDefaults.standard;
        defaults.set(tip1Edit.text!, forKey: "tip1");
        defaults.set(tip2Edit.text!, forKey: "tip2");
        defaults.set(tip3Edit.text!, forKey: "tip3");
        defaults.synchronize();
        tip1Edit.text = "";
        tip2Edit.text = "";
        tip3Edit.text = "";
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
