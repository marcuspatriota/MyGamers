//
//  AddEditConsoleViewController.swift
//  MyGamers
//
//  Created by Marcus on 27/08/20.
//  Copyright © 2020 cesar. All rights reserved.
//

import UIKit
import Photos

class AddEditConsoleViewController: UIViewController {

    @IBOutlet weak var titleConsole: UITextField!
    @IBOutlet weak var imgConsole: UIImageView!
    
    @IBOutlet weak var buttonImageConsole: UIButton!
    
    
    var console: Console?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func addConsole(_ sender: Any) {
        // acao salvar novo ou editar existente
        if console == nil {
            console = Console(context: context)
        }
        console?.name = titleConsole.text
        console?.icon = imgConsole.image
        
        do {
            try context.save()
        } catch {
            print(error.localizedDescription)
        }
        
        // Back na navigation
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func addImgButton(_ sender: Any) {
        // para adicionar uma imagem da biblioteca
               print("para adicionar uma imagem da biblioteca")
               
               
               let alert = UIAlertController(title: "Selecinar capa", message: "De onde você quer escolher a capa?", preferredStyle: .actionSheet)
               
               let libraryAction = UIAlertAction(title: "Biblioteca de fotos", style: .default, handler: {(action: UIAlertAction) in
                   self.selectPicture(sourceType: .photoLibrary)
               })
               alert.addAction(libraryAction)
               
               let photosAction = UIAlertAction(title: "Album de fotos", style: .default, handler: {(action: UIAlertAction) in
                   self.selectPicture(sourceType: .savedPhotosAlbum)
               })
               alert.addAction(photosAction)
               
               let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
               alert.addAction(cancelAction)
               
               present(alert, animated: true, completion: nil)
    }
    

}

extension AddEditConsoleViewController{
    func chooseImageFromLibrary(sourceType: UIImagePickerController.SourceType) {
        
        DispatchQueue.main.async {
            let imagePicker = UIImagePickerController()
            imagePicker.sourceType = sourceType
            imagePicker.delegate = self
            imagePicker.allowsEditing = false
            imagePicker.navigationBar.tintColor = UIColor(named: "main")
            
            self.present(imagePicker, animated: true, completion: nil)
        }
        
    }
    func selectPicture(sourceType: UIImagePickerController.SourceType) {
        
        //Photos
        let photos = PHPhotoLibrary.authorizationStatus()
        if photos == .notDetermined {
            PHPhotoLibrary.requestAuthorization({status in
                if status == .authorized{
                    
                    self.chooseImageFromLibrary(sourceType: sourceType)
                    
                } else {
                    
                    print("unauthorized -- TODO message")
                }
            })
        } else if photos == .authorized {
            
            self.chooseImageFromLibrary(sourceType: sourceType)
        }
    }
}

extension AddEditConsoleViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    // tip. implementando os 2 protocols o evento sera notificando apos user selecionar a imagem
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            
            // ImageView won't update with new image
            // bug fixed: https://stackoverflow.com/questions/42703795/imageview-wont-update-with-new-image
            DispatchQueue.main.async {
                self.imgConsole.image = pickedImage
                self.imgConsole.setNeedsDisplay()
                self.buttonImageConsole.setTitle(nil, for: .normal)
                self.buttonImageConsole.setNeedsDisplay()
            }
        }
        
        dismiss(animated: true, completion: nil)
        
    }
    
}

