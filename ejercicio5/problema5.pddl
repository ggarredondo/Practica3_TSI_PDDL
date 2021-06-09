(define (problem ejercicio3)
    (:domain starcraft)
    (:objects
        VCE1 VCE2 VCE3 Marine1 Marine2 Segador1 - Unidad
        Extractor1 Barracones1 CentroDeMando1 BahiaDeIngenieria1 - Edificio
        LOC11 LOC12 LOC13 LOC14 - Localizacion ; Definición del grafo.
        LOC21 LOC22 LOC23 LOC24 - Localizacion
        LOC31 LOC32 LOC33 LOC34 - Localizacion
    )
    (:init
        (camino LOC11 LOC12) ; Inicialización del grafo estableciendo los caminos
        (camino LOC11 LOC21) ; en ambos sentidos.
        
        (camino LOC12 LOC11)
        (camino LOC12 LOC22)
        
        (camino LOC13 LOC14)
        (camino LOC13 LOC23)
        
        (camino LOC14 LOC13)
        (camino LOC14 LOC24)
        
        (camino LOC21 LOC11)
        (camino LOC21 LOC31)
        
        (camino LOC22 LOC12)
        (camino LOC22 LOC23)
        (camino LOC22 LOC32)
        
        (camino LOC23 LOC13)
        (camino LOC23 LOC22)
        
        (camino LOC24 LOC14)
        (camino LOC24 LOC34)
        
        (camino LOC31 LOC21)
        (camino LOC31 LOC32)
        
        (camino LOC32 LOC22)
        (camino LOC32 LOC31)
        
        (camino LOC33 LOC34)
        
        (camino LOC34 LOC24)
        (camino LOC34 LOC33)
        
        (esTipo VCE1 VCE) ; Asignar el tipo VCE a la unidad VCE1.
        (esTipo VCE2 VCE) ; Asignar el tipo VCE a la unidad VCE2.
        (esTipo VCE3 VCE) ; Asignar el tipo VCE a la unidad VCE3.
        (reclutado VCE1) ; VCE1 ya está reclutado.
        (esTipo Marine1 Marine) ; Asignar el tipo Marine a la unidad Marine1.
        (esTipo Marine2 Marine) ; Asignar el tipo Marine a la unidad Marine2.
        (esTipo Segador1 Segador) ; Asignar el tipo Sesgador a la unidad Sesgador1.
        (esTipo CentroDeMando1 CentroDeMando) ; Asignación del tipo CentroDeMando al edificio CentroDeMando1.
        (construido CentroDeMando1) ; CentroDeMando1 ya está construido.
        (esTipo Extractor1 Extractor) ; Asignar el tipo Extractor al edificio Extractor1.
        (esTipo Barracones1 Barracones) ; Asignar el tipo Barracones al edificio Barracones1.
        (esTipo BahiaDeIngenieria1 BahiaDeIngenieria) ; Asignar el tipo BahiaDeIngenieria al edificio BahiaDeIngenieria1.
        (necesita Extractor Mineral) ; Los extractores necesitan Mineral para su construcción.
        (necesita Barracones Mineral) ; Los Barracones necesitan Mineral
        (necesita Barracones Gas) ; y Gas.
        (necesita BahiaDeIngenieria Mineral) ; Las bahías de ingeniería necesitan Mineral
        (necesita BahiaDeIngenieria Gas) ; y Gas.
        (en VCE1 LOC11) ; VCE1 se encuentra en LOC11.
        (en CentroDeMando1 LOC11) ; CentroDeMando1 está en LOC11.
        (en Mineral LOC23) ; Hay Mineral en LOC23.
        (en Mineral LOC33) ; Hay Mineral en LOC33.
        (en Gas LOC13) ; Hay Mineral en LOC13.
    )
    (:goal  (and
            (en Marine1 LOC31) ; Disponer de un marine (Marine1) en la localización LOC31,
            (en Marine2 LOC24) ; otro  marine  (Marine2)  en  la  localización  LOC24, 
            (en Segador1 LOC12) ; y  un  segador (Segador1)  en  la  localización LOC12.
            (en Barracones1 LOC32) ; Barracones1 debe estár en la localización LOC32.
        )
    )
)