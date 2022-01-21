#lang racket/base
(require racket/gui/easy
         racket/gui/easy/operator)

(define @counter (@ 0))

(render
 (window
  (hpanel
   (button "Decrease"
           (λ ()
             (@counter . <~ . sub1)))
   (text (@counter . ~> . number->string))
   (button "Increase"
           (λ ()
             (@counter . <~ . add1))))))
