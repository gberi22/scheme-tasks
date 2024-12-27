(define (filter_ lst)
    (cond
        ((null? lst) '())
        ((> (length (car lst)) (length(filter_ (cdr lst)))) (car lst))
        (else (filter_ (cdr lst)))
    )
)

; (display (filter_ '( (1 2 3) (4 5 6) (12 21 41)) ))(newline)

(define (longestUniqum lst)
    (if (null? lst) '()
        
    )
)


(display (longestUniqum '(1 2 3 4 2 3 4 1 2)))(newline) ; '(3 4 1 2)
(display (longestUniqum '(1 2 4 3 5 6 5 4 3)))(newline) ; '(1 2 4 3 5 6)



;; lukas amoxsna

; (define (contains lst x)
;     (cond 
;     ((null? lst) #f)
;     ((or (equal? (car lst) x) (contains (cdr lst) x)))
;     )
; )


; (define (isUniqum? lst)
;     (cond 
;     ((null? lst) #t)
;     (else (and (not (contains (cdr lst) (car lst))) (isUniqum? (cdr lst))))
;     )
; )

; (define (getUniqums lst len res curr)
;     (cond 
;     ((null? lst) 
;         (cond 
;             ((isUniqum? curr) (cons curr res))
;             (else res)
;         )
;     )
;     ((< (length curr) len) (getUniqums (cdr lst) len res (append curr (list (car lst)))))
;     ((isUniqum? curr) (getUniqums (cdr lst) len (cons curr res) (append (cdr curr) (list (car lst)))))
;     (else (getUniqums (cdr lst) len res (append (cdr curr) (list (car lst)))))
;     )
; )

; (define (getMaxUniqums lst len)
;     (cond 
;     ((zero? len) '())
;     ((null? (getUniqums lst len '() '())) (getMaxUniqums lst (- len 1)))
;     (else (car (getUniqums lst len '() '())))
;     )
; )

; (define (longestUniqum lst)
;     (getMaxUniqums lst (length lst))
; )

; (display (longestUniqum '(1 2 3 4 2 3 4 1 2)))(newline) ; '(3 4 1 2)
; (display (longestUniqum '(1 2 4 3 5 6 5 4 3)))(newline) ; '(1 2 4 3 5 6)
