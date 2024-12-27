(define (help lst cur len)
    (cond 
        ((null? lst) '(() ()))
        ((> cur len) (cons (car lst) (cadr (help (cdr lst) (+ cur 1) len))))
        (else (cons (car lst) (car (help (cdr lst) (+ cur 1) len))))
    )
)   


(define (chveni lst)
    (help lst 0 (div (length lst) 2))
)

(display (chveni '(1 2 3 4 5 6 7 8 9 10)))(newline) ; ((1 2 3 4 5) (6 7 8 9 10)) 