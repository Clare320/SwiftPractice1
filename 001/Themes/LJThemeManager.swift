//
//  LJThemeManager.swift
//  001
//
//  Created by Kede on 2019/12/12.
//  Copyright © 2019 Clare. All rights reserved.
//

import UIKit

let kCurrentThemeIndexKey = "CurrentThemeIndex"

class LJThemeManager {
    var currentTheme: LJTheme? = .none
    
    let themes: [LJTheme] = [LJDarkTheme(), LJLightTheme()]
    
    class var shared: LJThemeManager {
        struct Static {
            static let sharedInstance = LJThemeManager()
        }
        
        return Static.sharedInstance
    }
    
    var themeIndex: Int {
        get {
            if let index = UserDefaults.standard.object(forKey: kCurrentThemeIndexKey) as? NSNumber {
                if index.isKind(of: NSNumber.self) {
                    return min(themes.count - 1, index.intValue)
                }
            }
            return 0
        }
        set {
            let newNumber = NSNumber(value: newValue)
            UserDefaults.standard.setValue(newNumber, forKey: kCurrentThemeIndexKey)
            UserDefaults.standard.synchronize()
        }
    }
    
    func activateTheme() -> Void {
        activateTheme(themes[themeIndex])
    }
    
    func activateTheme(_ theme: LJTheme) {
        currentTheme = theme
        
        UIWindow.appearance().tintColor = theme.tintColor
        
        UINavigationBar.appearance().barTintColor = theme.navigationBarColor
        UINavigationBar.appearance().tintColor = theme.tintColor
        UINavigationBar.appearance().backgroundColor = UIColor.clear
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: theme.textColor]
        
        UITableView.appearance().backgroundColor = theme.tableViewBackgroundColor
        UITableViewCell.appearance().backgroundColor = theme.tableViewCellColor
        UITableViewCell.appearance().tintColor = theme.tintColor
        UITableViewCell.appearance().selectionStyle = UITableViewCell.SelectionStyle.none
    }
    
    func activeNextTheme() {
        print("change theme")
        
        var index = themeIndex
        index += 1
        if index >= themes.count {
            themeIndex = 0
        } else {
            themeIndex = index
        }
        
        activateTheme(themes[themeIndex])
        
        let windows = UIApplication.shared.windows
        
        for window in windows {
            for view in window.subviews {
                view.removeFromSuperview()
                window.addSubview(view)
            }
        }
        
    }
}
