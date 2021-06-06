(define (domain starcraft)
    (:requirements :strips :typing) ; Definición de requisitos básicos para el dominio.
    (:types 
        entity Localizacion - object
        Unidad Edificio Recurso - entity ; Supertipo 'entity' para incluir los tres elementos más importantes del juego.
    )
    (:constants ; Constantes para definir los subtipos de Unidad, Edificio y Recurso.
        VCE - Unidad
        CentroDeMando Barracones - Edificio
        Mineral Gas - Recurso
    )
    (:predicates
        (esTipo ?ent1 - entity ?ent2 - entity) ; Predicado para asignar los subtipos constantes a variables.
        (en ?ent - entity ?loc - Localizacion) ; Predicado para saber la ubicación de una entidad.
        (camino ?loc1 - Localizacion ?loc2 - Localizacion) ; Predicado para unir las localizaciones.
        (construido ?edf - Edificio) ; Predicado para saber si se ha construido un edificio en concreto.
        (extrayendo ?vce - Unidad ?re - Recurso) ; Predicado para saber si una unidad está asignada a un recurso.
    )
    (:action Navegar ; Desplazar la unidad de un punto a otro.
        :parameters (?un - Unidad ?origen - Localizacion ?destino - Localizacion)
        :precondition(and
                (en ?un ?origen) ; La unidad debe estar en la posición de origen.
                (camino ?origen ?destino) ; Debe haber un camino del origen al destino.
        )
        :effect (and
                (en ?un ?destino) ; La unidad queda en la posición de destino.
                (not (en ?un ?origen)) ; La unidad ya no está en la posición de origen.
        )
    )
    (:action Asignar ; Asignar un recurso a una unidad.
        :parameters (?un - Unidad ?locRecurso - Localizacion ?re - Recurso)
        :precondition(and 
                (en ?un ?locRecurso) ; La unidad debe estar en la ubicación del recurso.
                (en ?re ?locRecurso) ; El recurso debe estar en la ubicación pasada por parámetro.
        )
        :effect(and
                (extrayendo ?un ?re) ; La unidad queda asignada al recurso.
        )
    )
)