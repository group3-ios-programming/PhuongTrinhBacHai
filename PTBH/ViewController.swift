//
//  ViewController.swift
//  PTBH
//
//  Created by Tran Nhat Tuan on 4/17/18.
//  Copyright © 2018 Tran Nhat Tuan. All rights reserved.
//

import UIKit




class ViewController: UIViewController,UITextFieldDelegate {
    
    @IBOutlet weak var lb_TextA: UITextField!
    @IBOutlet weak var lb_TextB: UITextField!
    @IBOutlet weak var lb_TextC: UITextField!
    @IBOutlet weak var lb_ThongBao: UILabel!
    @IBOutlet weak var lb_X1: UILabel!
    @IBOutlet weak var lb_X: UILabel!
    @IBOutlet weak var lb_X2: UILabel!
    @IBOutlet weak var TextIn_X1: UITextField!
    @IBOutlet weak var TextIn_X: UITextField!
    @IBOutlet weak var TextIn_X2: UITextField!
    //var numbers:String="0123456789.-"
    override func viewDidLoad() {
        super.viewDidLoad()
        // hiện thị bàn phím số khi nhấn vào text input
        
        
        self.lb_TextA.delegate=self
        self.lb_TextB.delegate=self
        self.lb_TextC.delegate=self
        
        
        // Ẩn kết quả
        lb_ThongBao.isHidden = true
        lb_X1.isHidden = true
        lb_X.isHidden = true
        lb_X2.isHidden = true
        TextIn_X1.isHidden = true
        TextIn_X.isHidden = true
        TextIn_X2.isHidden = true
    }
    
    @IBAction func HSA_input(_ sender: UITextField) {
        
    }
    
    
    @IBAction func btn_NhapLai(_ sender: Any) {
        lb_TextA.text = ""
        lb_TextB.text = ""
        lb_TextC.text = ""
        lb_ThongBao.isHidden = true
        lb_X1.isHidden = true
        lb_X.isHidden = true
        lb_X2.isHidden = true
        TextIn_X1.isHidden = true
        TextIn_X.isHidden = true
        TextIn_X2.isHidden = true
        
        lb_TextA.isEnabled = true
        lb_TextB.isEnabled = true
        lb_TextC.isEnabled = true
        
    }
    @IBAction func btn_KetQua(_ sender: Any) {
        TinhToan()
    }
   
    
    func textField (_ textField: UITextField, shouldChangeCharactersIn range:NSRange, replacementString string:String) -> Bool
    {
        let inverseSet = CharacterSet(charactersIn: "0123456789").inverted
        let components = string.components(separatedBy: inverseSet)
        let filltered = components.joined(separator: "")
        if (filltered == string)
        {
            return true
        }
        else
        {
            if (string == ".")
            {
                let countDot = textField.text!.components(separatedBy: ".").count - 1
                if (countDot==0)
                {
                    return true
                }
                else
                {
                    if(countDot > 0 && string == ".")
                    {
                        return false
                    }
                    else
                    {
                        return true
                    }
                        
                }
            }
            else
            {
                if string == "-"
                {
                    if textField.text!.isEmpty==true
                    {
                        return true
                    }
                    else
                    {
                        return false
                    }
                }
                else
                {
                    return false
                }
                    
            }
        }
    }
    
    func TinhToan ()
    {
        if (lb_TextA.text == "" || lb_TextB.text == "" || lb_TextC.text == "" )
        {
            lb_ThongBao.isHidden = false
            lb_ThongBao.text = "Bạn chưa nhập các số."
            lb_TextA.isEnabled = false
            lb_TextB.isEnabled = false
            lb_TextC.isEnabled = false
        }
        else
        {
            let Bien_A: Double = Double(lb_TextA.text!)!
            let Bien_B: Double = Double(lb_TextB.text!)!
            let Bien_C: Double = Double(lb_TextC.text!)!
            let Bien_DelTa = (Bien_B * Bien_B) - (4 * Bien_A * Bien_C)
            
            if (Bien_A == 0)
            {
                if (Bien_B == 0)
                {
                    if (Bien_C == 0)
                    {
                        lb_ThongBao.isHidden = false
                        lb_ThongBao.text = "Phương trình vô số nghiệm."
                        lb_TextA.isEnabled = false
                        lb_TextB.isEnabled = false
                        lb_TextC.isEnabled = false
                    }
                    else
                    {
                        lb_ThongBao.isHidden = false
                        lb_ThongBao.text = "Phương trình vô nghiệm."
                        lb_TextA.isEnabled = false
                        lb_TextB.isEnabled = false
                        lb_TextC.isEnabled = false
                    }
                }
                else
                {
                    lb_ThongBao.isHidden = false
                    lb_X.isHidden = false
                    TextIn_X.isHidden = false
                    lb_ThongBao.text = "Phương trình có 1 nghiệm."
                    TextIn_X.text = String((-1 * Bien_C) / Bien_B)
                    lb_TextA.isEnabled = false
                    lb_TextB.isEnabled = false
                    lb_TextC.isEnabled = false
                    TextIn_X.isEnabled = false
                }
            }
            else
            {
                if (Bien_DelTa < 0 )
                {
                    lb_ThongBao.isHidden = false
                    lb_ThongBao.text = "Phương trình vô nghiệm."
                    lb_TextA.isEnabled = false
                    lb_TextB.isEnabled = false
                    lb_TextC.isEnabled = false
                    
                }
                else
                {
                    if(Bien_DelTa == 0)
                    {
                        lb_ThongBao.isHidden = false
                        lb_X.isHidden = false
                        TextIn_X.isHidden = false
                        lb_ThongBao.text = "Phương trình có nghiệm kép."
                        TextIn_X.text = String((-1 * Bien_C) / Bien_B)
                        TextIn_X.isEnabled = false
                        lb_TextA.isEnabled = false
                        lb_TextB.isEnabled = false
                        lb_TextC.isEnabled = false
                        
                    }
                    else
                    {
                        lb_ThongBao.isHidden = false
                        lb_X1.isHidden = false
                        lb_X2.isHidden = false
                        TextIn_X1.isHidden = false
                        TextIn_X2.isHidden = false
                        lb_ThongBao.text = "Phương trình có 2 nghiệm."
                        TextIn_X1.text = String(((-1 * Bien_B) + sqrt(Bien_DelTa))/(2 * Bien_A))
                        TextIn_X2.text = String(((-1 * Bien_B) - sqrt(Bien_DelTa))/(2 * Bien_A))
                        
                        lb_TextA.isEnabled = false
                        lb_TextB.isEnabled = false
                        lb_TextC.isEnabled = false
                        
                        TextIn_X1.isEnabled = false
                        TextIn_X2.isEnabled = false
                        
                    }
                }
            }
        }
    }
}





