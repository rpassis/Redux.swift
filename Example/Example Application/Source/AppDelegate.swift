//
//  AppDelegate.swift
//  ReduxCounterExample
//
//  Created by Fellipe Caetano on 7/25/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    private let store = CounterStore()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey : Any]? = nil) -> Bool {
        let counterViewController = window?.rootViewController as? ReactiveCounterViewController
        counterViewController?.counter = store.asObservable()
        counterViewController?.dispatcher = store
        return true
    }
}
