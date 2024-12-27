(define (notexists? n lst)
    (cond 
        ((null? lst) #t)
        ((= n (car lst)) #f)
        (else (notexists? n (cdr lst)))
    )
)

(define (filter lst curr)
    (cond
        ((null? lst) curr)
        ((notexists? (car lst) curr) (filter (cdr lst) (cons (car lst) curr)))
        (else (filter (cdr lst) curr))
    )
)

(define (unite lst)
    (if (null? lst) '()
        (append (car lst) (unite (cdr lst)))
    )
)

(define (union lst)
    (cond
        ((null? lst) '())
        ((= (length lst) 1) (car lst))
        (else (filter (reverse(unite lst)) '()))
    )
)

(display (union '()))(newline) ; '()
(display (union '( (a b c) )))(newline) ; '(a b c)
(display (union '( (2 5 4) (9 4 3) )))(newline) ; '(2 5 9 4 3)
(display (union '( (1 2) (2 4) (4 8) )))(newline) ; '(1 2 4 8)