#lang racket/base
(require racket/gui/base
         racket/class
         racket/format)

(define @counter 0)

(define (decrease!)
  (set! @counter (sub1 @counter))
  (send view set-value (~a @counter)))
(define (increase!)
  (set! @counter (add1 @counter))
  (send view set-value (~a @counter)))

(define frame (new frame% [label "Counter"]))
(define pane (new horizontal-pane% [parent frame]))
(define _but-sub (new button% [parent pane]
                      [label "Decrease"]
                      [callback (λ (btn event)
                                  (decrease!))]))
(define view (new text-field% [parent pane]
                  [label ""]
                  [init-value "0"]
                  [enabled #f]
                  [min-width 100]))
(define _but-add (new button% [parent pane]
                      [label "Increase"]
                      [callback (λ (btn event)
                                  (increase!))]))

(send* frame
  [center]
  [show #t])
