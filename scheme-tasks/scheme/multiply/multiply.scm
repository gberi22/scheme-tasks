(define (func n x curr)
    (if (= n 0) curr
        (cons x (func (- n 1) x curr))
    )
)

(define (multiply n lst)
    (if (null? lst) '()
        (append (func n (car lst) '()) (multiply n (cdr lst)))
    )
)   

(display (multiply 2 '(a 3 5)))(newline) ; '(a a 3 3 5 5)
(display (multiply 3 '( (1) 3 )))(newline) ; '( (1) (1) (1) 3 3 3 )