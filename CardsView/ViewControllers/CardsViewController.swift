//
//  CardsViewController.swift
//  Office
//
//  Created by Neel P. Moradiya on 08/10/24.
//

import UIKit
import Koloda

class CardsViewController: UIViewController {
    
    @IBOutlet weak var btnClose: UIButton!
    @IBOutlet weak var btnHeart: UIButton!
    @IBOutlet weak var viewKoloda: KolodaView!
    
    var ArrImg: [UIImage] = [
        UIImage(named: "img1")!,
        UIImage(named: "img2")!,
        UIImage(named: "img3")!,
        UIImage(named: "img4")!,
        UIImage(named: "img5")!,
        UIImage(named: "img6")!,
        UIImage(named: "img7")!,
        UIImage(named: "img8")!
    ]
    
    var dynamicImageArray: [UIImage] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btnClose.layer.cornerRadius = btnClose.frame.height / 2
        btnHeart.layer.cornerRadius = btnHeart.frame.height / 2
        loadMoreImages()
        
        viewKoloda.delegate = self
        viewKoloda.dataSource = self
    }
    
    func loadMoreImages() {
        let shuffledImages = ArrImg.shuffled()
        dynamicImageArray.append(contentsOf: shuffledImages)
    }
    
    @IBAction func btnClosePressed(_ sender: Any) {
        viewKoloda.swipe(.left,duration: 0.3)
    }
    
    @IBAction func btnRightPressed(_ sender: Any) {
        let currentIndex = viewKoloda.currentCardIndex
        guard currentIndex < dynamicImageArray.count else { return }
        let selectedImage = dynamicImageArray[currentIndex]
        viewKoloda.swipe(.right,duration: 1.0)
        let destinationVC = storyboard?.instantiateViewController(withIdentifier: "SelectedImageViewController") as! SelectedImageViewController
        destinationVC.modalTransitionStyle = .coverVertical
        destinationVC.modalPresentationStyle = .overFullScreen
        destinationVC.selectedImg = selectedImage
        navigationController?.present(destinationVC, animated: true, completion: nil)
    }
}

extension CardsViewController: KolodaViewDelegate, KolodaViewDataSource {
    
    func koloda(_ koloda: Koloda.KolodaView, viewForCardAt index: Int) -> UIView {
        if index == dynamicImageArray.count - 1 {
            loadMoreImages()
        }
        let customCardView = Bundle.main.loadNibNamed("CustomCardView", owner: self, options: nil)?.first as! CustomCardView
        customCardView.layer.cornerRadius = 8
        
        customCardView.imageView.image = dynamicImageArray[index % dynamicImageArray.count]
        customCardView.contentView.layer.cornerRadius = 8
        customCardView.imageView.layer.cornerRadius = 8
        customCardView.lblFirst.layer.cornerRadius = customCardView.lblFirst.frame.height / 2
        customCardView.lblFirst.layer.masksToBounds = true
        customCardView.lblSeconds.layer.cornerRadius = customCardView.lblSeconds.frame.height / 2
        customCardView.lblSeconds.layer.masksToBounds = true
        customCardView.lblMore.layer.cornerRadius = customCardView.lblMore.frame.height / 2
        customCardView.lblMore.layer.masksToBounds = true
        customCardView.lblAi.layer.cornerRadius = customCardView.lblAi.frame.height / 2
        customCardView.lblAi.layer.masksToBounds = true
        customCardView.LblViewProfile.layer.cornerRadius = customCardView.LblViewProfile.frame.height / 2
        customCardView.LblViewProfile.layer.masksToBounds = true
        return customCardView
    }
    func kolodaNumberOfCards(_ koloda: Koloda.KolodaView) -> Int {
        return Int.max
    }
}
