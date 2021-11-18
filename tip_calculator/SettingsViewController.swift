//
//  SettingsViewController.swift
//  code_path
//
//  Created by Jonah Tjandra on 11/14/21.
//

import UIKit

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var tip1Edit: UITextField!
    
    @IBOutlet weak var tip2Edit: UITextField!
    
    @IBOutlet weak var tip3Edit: UITextField!
    
    @IBOutlet weak var titleSetting: UILabel!
    
    @IBOutlet weak var tip1Label: UILabel!
    
    @IBOutlet weak var tip2Label: UILabel!
    
    @IBOutlet weak var tip3Label: UILabel!
    
    @IBOutlet weak var darkModeLabel: UILabel!
    
    @IBOutlet weak var saveButton: UIButton!
    
    @IBOutlet weak var darkModeButton: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tip1Edit.keyboardType = UIKeyboardType.decimalPad;
        tip2Edit.keyboardType = UIKeyboardType.decimalPad;
        tip3Edit.keyboardType = UIKeyboardType.decimalPad;
        self.hideKeyboardWhenTappedAround();
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tip1Edit.becomeFirstResponder();
        if (UserDefaults.standard.integer(forKey: "dark") == 1) {
            darkModeButton.setOn(true, animated: false)
            setThemeLight();
        } else {
            darkModeButton.setOn(false, animated: false)
            setThemeDark();
        }
    }
    
    func setThemeDark() {
        self.view.backgroundColor = UIColor.white;
        titleSetting.textColor = UIColor.black;
        tip1Label.textColor = UIColor.black;
        tip2Label.textColor = UIColor.black;
        tip3Label.textColor = UIColor.black;
        darkModeLabel.textColor = UIColor.black;
        saveButton.tintColor = UIColor.black;
    }
    
    func setThemeLight() {
        self.view.backgroundColor = UIColor(red:0.15, green:0.15, blue:0.15, alpha:1);
        titleSetting.textColor = UIColor.white;
        tip1Label.textColor = UIColor.white;
        tip2Label.textColor = UIColor.white;
        tip3Label.textColor = UIColor.white;
        darkModeLabel.textColor = UIColor.white;
        saveButton.tintColor = UIColor.white;
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
    
    @IBAction func toggleDarkMode(_ sender: UISwitch) {
        let defaults = UserDefaults.standard;
        if (sender.isOn == true) {
            defaults.set(1, forKey: "dark");
            setThemeLight();
        } else {
            defaults.set(0, forKey: "dark");
            setThemeDark();
        }
        
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
