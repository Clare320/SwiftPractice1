//
//  LJTheme.swift
//  001
//
//  Created by Kede on 2019/12/12.
//  Copyright © 2019 Clare. All rights reserved.
//

import UIKit

public protocol LJTheme {
    var name: String { get set }
    var defaultBackgroundColor: UIColor { get set }
    var navigationBarColor: UIColor { get set }
    var tintColor: UIColor { get set }
    var textColor: UIColor { get set }
    var tableViewBackgroundColor: UIColor { get set }
    var tableViewCellColor: UIColor { get set }
}
