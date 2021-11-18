//
//  ViewController.swift
//  code_path
//
//  Created by Jonah Tjandra on 11/14/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billAmountTextField: UITextField!
    
    @IBOutlet weak var tipAmountLabel: UILabel!
    
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    @IBOutlet weak var partySizeTextField: UITextField!
    
    @IBOutlet weak var perPersonTotal: UILabel!
    
    @IBOutlet weak var billAmountLabel: UILabel!
    
    @IBOutlet weak var tipLabel: UILabel!
    
    @IBOutlet weak var totalLabelText: UILabel!
    
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var partySizeLabel: UILabel!
    
    @IBOutlet weak var perPersonLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        billAmountTextField.keyboardType = UIKeyboardType.decimalPad;
        partySizeTextField.keyboardType = UIKeyboardType.decimalPad;
        self.hideKeyboardWhenTappedAround();
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
        billAmountTextField.becomeFirstResponder();
        partySizeTextField.text = "1";
        // Do any additional setup after loading the view.
        let defaults = UserDefaults.standard;
        tipControl.setTitle(defaults.string(forKey: "tip1") ?? "15%", forSegmentAt: 0);
        tipControl.setTitle(defaults.string(forKey: "tip2") ?? "18%", forSegmentAt: 1);
        tipControl.setTitle(defaults.string(forKey: "tip3") ?? "20%", forSegmentAt: 2);
        // This is a good place to retrieve the default tip percentage from UserDefaults
        // and use it to update the tip amount
        tipControl.setTitle((defaults.string(forKey: "tip1") ?? "15")+"%", forSegmentAt: 0);
        tipControl.setTitle((defaults.string(forKey: "tip2") ?? "18")+"%", forSegmentAt: 1);
        tipControl.setTitle((defaults.string(forKey: "tip3") ?? "20")+"%", forSegmentAt: 2);
        if (defaults.integer(forKey: "dark") == 1) {
            setThemeDark();
        } else {
            setThemeLight();
        }
    }
    
    func setThemeDark() {
        self.view.backgroundColor = UIColor(red:0.15, green:0.15, blue:0.15, alpha:1);
        tipLabel.textColor = UIColor.white;
        tipAmountLabel.textColor = UIColor.white;
        billAmountLabel.textColor = UIColor.white;
        totalLabel.textColor = UIColor.white;
        totalLabelText.textColor = UIColor.white;
        partySizeLabel.textColor = UIColor.white;
        perPersonLabel.textColor = UIColor.white;
        perPersonTotal.textColor = UIColor.white;
    }
    
    func setThemeLight() {
        self.view.backgroundColor = UIColor.white;
        tipLabel.textColor = UIColor.black;
        tipAmountLabel.textColor = UIColor.black;
        billAmountLabel.textColor = UIColor.black;
        totalLabel.textColor = UIColor.black;
        totalLabelText.textColor = UIColor.black;
        partySizeLabel.textColor = UIColor.black;
        perPersonLabel.textColor = UIColor.black;
        perPersonTotal.textColor = UIColor.black;
    }
    
    func calculateTipHelper() {
        let defaults = UserDefaults.standard;
        let partySize = Double(partySizeTextField.text!) ?? 1;
        let bill = Double(billAmountTextField.text!) ?? 0;
        let tip1 = Double(defaults.string(forKey: "tip1") ?? "15");
        let tip2 = Double(defaults.string(forKey: "tip2") ?? "18");
        let tip3 = Double(defaults.string(forKey: "tip3") ?? "20");
        let tipPercentages = [
            (tip1 ?? 15)/100,
            (tip2 ?? 18)/100,
            (tip3 ?? 20)/100
            ];
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex];
        let total = tip + bill;
        tipAmountLabel.text = String(format:"$%.2f",tip);
        totalLabel.text = String(format:"$%.2f",total);
        perPersonTotal.text = String(format:"$%.2f",total/partySize);
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        calculateTipHelper();
    }
    
    @IBAction func editTip(_ sender: Any) {
        calculateTipHelper();
    }
    
    @IBAction func partyTipEdit(_ sender: Any) {
        if (partySizeTextField.text == "0") {
            partySizeTextField.text = "1";
        }
        calculateTipHelper();
    }
    
    

}

