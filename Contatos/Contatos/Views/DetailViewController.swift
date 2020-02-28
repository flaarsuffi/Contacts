//
//  DetailViewController.swift
//  Contatos
//
//  Created by Flavia Arsuffi on 18/01/20.
//  Copyright © 2020 Flavia Arsuffi. All rights reserved.
//

import UIKit
import SDWebImage

class DetailViewController: UIViewController {

    @IBOutlet weak var contactPhotoImageView: UIImageView!
    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var telephoneLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var stateLabel: UILabel!
    @IBOutlet weak var notesTextView: UITextView!
    
    var contactDetail: Contact?
    
    var detailController: DetailController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        roundImage()
        setupView()
    }

    func roundImage() {
        contactPhotoImageView.layer.masksToBounds = true
        contactPhotoImageView.layer.cornerRadius = contactPhotoImageView.bounds.width / 2
    }
    
    func setupView() {
        //        contactPhotoImageView?.sd_setImage(with: URL(string: contactDetail?.picture ?? ""), completed: nil)
        //        fullNameLabel.text = "\(contactDetail?.name ?? "") \(contactDetail?.lastName ?? "")"
                fullNameLabel.text = detailController?.fullName
        //        telephoneLabel.text = contactDetail?.phone
        //        emailLabel.text = contactDetail?.email
        //        cityLabel.text = contactDetail?.city
        //        stateLabel.text = contactDetail?.state
        //        notesTextView.text = contactDetail?.notes

    }

}
