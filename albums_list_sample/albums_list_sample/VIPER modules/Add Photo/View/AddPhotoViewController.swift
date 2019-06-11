//
//  AddPhotoViewController.swift
//  albums_list_sample
//
//  Created by Andriy Kupetskyy on 6/10/19.
//  Copyright © 2019 ME. All rights reserved.
//

import Foundation
import UIKit

final class AddPhotoViewController: UIViewController, AddPhotoViewInput {
    var output: AddPhotoViewOutput?

    @IBOutlet weak var createButton: UIBarButtonItem!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var albumIdTextField: UITextField!

    private var pickerView: UIPickerView!
    private var albums = [AlbumItem]()

    private var selectedAlbum: AlbumItem?

    override func viewDidLoad() {
        super.viewDidLoad()

        output?.viewLoaded()
    }

    // MARK: -

    @IBAction func createButtonPressed() {
        output?.createButtonPressed()
    }

    @IBAction func cancelButtonPressed() {
        output?.cancelButtonPressed()
    }

    @IBAction func textChanged(_ textField: UITextField) {
        output?.nameChanged()
    }

    // MARK: -

    func show(albums: [AlbumItem]) {
        self.albums = albums
        pickerView.reloadAllComponents()
    }

    func show(error: Error) {
        display(error: error)
    }

    func setupView() {
        pickerView = UIPickerView()
        pickerView.delegate = self
        pickerView.dataSource = self
        
        albumIdTextField.inputView = pickerView

        nameTextField.delegate = self
    }

    func enableCreateButton() {
        createButton.isEnabled = true
    }

    func disableCreateButton() {
        createButton.isEnabled = false
    }

    func getSelectedAlbum() -> AlbumItem? {
        return selectedAlbum
    }

    func getAlbumName() -> String? {
        return nameTextField.text
    }
}

extension AddPhotoViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard textField == nameTextField else {
            return false
        }

        if let text = nameTextField.text as NSString?,
            let output = output {
            let updatedText = text.replacingCharacters(in: range, with: string )

            if output.canNameBeUsed(name: updatedText) {
                return true
            }
        }
        return false
    }
}

extension AddPhotoViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return albums.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return albums[row].title
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedAlbum = albums[row]

        albumIdTextField.text = selectedAlbum?.title

        output?.albumSelected()
    }
}
