(define (problem ejercicio1)
    (:domain starcraft)
    (:objects
        VCE1 - Unidad
        CentroDeMando1 - Edificio
        LOC11 LOC12 LOC13 LOC14 - Localizacion
        LOC21 LOC22 LOC23 LOC24 - Localizacion
        LOC31 LOC32 LOC33 LOC34 - Localizacion
    )
    (:init
        (camino LOC11 LOC12)
        (camino LOC11 LOC21)
        
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
        
        (esTipo VCE1 VCE)
        (esTipo CentroDeMando1 CentroDeMando)
        (en VCE1 LOC11)
        (en CentroDeMando1 LOC11)
        (en Mineral LOC23)
        (en Mineral LOC33)
    )
    (:goal  (and
            (extrayendo VCE1 Mineral)
        )
    )
)