/*
* ViewController.swift
* BabyScript
*
* Created by Gabriel Miro on 02/08/15.
* Copyright (c) 2015 Razeware LLC
*
* Permission is hereby granted, free of charge, to any person obtaining a copy
* of this software and associated documentation files (the "Software"), to deal
* in the Software without restriction, including without limitation the rights
* to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
* copies of the Software, and to permit persons to whom the Software is
* furnished to do so, subject to the following conditions:
*
* The above copyright notice and this permission notice shall be included in
* all copies or substantial portions of the Software.
*
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
* AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
* LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
* OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
* THE SOFTWARE.
*/

import Cocoa

class ViewController: NSViewController {

  @IBOutlet var text: NSTextView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    text.toggleRuler(self)
  }

  @IBAction func showWordCountWindow(_ sender: AnyObject) {
    
    // 1
    let storyboard = NSStoryboard(name: "Main", bundle: nil)
    let wordCountWindowController = storyboard.instantiateController(withIdentifier: "Word Count Window Controller") as! NSWindowController
    
    if let wordCountWindow = wordCountWindowController.window, let textStorage = text.textStorage {
      
      // 2
      let wordCountViewController = wordCountWindow.contentViewController as! WordCountViewController
      wordCountViewController.wordCount.stringValue = "\(textStorage.words.count)"
      wordCountViewController.paragraphCount.stringValue = "\(textStorage.paragraphs.count)"
      
      // 3
      let application = NSApplication.shared()
      application.runModal(for: wordCountWindow)
      
      //4 If we run the modal window, we would block the main thread!!
      print("Hey, we just show a modal window")
    }
  }
}
