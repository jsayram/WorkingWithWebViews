//
//  ViewController.swift
//  workingWithImageViews
//
//  Created by jose ramirez on 5/31/17.
//  Copyright © 2017 Jose Ramirez. All rights reserved.
//
//THis is for image view and WEB VIEW

import UIKit
import WebKit   // for using a webview you have to import WebKit

class ViewController: UIViewController {
    
    var webView:WKWebView!  // you have to instaniate it
    
    override func viewDidLoad() {
        super.viewDidLoad()
        /* Do any additional setup after loading the view, typically from a nib.
         
         here is where you intanciate the webview inside viewDidLoad*/
        // webView = WKWebView(frame: CGRect(x: 0, y: 20, width: 300, height: 300)) //that creates the webview
        /*now we need to add it to the screen*/
        //    view.addSubview(webView)
        
        /*1.) now we need to add content to the webview , simplest way to add content with a webview
         is to load an HTML string then test with an HTML string
         -- Now we don't have a base URL, we're just going to use a string here,
         and we're going to type some simple HTML, so I'll create an h one tag and
         we'll call it title, close out the h one tag, note that you don't have to
         have the full HTML with the HTML tag and the body tag and the title and
         everything, you can just write whatever elements you want and it will
         render inside of the WebView. So render a paragraph, put some words in
         there, close out the paragraph tag, for base URL I'm going to give it nil, and that's really it.
         */
        /// webView.loadHTMLString("<h1>Tittle</h><p>Words</p>", baseURL: nil)
        //---------------------------------------------------------------------------------------------
        
        /*2.) you can also import an html page you have created such as page.html I have Created
         so if we are going to reference a file inside iphone or simulater or file system we use bundle
         -- so remember if you want to load in a file, you going to need to bring in that file into your project or create the file in your project. Then you can reference the url to the file by calling bundle.main.url for resource , put that inside URLRequest , and then have the webview load the request.
         */
        /*  let url:URL = Bundle.main.url(forResource: "page", withExtension: "html")!
         //then we need a url request
         let req:URLRequest = URLRequest(url: url)
         //then all we do is tell the webView to load the request
         webView.load(req)
         */
        /*-----------------------------------------------------------------------------------------------
         3.) Lets say instead of loading a file we want to load data from a URL
         The process is similar to 2.)*/
        
        /*     let url:URL = URL(string: "https://www.google.com")!
         //then we need a url request
         let req:URLRequest = URLRequest(url: url)
         //then all we do is tell the webView to load the request
         webView.load(req)
         */
        
        /*---------------------------------------------------------------------------------
         4.) -- Now, when you're using a WK web view, this is currently your only option.
         And you also might need to create constraints with code later on down the line
         for other projects that you make. So for that reason, let's look at how it works.
         Now, when you add your auto layout constraints, you're actually going to ignore
         the frame of the object. So what I'm going to do is just change line 22 to delete
         the part that has the frame and just call it a WK web view constructor. */
        
        /*here is where you intanciate the webview inside viewDidLoad, you delete the frames*/
        webView = WKWebView() // doing this I know im not relying on this for the frame size
        /*now we need to add it to the screen*/
        view.addSubview(webView)
        
        let url:URL = URL(string: "https://www.google.com")!
        //then we need a url request
        let req:URLRequest = URLRequest(url: url)
        //then all we do is tell the webView to load the request
        webView.load(req)
        
        /*The first thing we're going to do is call out that we're going to have auto
         layout override the frame of the web view. Now, the name of that property is,
         translates auto resizing mask into constraints. So if we set that to false,
         then what that says is, don't use the FRAME for the layout, use the auto layout constraints.*/
        
        //have to set to false in order for autolayout constraints to work.
        webView.translatesAutoresizingMaskIntoConstraints = false
        /*So on the next line, let's actually create the constraint.
         So we'll define width first. And the width is going to be an NS layout constraint.
         I'm going to call the constructor that has item, attribute, related by, et cetera.
         Now, this has a lot of parameters to pass in, but they're actually pretty straight forward.
         Item is the view you want to layout, which in this case is going to be the web view.
         Attribute is the attribute that you want to modify, which in this case is going to be width.
         We can access it by typing Dot, Width. Related by is saying how it's going to be related to the other object.
         And this is pretty straight forward as well. When you type a Dot, you have three options. Do you want it equal,
         greater than or equal, or less than or equal. We're just going to go with equal. And then to item, is the item that we're laying it out to.
         Well we want the width to match the width of the parent view, so we just pass in view there.
         The attribute now is the attribute of the item that we want to match. So the first attribute parameter is
         referring to the web views width. The second attribute parameter is referring to the views width.
         So in other words it's saying, match the width property of the web view to the width of the view.
         So we'll type in Dot, Width here. And then multiplier allows us to multiply it by some amount,
         and for now we're just going to leave that at 1.0.
         You're pretty much always going to use one for this. And then the constant allows us to add to or subtract from the size. So if we want it to be width minus 20, we would put minus 20 in here, or plus 20, we'd put a positive 20 in there. Since we want it to be exactly the same width, we just put a zero in there. Now we'll do the same thing for the height attributes. We're going to find height, as NS layout constraint.
         Then just like before, the item is web view. Attribute is height, related by equal to item, view. Attribute, Dot, Height. Multiplier, 1.0. Constant is going to be zero. Finally what we need to do is connect these constraints to something.
         */
        let width = NSLayoutConstraint(item: webView, attribute: .width, relatedBy: .equal, toItem: view, attribute: .width, multiplier: 1.0, constant: 0)
        
        let height = NSLayoutConstraint(item: webView, attribute: .height, relatedBy: .equal, toItem: view, attribute: .height, multiplier: 1.0, constant: -20)  //constant so that the bottom is up by that many points in this case is -20
        
        //so what if you want to bring down the layout 20 points or etc
        let top = NSLayoutConstraint(item: webView, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1.0, constant: 20)
        //So we actually need to add the constraints to our view, not the web view.
        
        view.addConstraints([width,height,top])
        
    }   
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

