(define (divisors-helper n k)
    (cond
        ((< (div n 2) k) 0)
        ((= (remainder n k) 0) (+ k (divisors-helper n (+ k 2))))
        (else (divisors-helper n (+ k 2)))
    )
    
)

(define (odd-divisors n)
    (if (= (remainder n 2) 1) (+ n (divisors-helper n 1))
        (divisors-helper n 1)
    )
)

(display (odd-divisors 24))(newline) ; 4
(display (odd-divisors 17))(newline) ; 18
(display (odd-divisors 15))(newline) ; 24
(display (odd-divisors 2))(newline) ; 1
(display (odd-divisors 0))(newline) ; 0
(display (odd-divisors 11))(newline) ; 12