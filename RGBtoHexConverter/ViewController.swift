//
//  ViewController.swift
//  RGBtoHexConverter
//
//  Created by Furkan Erzurumlu on 24.01.2022.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var txtRed: UITextField!
    @IBOutlet weak var txtGreen: UITextField!
    @IBOutlet weak var txtBlue: UITextField!
    @IBOutlet weak var lblResult: UILabel!
    @IBOutlet weak var btnConvert: UIButton!
    @IBOutlet weak var lblSelectedColor: UILabel!
    
    var selectedindex : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func segmentChanged(_ sender: UISegmentedControl) {
        selectedindex = sender.selectedSegmentIndex
        lblResult.text?.removeAll()
        txtRed.text?.removeAll()
        txtGreen.text?.removeAll()
        txtBlue.text?.removeAll()
        lblSelectedColor.backgroundColor = UIColor.white
        
        if selectedindex == 0 {
            btnConvert.setTitle("RGB - Hex Convert", for: UIControl.State.normal)
        }else{
            btnConvert.setTitle("Hex - RGB Convert", for: UIControl.State.normal)
        }
        
        
    }
    
    @IBAction func btnConvertClicked(_ sender: UIButton) {
        if selectedindex == 0{
            convertRGBtoHEX()
        }else{
            convertHEXtoRGB()
        }
    }
    
    func convertRGBtoHEX(){
        guard let redValue = UInt8(txtRed.text!) else {return}
        guard let greenValue = UInt8(txtGreen.text!) else {return}
        guard let blueValue = UInt8(txtBlue.text!) else {return}
        
                    let redHex = String(format: "%2X", redValue)
                    let greenHex = String(format: "%2X", greenValue)
                    let blueHex = String(format: "%2X", blueValue)
                    
                    lblResult.text = " Hex Color #\(redHex)\(greenHex)\(blueHex)"
                    lblSelectedColor.backgroundColor = UIColor(red: CGFloat(redValue)/255, green: CGFloat(greenValue)/255, blue: CGFloat(blueValue)/255, alpha: 1)
         
    }
    
    
    func convertHEXtoRGB(){
        guard let redValue = UInt8(txtRed.text!,radix: 16) else{return}
        guard let greenValue = UInt8(txtGreen.text!,radix: 16) else{return}
        guard let blueValue = UInt8(txtBlue.text!,radix: 16) else{return}
       
                    lblResult.text = "Red:\(redValue) \nGreen:\(greenValue) \nBlue:\(blueValue)"
                    lblSelectedColor.backgroundColor = UIColor(red: CGFloat(redValue)/255, green: CGFloat(greenValue)/255, blue: CGFloat(blueValue)/255, alpha: 1)
  
    }
}

