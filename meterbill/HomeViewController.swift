//
//  HomeViewController.swift
//  meterbill
//
//  Created by Myo Thura Zaw on 6/30/19.
//  Copyright © 2019 Myo Thura Zaw. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    var tierLabels: [UILabel] = []
    var tiers: [Int] = Array(repeating: 0, count: 7)
    
    let unitRanges: [Int] = [0, 30, 50, 75, 100, 150, 200]
    let unitCharges: [Int] = [35, 50, 70, 90, 110, 120, 125]
    
    @IBOutlet weak var leftOval: UIView!
    @IBOutlet weak var rightOval: UIView!
    
    @IBOutlet weak var inputUnit: UITextField!
    
    @IBOutlet weak var btnCalculate: UIButton!
    
    @IBOutlet weak var firstTierAmount: UILabel!
    @IBOutlet weak var secondTierAmount: UILabel!
    @IBOutlet weak var thirdTierAmount: UILabel!
    @IBOutlet weak var fourthTierAmount: UILabel!
    @IBOutlet weak var fifthTierAmount: UILabel!
    @IBOutlet weak var sixthTierAmount: UILabel!
    @IBOutlet weak var seventhTierAmount: UILabel!
    
    @IBOutlet weak var resultAmount: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        leftOval.layer.cornerRadius = leftOval.frame.width / 2
        rightOval.layer.cornerRadius = rightOval.frame.width / 2
        
        btnCalculate.layer.cornerRadius = btnCalculate.frame.width / 2
        
        tierLabels = [firstTierAmount, secondTierAmount, thirdTierAmount, fourthTierAmount, fifthTierAmount, sixthTierAmount, seventhTierAmount]
        
    }

    @IBAction func showInfo(_ sender: UIButton) {
        performSegue(withIdentifier: "infoSegue", sender: nil)
    }
    
    @IBAction func calculateAmount(_ sender: UIButton) {
        
        if let inputString = inputUnit.text {
            if let totalUnits = Int(inputString) {
                for i in 0..<tiers.count {
                    tiers[i] = calculate(totalUnits: totalUnits, tier: i)
                }
            }
        }
    
        showResult()
    }
  
    func calculate(totalUnits: Int,tier i: Int) -> Int {

        if i < unitRanges.count - 1 {
            if totalUnits > unitRanges[i] && totalUnits <= unitRanges[i+1] {
                return (totalUnits - unitRanges[i]) * unitCharges[i]
            } else if totalUnits > unitRanges[i+1] {
                return (unitRanges[i+1] - unitRanges[i]) * unitCharges[i]
            } else {
                return 0
            }
        } else {
            return totalUnits > unitRanges[i] ? ((totalUnits - unitRanges[i]) * unitCharges[i]) : 0
        }

    }

    
    func showResult() {
        var result: Int = 0
        
        for tier in tiers {
            result += tier
        }
        
        for i in 0..<tierLabels.count {
            tierLabels[i].text = String(tiers[i])
        }
        
        resultAmount.text = String(result)
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
