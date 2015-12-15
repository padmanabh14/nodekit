/*
* nodekit.io
*
* Copyright (c) 2015 Domabo. All Rights Reserved.
*
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*      http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/

import Cocoa

public class NKNSAppDelegate: NSObject, NSApplicationDelegate {
    
    var mainWindowView = NKUIWebView(urlAddress: "http://internal/splash/views/StartupSplash.html", title: "", width: 800, height: 600)
    
    var _nodekit : NKNodekit;
    
    let app: NSApplication
    
    public init(app: NSApplication) {
        self.app = app
        _nodekit = NKNodekit();
    }
    
    public func applicationDidFinishLaunching(aNotification: NSNotification) {
        _nodekit.run()
    }
    
    public func applicationWillTerminate(aNotification: NSNotification) {
        print("EXIT")
    }
    
    public func applicationShouldTerminateAfterLastWindowClosed(sender: NSApplication) -> Bool {
        return true
    }
    
}

/* Include the following in main.swift to call the above 

import Cocoa

let app      = NSApplication.sharedApplication()
let delegate = NKNSAppDelegate(app: app)
app.delegate = delegate
let menu = NKMenu(app: app)
app.setActivationPolicy(.Regular)
atexit_b { app.setActivationPolicy(.Prohibited); return }
app.activateIgnoringOtherApps(true)
app.run()

*/