//
//  MKMapView+Ex.swift
//  RemindersPlus
//
//  Created by Augus on 7/2/16.
//  Copyright © 2016 iAugus. All rights reserved.
//

import MapKit

extension MKMapView {
    
    func fixMKMapViewMemoryLeaking(closure: Closure?) {
        
        switch mapType {
            
        case .hybrid:
            mapType = .standard
        case .standard:
            mapType = .hybrid
        default:
            break
        }
        
        showsUserLocation = false
        delegate = nil
        removeFromSuperview()
        
        closure?()
        
        var weakSelf: MKMapView? = self
        weakSelf = nil
        weakSelf?.delegate = nil
    }
}
