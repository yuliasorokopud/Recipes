//
//  MyImagePicker.swift
//  Recipes
//
//  Created by Yulia on 12.05.2021.
//

//import Foundation
import SwiftUI
import CoreML
import Vision

struct ImagePicker: UIViewControllerRepresentable {
    
    @Binding var result: String
    @Environment(\.presentationMode)  var presentationMode
    @Binding var sourceType: UIImagePickerController.SourceType
    
    
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let imagePicker = UIImagePickerController()
        imagePicker.allowsEditing = false
        imagePicker.sourceType = sourceType
        imagePicker.delegate = context.coordinator
        
        
        return imagePicker
    }
    
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
        
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    
}


final class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var parent: ImagePicker
    
    init(_ parent: ImagePicker) {
        self.parent = parent
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            classify(image: image)
            
        }
    }
    
    lazy var classificationRequest: VNCoreMLRequest = {
        do {
            let config = MLModelConfiguration()
            let ingredients = try IngredientsClassifier(configuration: config)
            let visionModel = try VNCoreMLModel(for: ingredients.model)
            let request = VNCoreMLRequest(model: visionModel, completionHandler: { [weak self] request, error in
                self?.processObservations(for: request, error: error)
            })
            request.imageCropAndScaleOption = .centerCrop
            return request
        } catch {
            fatalError("Failed to create VNCoreMLModel: \(error)")
        }
    }()
    
    
    func classify(image: UIImage) {
        guard let ciImage = CIImage(image: image) else {
            print("Unable to create CIImage")
            return
        }
        DispatchQueue.global(qos: .userInitiated).async {
            let handler = VNImageRequestHandler(ciImage: ciImage)
            do {
                try handler.perform([self.classificationRequest])
            } catch {
                print("Failed to perform classification: \(error)")
            }
        }
    }
    
    func processObservations(for request: VNRequest, error: Error?) {
        DispatchQueue.main.async {
            if let results = request.results as? [VNClassificationObservation] {
                if results.isEmpty {
                    self.parent.result = "nothing found"
                    print("nothing found")
                } else if results[0].confidence < 0.8 {
                    self.parent.result = "" //not sure
                    print("not sure")
                } else {
                    self.parent.result = String(results[0].identifier)
                }
            } else if let error = error {
                self.parent.result = "error: \(error.localizedDescription)"
            } else {
                self.parent.result = "???"
            }
        }
        parent.presentationMode.wrappedValue.dismiss()
    }
}
