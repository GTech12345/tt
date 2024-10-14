//
//  SelectedImageViewController.swift
//  Office
//
//  Created by Neel P. Moradiya on 09/10/24.
//

import UIKit

class SelectedImageViewController: UIViewController {

    @IBOutlet weak var imgSelection: UIImageView!
    @IBOutlet weak var imgSmall: UIImageView!
    @IBOutlet weak var viewImgBack: UIView!
    
    var selectedImg = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUi()
        setUpImage()
    }
    func setUpImage(){
        imgSelection.image = selectedImg
        imgSmall.image = selectedImg
    }
    func setUpUi(){
        viewImgBack.layer.cornerRadius = viewImgBack.frame.width / 2
        imgSmall.layer.cornerRadius = imgSmall.frame.width / 2
        viewImgBack.backgroundColor = UIColor.clear
    }
    @IBAction func btnCloseKeepScoll(_ sender: Any) {
        dismiss(animated: true)
    }
}
