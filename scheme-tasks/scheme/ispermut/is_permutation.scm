;;შემოდის ორი ლისტი, თქვენი მიზანია შეამოწმოთ არის თუ არა მეორე ლისტი, პირველის რაღაც პერმუტაცია. 
;;(სასურველია ეს ამოცანა ამოხსნათ სორტირების გარეშე)


(define (filter_ filter_fn lst)
  (cond 
	 ((null? lst) '())
	 ((filter_fn (car lst)) (cons (car lst) (filter_ filter_fn (cdr lst)) )  ) ; true means keep
	 (else (filter_ filter_fn (cdr lst)))
	 )
  )

(define (removeallx x l)
  (filter_ (lambda (e) (not (= x e))) l  )
  )

(define (removeallx x l)
  (filter_ (lambda (e) (not (= x e))) l  )
  )

(define (permutation? l1 l2)
  (cond 
	 ((and (null? l1) (null? l2)) #t)
	 ((not (= (length l1) (length l2))) #f)
	 (else (permutation? (removeallx (car l1) l1) (removeallx (car l1) l2) ))
	 )
  )






(display (if (equal? (permutation? '() '()) #t) "permutation? 13 SUCCESS" "permutation? 13 FAILURE"))(newline)
(display (if (equal? (permutation? '(1 3 4 5) '(5 3 1 4)) #t) "permutation? 14 SUCCESS" "permutation? 14 FAILURE"))(newline)
(display (if (equal? (permutation? '(1 1) '(1 2)) #f) "permutation? 15 SUCCESS" "permutation? 15 FAILURE"))(newline)
