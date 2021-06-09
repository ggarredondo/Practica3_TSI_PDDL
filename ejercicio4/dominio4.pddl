(define (domain starcraft)
    (:requirements :strips :typing) ; Definición de requisitos básicos para el dominio.
    (:types 
        entity Localizacion - object
        Unidad Edificio Recurso - entity ; Supertipo 'entity' para incluir los tres elementos más importantes del juego.
    )
    (:constants ; Constantes para definir los subtipos de Unidad, Edificio y Recurso.
        VCE Marine Segador - Unidad
        CentroDeMando Barracones Extractor - Edificio
        Mineral Gas - Recurso
    )
    (:predicates
        (esTipo ?ent1 - entity ?ent2 - entity) ; Predicado para asignar los subtipos constantes a variables.
        (en ?ent - entity ?loc - Localizacion) ; Predicado para saber la ubicación de una entidad.
        (camino ?loc1 - Localizacion ?loc2 - Localizacion) ; Predicado para unir las localizaciones.
        (construido ?edf - Edificio) ; Predicado para saber si se ha construido un edificio en concreto.
        (extrayendo ?vce - Unidad ?re - Recurso) ; Predicado para saber si una unidad está asignada a un recurso.
        (generando ?re - Recurso) ; Predicado para saber si se está generando un recurso independientemente de la unidad.
        (necesita ?edf - Edificio ?re - Recurso) ; Predicado para saber qué tipo de recurso necesita un edificio para ser construido.
        (reclutado ?un - Unidad) ; Predicado para saber si una unidad ha sido reclutada.
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
    (:action Asignar ; Asignar un recurso a un VCE.
        :parameters (?un - Unidad ?locRecurso - Localizacion ?re - Recurso)
        :precondition(and 
                (not (extrayendo ?un ?re)) ; Comprobar que la unidad no está ya asignada al recurso.
                (esTipo ?un VCE) ; Comprobar que la unidad es un VCE.
                (or ; Disyunción para comprobar que, en caso de que el recurso sea Gas, haya un extractor en el nodo.
                    (= ?re Mineral) ; Debe ser mineral ó
                    (and
                        (= ?re Gas) ; ser gas y
                        (exists (?edf - Edificio) ; haber extractor.
                            (and
                                (en ?edf ?locRecurso) ; Comprobamos que hay un edificio en la localización
                                (esTipo ?edf Extractor) ; y que ese edificio es un extractor.
                            )
                        )
                    )
                )
                (en ?un ?locRecurso) ; La unidad debe estar en la ubicación del recurso.
                (en ?re ?locRecurso) ; El recurso debe estar en la ubicación pasada por parámetro.
        )
        :effect(and
                (extrayendo ?un ?re) ; La unidad queda asignada al recurso.
                (generando ?re) ; Se establece que se está generando dicho recurso.
        )
    )
    (:action Construir ; Construir un edificio.
        :parameters (?un - Unidad ?edf - Edificio ?loc - Localizacion)
        :precondition(and
            (esTipo ?un VCE) ; Comprobar que la unidad es un VCE.
            (not (construido ?edf)) ; El edificio no ha sido construido ya.
            (not (extrayendo ?un Mineral)) ; La unidad no está ocupada extrayendo mineral
            (not (extrayendo ?un Gas)) ; ó gas.
            (en ?un ?loc) ; La unidad se encuentra en la localización donde se va a construir el edificio.
            (exists (?tipoEdf - Edificio) ; Comprobamos si está definido el tipo de edificio para edf
                (and
                    (esTipo ?edf ?tipoEdf)
                    (forall (?re - Recurso) ; para luego comprobar los requisitos de construcción para ese tipo.
                        (imply (necesita ?tipoEdf ?re) ; Si el tipo necesita un recurso...
                            (generando ?re) ; ...el recurso debe estar siendo extraído.
                        )
                    )
                )
            )
        )
        :effect(and
            (en ?edf ?loc) ; El edificio queda construido en dicho nodo.
            (construido ?edf) ; Se establece que el edificio ya ha sido construido.
        )
    )
    (:action Reclutar
        :parameters (?edf - Edificio ?un - Unidad ?loc - Localizacion)
        :precondition(and
            (not (reclutado ?un))
            (generando Mineral)
            (en ?edf ?loc)
            (or
                (and
                    (esTipo ?un VCE)
                    (esTipo ?edf CentroDeMando)
                )
                (and
                    (esTipo ?un Marine)
                    (esTipo ?edf Barracones)
                )
                (and
                    (esTipo ?un Segador)
                    (generando Gas)
                    (esTipo ?edf Barracones)
                )
            )
        )
        :effect(and
            (en ?un ?loc)
            (reclutado ?un)
        )
    )
)