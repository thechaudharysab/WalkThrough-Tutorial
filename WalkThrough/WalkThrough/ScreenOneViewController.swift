//
//  ScreenOneViewController.swift
//  WalkThrough
//
//  Created by Chaudhry Talha on 11/2/19.
//  Copyright © 2019 ibjects. All rights reserved.
//

import UIKit
import Lottie

class ScreenOneViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var namePicker: UIPickerView!
    @IBOutlet weak var screenTwoButton: UIBarButtonItem!
    @IBOutlet weak var screenThreeButton: UIBarButtonItem!
    @IBOutlet weak var boyGirlSegment: UISegmentedControl!
    @IBOutlet weak var spinButton: UIButton!
    
    let girlSegmentTap = AnimationView(name: "tap")
    let boySegmentTap = AnimationView(name: "tap")
    let spinButtonTap = AnimationView(name: "point")
    
    var boyNames: [String] = ["Liam","Noah","William","James","Oliver","Benjamin","Elijah","Lucas","Mason","Logan"]
    var girlNames: [String] = ["Emma","Olivia","Ava","Isabella","Sophia","Charlotte","Mia","Amelia","Arya","Sansa"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        namePicker.delegate = self
        namePicker.dataSource = self
        UserDefaults.standard.removeObject(forKey: "NeedWalkThrough")
        startWalkThrough()
        //Displaying popup to ask if user need walkthorugh
        
        // Do any additional setup after loading the view.
    }
    
//    func showAlert() {
//
//
////        if UserDefaults.standard.bool(forKey: "NeedWalkThrough") == true {
////
////        } else if UserDefaults.standard.bool(forKey: "NeedWalkThrough") == false {
////
////        } else {
//
//            let alert = UIAlertController(title: "Welcome!", message: "Let's Get Started. Do you need a quick tutorial of how to use this app?", preferredStyle: UIAlertController.Style.alert)
//
//            alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { (actionAlert) in
//                self.startWalkThrough()
//                UserDefaults.standard.set(false, forKey: "NeedWalkThrough")
//            }))
//            alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: { (actionAlert) in
//                UserDefaults.standard.set(true, forKey: "NeedWalkThrough")
//            }))
//
//            alert.addAction(UIAlertAction(title: "Don't show this again", style: .destructive, handler: { (actionAlert) in
//                UserDefaults.standard.set(false, forKey: "NeedWalkThrough")
//            }))
//
//            self.present(alert, animated: true, completion: nil)
//
//   //     }
//
//    }
    
    func startWalkThrough()
    {
        girlSegmentTap.frame = CGRect(x: 0, y: 0, width: 65, height: 60)
        girlSegmentTap.center =  CGPoint(x: self.view.center.x+80, y: boyGirlSegment.center.y) //numberRaiseButton.center
        girlSegmentTap.loopMode = .loop
        girlSegmentTap.animationSpeed = 0.5
        girlSegmentTap.contentMode = .scaleAspectFill
        self.view.addSubview(girlSegmentTap)
        self.view.bringSubviewToFront(girlSegmentTap)
        let girlSegmentTapGesture = UITapGestureRecognizer(target: self, action: #selector(girlSegmentTapDone(sender:)))
        girlSegmentTap.addGestureRecognizer(girlSegmentTapGesture)
        girlSegmentTap.play(fromFrame: 0, toFrame: 8, loopMode: .loop, completion: nil)
    }
    
    @objc func girlSegmentTapDone(sender:UITapGestureRecognizer){
       
        boyGirlSegment.selectedSegmentIndex = 1
        namePicker.reloadAllComponents()
        girlSegmentTap.isHidden = true
        
        boySegmentTap.frame = CGRect(x: 0, y: 0, width: 65, height: 60)
        boySegmentTap.center =  CGPoint(x: self.view.center.x-40, y: boyGirlSegment.center.y) //numberRaiseButton.center
        boySegmentTap.loopMode = .loop
        boySegmentTap.animationSpeed = 0.5
        boySegmentTap.contentMode = .scaleAspectFill
        self.view.addSubview(boySegmentTap)
        self.view.bringSubviewToFront(boySegmentTap)
        let boySegmentTapGesture = UITapGestureRecognizer(target: self, action: #selector(boySegmentTapDone(sender:)))
        boySegmentTap.addGestureRecognizer(boySegmentTapGesture)
        boySegmentTap.play(fromFrame: 0, toFrame: 8, loopMode: .loop, completion: nil)
        
    }
    
    @objc func boySegmentTapDone(sender:UITapGestureRecognizer){
        
        boyGirlSegment.selectedSegmentIndex = 0
        namePicker.reloadAllComponents()
        boySegmentTap.isHidden = true
        
        spinButtonTap.frame = CGRect(x: 0, y: 0, width: 70, height: 70)
        spinButtonTap.center =  CGPoint(x: self.view.center.x, y: spinButton.center.y+60) //numberRaiseButton.center
        spinButtonTap.loopMode = .loop
        spinButtonTap.animationSpeed = 1.0
        spinButtonTap.contentMode = .scaleAspectFill
        self.view.addSubview(spinButtonTap)
        self.view.bringSubviewToFront(spinButtonTap)
        let spinButtonTapGesture = UITapGestureRecognizer(target: self, action: #selector(spinButtonTapDone(sender:)))
        spinButtonTap.addGestureRecognizer(spinButtonTapGesture)
        spinButtonTap.play(fromFrame: 0, toFrame: 41, loopMode: .loop, completion: nil)
        
    }
    
    @objc func spinButtonTapDone(sender:UITapGestureRecognizer) {
        
        spinButtonTap.isHidden = true
        print("Walk Through Finished")
    }
    
    @IBAction func boyBirlSegmentChanged(_ sender: Any) {
        
        namePicker.reloadAllComponents()
    }
    
    
    @IBAction func spinButtonPressed(_ sender: Any) {
        spinButtonTap.isHidden = true
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
