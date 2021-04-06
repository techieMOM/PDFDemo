//
//  ViewController.swift
//  PDFDemo
//
//  Created by SOWJI on 06/04/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // Encode PDF file to Data String like we receive from server
    }
    
    @IBAction func openPDF(_ sender: UIButton) {
        print(sender.tag)
        self.performSegue(withIdentifier: "seguePDF", sender: sender.tag)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? PDFViewController {
            vc.selectedTag = sender as! Int
        }
    }
    
    // Convert PDF to Base64 String
    func encodePDFtoBase64() ->  String? {
        if let pdfPath = Bundle.main.path(forResource: "sample1", ofType: "pdf") {
            guard let pdfBase64String = NSData(contentsOfFile: pdfPath)?.base64EncodedString() else { return nil }
            return pdfBase64String
        }
        return nil
    }
}

