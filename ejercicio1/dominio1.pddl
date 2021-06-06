(define (domain starcraft)
    (:requirements :strips :typing)
    (:types 
        entity Localizacion - object
        Unidad Edificio Recurso - entity
    )
    (:constants
        VCE - Unidad
        CentroDeMando Barracones - Edificio
        Mineral Gas - Recurso
    )
    (:predicates
        (esTipo ?ent1 - entity ?ent2 - entity)
        (en ?ent - entity ?loc - Localizacion)
        (camino ?loc1 - Localizacion ?loc2 - Localizacion)
        (construido ?edf - Edificio)
        (extrayendo ?vce - Unidad ?re - Recurso)
    )
    (:action Navegar
        :parameters (?un - Unidad ?origen - Localizacion ?destino - Localizacion)
        :precondition(and
                (en ?un ?origen)
                (camino ?origen ?destino)
        )
        :effect (and
                (en ?un ?destino)
                (not (en ?un ?origen))
        )
    )
    (:action Asignar
        :parameters (?un - Unidad ?locRecurso - Localizacion ?re - Recurso)
        :precondition(and 
                (en ?un ?locRecurso)
                (en ?re ?locRecurso)
        )
        :effect(and
                (extrayendo ?un ?re)
        )
    )
)