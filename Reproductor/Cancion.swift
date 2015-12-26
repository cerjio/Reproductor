//
//  Cancion.swift
//  Reproductor
//
//  Created by cerjio on 25/12/15.
//  Copyright © 2015 cerjio. All rights reserved.
//

import UIKit

class Cancion: NSObject {
    
    var nombreCancion : String = ""
    var portada : UIImage? = nil
    
    init(nombreCancion: String, portada: UIImage) {
    
        self.nombreCancion = nombreCancion
        self.portada = portada
    }
    

}
