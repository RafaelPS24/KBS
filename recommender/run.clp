;; --------------------------------------------------------
;; ARCHIVO: run.clp (Corregido v2)
;; DEFINE: Cómo cargar y ejecutar el sistema
;; --------------------------------------------------------

;; --- PASO 1: Cargar los archivos en orden ---
;; Escribe estas líneas en la terminal de CLIPS:

(load templates.clp)
(load facts.clp)
(load rules.clp)


;; --- PASO 2: Reiniciar la memoria ---
(reset)


;; --- PASO 3: Ver los hechos iniciales (Opcional) ---
;; (facts)


;; --- PASO 4: Ejecutar una orden de compra ---
;; Copia y pega un bloque de ejemplo en CLIPS y luego escribe (run)

;; --------------------------------------------------------
;; EJEMPLOS DE ÓRDENES PARA PROBAR:
;; --------------------------------------------------------

;;
;; EJEMPLO 1: Cliente c1 compra 30 iPhone 16 con Banamex (t1)
;;
;; (bind ?oid1 (gensym*))
;; (assert (orden-compra
;;    (orden-id ?oid1)
;;    (cliente-id c1)
;;    ;; --- CORRECCIÓN AQUÍ: 'metodo-pago' ahora es una lista plana ---
;;    (metodo-pago tipo tarjeta id-tarjeta t1)
;; ))
;; (assert (item-orden
;;    (orden-id ?oid1)
;;    (item-id p101)
;;    (qty 30)
;; ))
;; (run)


;;
;; EJEMPLO 2: Combo MacBook + iPhone al contado (Cliente c2)
;;
;; (bind ?oid2 (gensym*))
;; (assert (orden-compra
;;    (orden-id ?oid2)
;;    (cliente-id c2)
;;    ;; --- CORRECCIÓN AQUÍ: 'metodo-pago' ahora es una lista plana ---
;;    (metodo-pago tipo contado)
;; ))
;; (assert (item-orden (orden-id ?oid2) (item-id p201) (qty 1)))
;; (assert (item-orden (orden-id ?oid2) (item-id p101) (qty 1)))
;; (run)


;;
;; EJEMPLO 3: Compra con falta de stock (Cliente c1)
;;
;; (bind ?oid3 (gensym*))
;; (assert (orden-compra
;;    (orden-id ?oid3)
V   (cliente-id c1)
;;    ;; --- CORRECCIÓN AQUÍ: 'metodo-pago' ahora es una lista plana ---
;;    (metodo-pago tipo contado)
;; ))
;; (assert (item-orden (orden-id ?oid3) (item-id p202) (qty 99)))
;; (run)
;;