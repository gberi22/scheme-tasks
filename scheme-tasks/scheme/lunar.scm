(define (mtvleli num len)
   (if (= len 0) num
      (* 10 (mtvleli num (- len 1)))
   )
)

(define (finalAns lst)
   (if (null? lst) 0
      (+ (mtvleli (car lst) (- (length lst) 1)) (finalAns (cdr lst)))   
   )
)

(define (complsum lst1 lst2)
   (if (= (length lst1) (length lst2)) (ezsum lst1 lst2)
      (cons (car lst1) (complsum (cdr lst1) lst2))
   )
)

(define (ezsum lst1 lst2)
  (cond 
    ((null? lst1) '())
    ((> (car lst1) (car lst2))(cons (car lst1) (ezsum (cdr lst1) (cdr lst2))))
    (else (cons (car lst2) (ezsum (cdr lst1) (cdr lst2))))
  )
)


(define (func lst1 lst2)
  (cond
    ((= (length lst1) (length lst2)) (ezsum lst1 lst2) )
    ((> (length lst1) (length lst2)) (complsum lst1 lst2) )
    (else (func lst2 lst1))
  )
)

(define (helper x)
  (if (= x 0) '()
    (cons (remainder x 10) (helper (div x 10)))
  )
)

(define (lunar_addition a b)
   (finalAns (func (reverse (helper a)) (reverse (helper b))))
)


;; !!!ამ ხაზის ქვემოთ არაფერი შეცვალოთ!!!
; 1
(display (if (equal? (lunar_addition 1 
                                     7)
                                     7) "1 SUCCESS" "1 FAILURE"))(newline)
; 2
(display (if (equal? (lunar_addition 95 
                             7123241128)
                             7123241198) "2 SUCCESS" "2 FAILURE"))(newline)
; 3
(display (if (equal? (lunar_addition 357
                                      64) 
                                     367) "3 SUCCESS" "3 FAILURE"))(newline)
; 4
(display (if (equal? (lunar_addition 431
                                   50902) 
                                   50932) "4 SUCCESS" "4 FAILURE"))(newline)
; 5
(display (if (equal? (lunar_addition 62745281910
                                       463628366) 
                                     62765688966) "5 SUCCESS" "5 FAILURE"))(newline)
