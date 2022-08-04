#lang racket/base
(require racket/gui)

(define (celsius->fahrenheit c)
  (+  (* c 9/5) 32))
(define (fahrenheit->celsius f)
  (* (- f 32) 5/9))

(define frame (new frame% [label "Temperature converter"]))
(define pane (new horizontal-pane% [parent frame]))

(letrec ([celsius-text
          (new text-field% [parent pane]
               [label "celsius"]
               [init-value "0"]
               [callback (λ (text-field event)
                           (define c (string->number (send text-field get-value)))
                           (when c
                             (send fahrenheit-text set-value
                                   ((compose number->string fahrenheit->celsius) c))))]
               [min-width 300])]
         [fahrenheit-text
          (new text-field% [parent pane]
               [label "fahrenheit"]
               [init-value "0"]
               [callback (λ (text-field event)
                           (define f (string->number (send text-field get-value)))
                           (when (number? f)
                             (send celsius-text set-value
                                   ((compose number->string celsius->fahrenheit) f))))]
               [min-width 300])])
  (void))

(send* frame
  [center]
  [show #t])
