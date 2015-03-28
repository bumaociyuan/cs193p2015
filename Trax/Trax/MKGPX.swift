//
//  MKGPX.swift
//  Trax
//
//  Created by zx on 3/28/15.
//  Copyright (c) 2015 zztx. All rights reserved.
//

import MapKit

extension GPX.Waypoint: MKAnnotation {
    var coordinate: CLLocationCoordinate2D {
        return CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
    
     var title: String! { return name}
     var subtitle: String! { return info }
    
    var thumbnailURL: NSURL? {
        return getImageURLofType("thumbnail")
    }
    
    var imageURL: NSURL? {
        return getImageURLofType("large")
    }
    
    private func getImageURLofType(type: String) -> NSURL?{
        for link in links {
            if link.type == type {
                return link.url
            }
        }
        return nil
    }
}
