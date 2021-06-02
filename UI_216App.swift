//
//  UI_216App.swift
//  UI-216
//
//  Created by にゃんにゃん丸 on 2021/06/02.
//

import SwiftUI

@main
struct UI_216App: App {
    @NSApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

class AppDelegate: NSObject,NSApplicationDelegate {
    var statasItem : NSStatusItem?
    var popOver = NSPopover()
    
    func applicationDidFinishLaunching(_ notification: Notification) {
        
        let menuView = MenuView()
        popOver.behavior = .transient
        popOver.animates = true
        
        popOver.contentViewController = NSViewController()
        
        popOver.contentViewController?.view = NSHostingView(rootView: menuView)
        
        popOver.contentViewController?.view.window?.makeKey()
        
        statasItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
        
        
        if let menueButton = statasItem?.button{
            menueButton.image = NSImage(systemSymbolName: "gear", accessibilityDescription: nil)
            menueButton.action = #selector(MenuButton)
            
            
            
        }
        
        
        
    }
    
    @objc func MenuButton(sender : AnyObject){
        
        if popOver.isShown{
            
            popOver.performClose(sender)
            
            
        }
        
        else{
            
            
            if let menubutton = statasItem?.button{
                
                self.popOver.show(relativeTo: menubutton.bounds, of: menubutton, preferredEdge: .minY)
                
            }
            
        }
        
        
    }
}
