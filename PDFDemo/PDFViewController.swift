//
//  PDFViewController.swift
//  PDFDemo
//
//  Created by SOWJI on 06/04/21.
//

import UIKit
import WebKit
import PDFKit

class PDFViewController: UIViewController {

    @IBOutlet weak var webKitView: WKWebView!
    var selectedTag = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        self.openPDF()
        // Do any additional setup after loading the view.
    }
    
    func openPDF() {
        // Load PDF using webkit
        if selectedTag == 0 {
            
            // Loading PDF base64 string in Webkit
            if let pdfData = Data(base64Encoded: pdfDataString) {
                self.webKitView.load(pdfData, mimeType: "application/pdf", characterEncodingName: "", baseURL: URL(string: "https://www.facebook.com/TechieMOMSowji/")!)
            }
            
            // Loading PDF file in Webkit
            if let pdfPath = Bundle.main.url(forResource: "sample2", withExtension: "pdf") {
                self.webKitView.loadFileURL(pdfPath, allowingReadAccessTo: pdfPath)
            }
        }
        
        // Load PDF using PDFKit
        else {
            let pdfView = PDFView()
            pdfView.translatesAutoresizingMaskIntoConstraints = false
            self.view.addSubview(pdfView)
            pdfView.frame = self.view.frame
            pdfView.autoScales = true

            // Loading Base64String as PDF Doc
            if let pdfData = Data(base64Encoded: pdfDataString) {
                if let doc = PDFDocument(data: pdfData) {
                    pdfView.document = doc
                }
            }
            
            // Loading PDF file
            if let pdfPath = Bundle.main.url(forResource: "sample2", withExtension: "pdf") {
                if let doc = PDFDocument(url: pdfPath) {
                    pdfView.document = doc
                }
            }
        }
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
