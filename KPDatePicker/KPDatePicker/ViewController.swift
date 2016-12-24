//
//  ViewController.swift
//  KPDatePicker
//
//  Created by Kushal Panchal on 23/12/16.
//  Copyright © 2016 Kushal Panchal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var selectedValueLabel: UILabel!
    
    var datePicker : KPDatePicker?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func showDatePicker(_ sender: AnyObject) {
        
        datePicker = KPDatePicker.getFromNib()
        
        setupDatePicker()
        
//        datePicker!.delegate = self
        
        datePicker!.show(self) { (aDate , isCancel) in
            
            print(aDate)
            
            if !isCancel {
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "dd/MM/yyyy"
                self.selectedValueLabel.text = dateFormatter.string(from: aDate)
            }
            
        }
        
    }
    
    fileprivate func setupDatePicker() {
        
        datePicker!.config.startDate = Date()
        
    }
    

}


extension ViewController: KPDatePickerDelegate {
    
    func datePicker(_ amDatePicker: KPDatePicker, didSelect date: Date) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        selectedValueLabel.text = dateFormatter.string(from: date)
    }
    
    func datePickerDidCancelSelection(_ amDatePicker: KPDatePicker) {
        // NOP
    }
    
}



