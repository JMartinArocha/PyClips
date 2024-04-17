

(deftemplate Camino
    (slot Inicio)
    (slot Destino)
    (slot Coste)
)

(deffacts Nodos
(Camino (Inicio A) (Destino B) (Coste 10))
(Camino (Inicio A) (Destino C) (Coste 30))
(Camino (Inicio A) (Destino D) (Coste 100))
(Camino (Inicio B) (Destino C) (Coste 5))
(Camino (Inicio B) (Destino D) (Coste 1000))
(Camino (Inicio C) (Destino D) (Coste 7)))

(defrule actualizar
    ?hecho1 <- (Camino (Inicio ?Inicio) (Destino ?Destino) (Coste ?Coste1))
    (Camino (Inicio ?Intermedio) (Destino ?Destino) (Coste ?Coste2))
    (Camino (Inicio ?Inicio) (Destino ?Intermedio) (Coste ?Coste3))
    (test (< (+ ?Coste2 ?Coste3) ?Coste1))
    =>
    (modify ?hecho1 (Coste (+ ?Coste2 ?Coste3))))

(defrule encontrar-camino-mas-corto
    ?camino <- (Camino (Inicio ?Inicio) (Destino ?Destino) (Coste ?costo))
    (not (Camino (Inicio ?Inicio) (Destino ?Destino) (Coste ?otro&:(< ?otro ?costo))))
    =>
    (printout t "Probando camino: " ?Inicio " a " ?Destino " Resultado con costo: " ?costo crlf))
