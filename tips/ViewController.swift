//
//  ViewController.swift
//  tips
//
//  Created by Carli on 12/17/15.
//  Copyright © 2015 codepath. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    @IBOutlet weak var billField: UITextField!
    
    @IBOutlet weak var tipLabel: UILabel!
    
    @IBOutlet weak var totalLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //Sets the title in the navigation bar
        
        self.title = "Tip Calculator"
       
        
        UIView.animateWithDuration(0, animations: {
            // This causes first view to fade in and second view to fade out
            
            self.totalLabel.alpha = 0
            self.tipLabel.alpha = 0
            
            self.tipControl.alpha = 0
            
            
            
        })
        
           }
    
    override func viewWillAppear(animated: Bool) {
        super.viewDidAppear(animated)
        //Keyboard appears on bill field by default
        

        billField.becomeFirstResponder()
        
        let defaults = NSUserDefaults.standardUserDefaults()
        
        let tipValue = defaults.doubleForKey("default_tip_percentage")
        let tipPercentage = tipValue
        
        let billAmount = NSString(string: billField.text!).doubleValue
        
        let tip = billAmount*tipPercentage
        let total = billAmount+tip
        
        if(tipValue==0.18){ tipControl.selectedSegmentIndex=0;
        }
        else if(tipValue==0.2){ tipControl.selectedSegmentIndex=1;
        }
        else{ tipControl.selectedSegmentIndex=2;
        }
        
        
        
        tipLabel.text="$\(tip)"
        totalLabel.text="$\(total)"
        
        tipLabel.text=String(format: "$%.2f", tip)
        
        totalLabel.text=String(format: "$%.2f", total)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
       
        if(billField.text == ""){
            UIView.animateWithDuration(0.4, animations: {
                // This causes first view to fade in and second view to fade out
                
                self.totalLabel.alpha = 0
                self.tipLabel.alpha = 0
                
                self.tipControl.alpha = 0
                
                
                
            })}
        else{
        UIView.animateWithDuration(0.4, animations: {
            // This causes first view to fade in and second view to fade out
            
            self.totalLabel.alpha = 1
            self.tipLabel.alpha = 1
            
            self.tipControl.alpha = 1

            
           
        })}
        
        
        var tipPercentages = [0.18,0.2,0.22]
        
        
        
       let tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        
        
        
        let billAmount = NSString(string: billField.text!).doubleValue
        
        let tip = billAmount*tipPercentage
        let total = billAmount+tip
        
        tipLabel.text="$\(tip)"
        totalLabel.text="$\(total)"
        
        tipLabel.text=String(format: "$%.2f", tip)
        
        totalLabel.text=String(format: "$%.2f", total)
    }

    @IBAction func onTap(sender: AnyObject) {
        
        view.endEditing(true)
    }
    
}

