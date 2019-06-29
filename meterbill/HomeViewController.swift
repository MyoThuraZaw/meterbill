//
//  HomeViewController.swift
//  meterbill
//
//  Created by Myo Thura Zaw on 6/30/19.
//  Copyright © 2019 Myo Thura Zaw. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    var firstTier: Int = 0
    var secondTier: Int = 0
    var thirdTier: Int = 0
    var fourthTier: Int = 0
    var fifthTier: Int = 0
    var sixthTier: Int = 0
    var seventhTier: Int = 0
    
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
        
    }

    
    @IBAction func calculateAmount(_ sender: UIButton) {
        
        if let inputString = inputUnit.text {
            if let totalUnits = Int(inputString) {
            
                firstTier = calculateFirstTier(totalUnits: totalUnits)
                secondTier = calculateSecondTier(totalUnits: totalUnits)
                thirdTier = calculateThirdTier(totalUnits: totalUnits)
                fourthTier = calculateFourthTier(totalUnits: totalUnits)
                fifthTier = calculateFifthTier(totalUnits: totalUnits)
                sixthTier = calculateSixthTier(totalUnits: totalUnits)
                seventhTier = calculateSeventhTier(totalUnits: totalUnits)
            }
        }
        
        showResult()
    }

    
    func calculateFirstTier(totalUnits: Int) -> Int {
        if totalUnits > 0 && totalUnits <= 30{
            return totalUnits * 35
        } else if totalUnits > 30 {
            return 30 * 35
        } else {
            return 0
        }
    }
    
    func calculateSecondTier(totalUnits: Int) -> Int {
        if totalUnits > 30 && totalUnits <= 50 {
            return (totalUnits - 30) * 50
        } else if totalUnits > 50{
            return 20 * 50
        } else {
            return 0
        }
    }
    
    func calculateThirdTier(totalUnits: Int) -> Int {
        if totalUnits > 50 && totalUnits <= 75 {
            return (totalUnits - 50) * 70
        } else if totalUnits > 75 {
            return 25 * 70
        } else {
            return 0
        }
    }
    
    func calculateFourthTier(totalUnits: Int) -> Int {
        if totalUnits > 75 && totalUnits <= 100 {
            return (totalUnits - 75) * 90
        } else if totalUnits > 100 {
            return 25 * 90
        } else {
            return 0
        }
    }

    func calculateFifthTier(totalUnits: Int) -> Int {
        if totalUnits > 100 && totalUnits <= 150 {
            return (totalUnits - 100) * 110
        } else if totalUnits > 150 {
            return 50 * 110
        } else {
            return 0
        }
    }
    
    func calculateSixthTier(totalUnits: Int) -> Int {
        if totalUnits > 150 && totalUnits <= 200 {
            return (totalUnits - 150) * 120
        } else if totalUnits > 200{
            return 50 * 120
        } else {
            return 0
        }
    }
    
    func calculateSeventhTier(totalUnits: Int) -> Int {
        if totalUnits > 200 {
            return (totalUnits - 200) * 125
        } else {
            return 0
        }
    }
    
    func showResult() {
        let result = firstTier + secondTier + thirdTier + fourthTier + fifthTier + sixthTier + seventhTier
        
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
