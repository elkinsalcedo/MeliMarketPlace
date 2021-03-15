//
//  LoadingViewUtil.swift
//
//  Created by Elkin.Salcedo on 3/13/21.
//  Copyright © 2020 Desarrollador. All rights reserved.
//

import Foundation
import ACProgressHUD_Swift

class LoadingView{

    static func show(){
        ACProgressHUD.shared.progressText = LOADING_MESSAGE
        ACProgressHUD.shared.showHUD()
    }

    static func hide(){
        ACProgressHUD.shared.hideHUD()
    }
}
