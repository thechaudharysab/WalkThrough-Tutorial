//
//  ScreenOneViewController.swift
//  WalkThrough
//
//  Created by Chaudhry Talha on 11/2/19.
//  Copyright © 2019 ibjects. All rights reserved.
//

import UIKit

class ScreenOneViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var namePicker: UIPickerView!
    @IBOutlet weak var screenTwoButton: UIBarButtonItem!
    @IBOutlet weak var screenThreeButton: UIBarButtonItem!
    @IBOutlet weak var boyGirlSegment: UISegmentedControl!
    @IBOutlet weak var spinButton: UIButton!
    
    var boyNames: [String] = ["Liam","Noah","William","James","Oliver","Benjamin","Elijah","Lucas","Mason","Logan"]
    var girlNames: [String] = ["Emma","Olivia","Ava","Isabella","Sophia","Charlotte","Mia","Amelia","Arya","Sansa"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        namePicker.delegate = self
        namePicker.dataSource = self

        // Do any additional setup after loading the view.
    }
    
    @IBAction func boyBirlSegmentChanged(_ sender: Any) {
        namePicker.reloadAllComponents()
    }
    
    
    @IBAction func spinButtonPressed(_ sender: Any) {
        
        let randomInt = Int.random(in: 0 ... 10)
        namePicker.selectRow(randomInt, inComponent: 0, animated: true)
        
    }
    
    // MARK: - Picker View
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 10
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if boyGirlSegment.selectedSegmentIndex == 0 {
            return boyNames[row]
        } else {
            return girlNames[row]
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
