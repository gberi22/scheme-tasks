(define (count lst1 lst2)
    (cond
        ((null? lst2) 0)
        ((equal? lst1 (car lst2))1)
        (else (count lst1 (cdr lst2)))
    )
)

(define (set lst)
    (cond
        ((null? lst) '())
        ((= 0 (count (car lst) (cdr lst))) (append (list (car lst)) (set (cdr lst))))
        (else (set (cdr lst)))
    )
)

(define (filter_fn lst s)
    (cond
        ((null? lst) '())
        ((= (apply + (car lst)) s) (append (list (car lst)) (filter_fn (cdr lst) s))) 
        (else (filter_fn (cdr lst) s))
    )
)
; (display (filter_fn '((1 2) (2 3) (3 4) (2 5)) 7)) (newline)

(define (ksubset k lst)
    (cond 
        ((= k 0) '( () ))
        ((> k (length lst)) '())
        ((= k (length lst)) (list lst))
        (else 
            (append
                (map (lambda (x) (cons (car lst) x)) (ksubset (- k 1) (cdr lst)))
                (ksubset k (cdr lst))
            )
        )
    )
)
; (display (ksubset 2 '(1 2 3 4))) (newline)


(define (sum-set lst k s)
    (set(filter_fn (ksubset k lst) s))
)


(display (sum-set '(1 2 3 4) 2 5)) (newline) ; --> ‘((1 4) (2 3))
(display (sum-set '(2 2 1 5 6) 3 9)) (newline) ; --> ‘((2 2 5) (2 1 6))
(display (sum-set '(1 1 1 1 1 1) 4 5)) (newline) ; --> ‘()	
(display (sum-set '(1 1 1 1 1 1) 4 4)) (newline) ; --> ‘((1 1 1 1))
(display (sum-set '(1 2 3 4 5 6 7 8 9 10) 2 15)) (newline) ; --> ‘((5 10) (6 9) (7 8))