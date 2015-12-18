//
//  SettingsViewController.swift
//  tips
//
//  Created by Carli on 12/18/15.
//  Copyright © 2015 codepath. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController,UIPickerViewDataSource, UIPickerViewDelegate {

    
    
    @IBOutlet weak var pickerView: UIPickerView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.pickerView.dataSource = self;
        self.pickerView.delegate = self;
    

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    var pickerDataSource = ["18%", "20%", "22%"];
    
    
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerDataSource.count;
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerDataSource[row]
    }
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        if(row == 0)
        {
            let defaults = NSUserDefaults.standardUserDefaults()
            defaults.setDouble(0.18, forKey: "default_tip_percentage")
            defaults.synchronize()
        }
        else if(row == 1)
        {
            let defaults = NSUserDefaults.standardUserDefaults()
            defaults.setDouble(0.2, forKey: "default_tip_percentage")
            defaults.synchronize()
        }
        else if(row == 2)
        {
            let defaults = NSUserDefaults.standardUserDefaults()
            defaults.setDouble(0.22, forKey: "default_tip_percentage")
            defaults.synchronize()
        }
    
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
