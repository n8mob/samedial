;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Car) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
(define wheel-radius 10)
(define scene-width (* wheel-radius 12))
(define scene-height (* wheel-radius 5))
(define car-scene (empty-scene scene-width scene-height))
(define spacer-color "white")
(define car-color "blue")
(define fill-mode "solid")
(define roof-height (* wheel-radius 3/2))

(define car-roof (beside
 (rectangle (* wheel-radius 2) roof-height fill-mode spacer-color)
 (rotate 45 (triangle/saa (* wheel-radius 3/2) 45 90 fill-mode car-color))
 (rectangle (* wheel-radius 5) roof-height fill-mode car-color)
 (right-triangle (* wheel-radius 1) (* wheel-radius 12/8) fill-mode car-color)))

(define car-body (rectangle (* wheel-radius 12) (* wheel-radius 2) fill-mode car-color))

(define wheel (circle wheel-radius fill-mode "black"))
(define wheels (overlay/xy wheel (* wheel-radius 6) 0 wheel))
(define car-bottom (overlay/offset wheels 0 (* wheel-radius -1) car-body))

(define CAR (overlay/xy car-roof 0 roof-height car-bottom))
(define car-height (image-height CAR))
(define car-width (image-width CAR))

(define background-height (* car-height 3/2))
(define background-width (* car-width 5))
(define car-start-x (/ car-width 2))
(define car-start-y (- background-height (/ car-height 2)))
(define BACKGROUND (empty-scene background-width background-height))


; WorldState -> Image
; places the car into the BACKGROUND scene,
; according to the given world state
(define (render ws)
  (place-image CAR (+ car-start-x ws) car-start-y BACKGROUND))
(check-expect (render 0) (place-image CAR (+ car-start-x 0) car-start-y BACKGROUND))
(check-expect (render 50) (place-image CAR (+ car-start-x 50) car-start-y BACKGROUND))
(check-expect (render 100) (place-image CAR (+ car-start-x 100) car-start-y BACKGROUND))
(check-expect (render 150) (place-image CAR (+ car-start-x 150) car-start-y BACKGROUND))
(check-expect (render 200) (place-image CAR (+ car-start-x 200) car-start-y BACKGROUND))

(define (tock ws) (+ ws 5))
(define (main ws)
  (big-bang ws
    [on-tick tock]
    [to-draw render]))