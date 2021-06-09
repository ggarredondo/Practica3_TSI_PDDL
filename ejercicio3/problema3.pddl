(define (problem ejercicio3)
    (:domain starcraft)
    (:objects
        VCE1 VCE2 VCE3 - Unidad
        Extractor1 Barracones1 CentroDeMando1 - Edificio
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
        (esTipo CentroDeMando1 CentroDeMando) ; Asignación del tipo CentroDeMando al edificio CentroDeMando1.
        (construido CentroDeMando1) ; CentroDeMando1 ya está construido.
        (esTipo Extractor1 Extractor) ; Asignar el tipo Extractor al edificio Extractor1.
        (esTipo Barracones1 Barracones) ; Asignar el tipo Barracones al edificio Barracones1.
        (necesita Extractor Mineral) ; Los extractores necesitan Mineral para su construcción.
        (necesita Barracones Mineral) ; Los Barracones necesitan Mineral
        (necesita Barracones Gas) ; y Gas.
        (en VCE1 LOC11) ; VCE1 se encuentra en LOC11.
        (en VCE2 LOC11) ; VCE2 se encuentra en LOC11.
        (en VCE3 LOC11) ; VCE3 se encuentra en LOC11.
        (en CentroDeMando1 LOC11) ; CentroDeMando1 está en LOC11.
        (en Mineral LOC23) ; Hay Mineral en LOC23.
        (en Mineral LOC33) ; Hay Mineral en LOC33.
        (en Gas LOC13) ; Hay Mineral en LOC13.
    )
    (:goal  (and
            (en Barracones1 LOC32) ; Construcción de Barracones1 en LOC32.
        )
    )
)