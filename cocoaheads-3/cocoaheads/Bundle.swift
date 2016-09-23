//
//  Bundle.swift
//  cocoaheads
//
//  Created by Gabriel Bremond on 02/09/16.
//  Copyright © 2016 photograve. All rights reserved.
//

import Foundation
import ObjectiveC.objc_runtime

class Bundle: Foundation.Bundle {
    
    static let associate:() = {
        object_setClass(Foundation.Bundle.main, Bundle().classForCoder)
    } ()
    
    override func localizedString(forKey key: String, value: String?, table tableName: String?) -> String {
        let bundle = objc_getAssociatedObject (self, &kBundleKey) as? Bundle
        
        if (bundle != nil) {
            return bundle!.localizedString(forKey: key, value: value, table: tableName)
        } else {
            return super.localizedString(forKey: key, value: value, table: tableName)
        }
    }
}


var kBundleKey: UInt8 = 0

extension Foundation.Bundle {
    
    func setLanguage(_ language: String, fallback: String) {
        
        Bundle.associate
        
        let mainbundle = Foundation.Bundle.main
        
        var path = mainbundle.path(forResource: language, ofType: "lproj")
        
        if (path == nil && fallback != "") {
            path = mainbundle.path(forResource: fallback, ofType: "lproj")
        }
        
        if (path != nil) {
            objc_setAssociatedObject(mainbundle, &kBundleKey, Bundle(path: path!), .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
}

