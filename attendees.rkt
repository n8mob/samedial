;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname attendees) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
(define ATTENDEES_BASE 120)
(define TICKET_BASE 5.00)
(define performance-cost 180)
(define attendee-cost 1.50)

(define (attendees ticket-price)
  (- ATTENDEES_BASE (* (- ticket-price TICKET_BASE) (/ 15 0.1))))
(define (revenue ticket-price)
  (* ticket-price (attendees ticket-price)))

(define (cost ticket-price)
  (* attendee-cost (attendees ticket-price)))

(define (profit ticket-price)
  (- (revenue ticket-price)
     (cost ticket-price)))

(define (profit2 price)
  (- (* (+ 120
           (* (/ 15 0.1)
              (- 5.0 price)))
        price)
     
        (* 1.50
           (+ 120
              (* (/ 15 0.1)
                 (- 5.0 price))))))


(profit 3)
(profit2 3)
(profit 4)
(profit2 4)
(profit 5)
(profit2 5)