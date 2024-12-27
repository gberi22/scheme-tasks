(define (counter x lst)
    (apply + (map (lambda (y) (if (equal? x y) 1 0)) lst))
)

(define (set lst)
    (cond
        ((null? lst) '())
        ((= 0 (counter (car lst) (cdr lst))) (cons (car lst) (set (cdr lst))))
        (else (set (cdr lst)))
    )
)

(define (histogram lst)
    (map (lambda(x) (list x (counter x lst)))(set lst))
)

(display (histogram '(1 2 3 4 1 2 3)))(newline) ; '( (1 2) (2 2) (3 2) (4 1) )
(display (histogram '(1 (1 2) 1 3)))(newline) ; '( (1 2) ((1 2) 1) (3 1) )
(display (histogram '(2 1 2 2)))(newline) ; '( (2 3) (1 1) )