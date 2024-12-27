(define (check x lst)
    (cond 
        ((null? lst) #f)
        ((equal? x (car lst)) #t)
        (else (check x (cdr lst)))
    )
)

(define (helper lst1 lst2 curr)
    ; (map (lambda(x) (if (check x lst2) x ))lst1)
    
    ;; orr
    
    (cond
        ((null? lst1) (reverse curr))
        ((check (car lst1) lst2) (helper (cdr lst1) lst2 (cons (car lst1) curr)  ) )
        (else (helper (cdr lst1) lst2 curr))
    )
)

(define (intersect lst1 lst2)
    (helper lst1 lst2 '())
)

(display (intersect '(a b c e f t) '(a b d e)))(newline) ; '(a b)
(display (intersect '((a b) c (d)) '(a b c e (d))))(newline) ; '(c (d))
