(define (get_neighbours g x)
  (apply append (map
	 (lambda (edge)
		(
		 let
		 (
		  (a (car edge))
		  (b (cadr edge))
		  )
		 (cond
			((= a x) (list b))
			((= b x) (list a))
			(else '())
			)
		 )
		)
	 g
	 ))
  )

(define (contains lst x)
  (eval (cons or (map (lambda (elem) (= x elem)) lst)))
  )

(define (bfs g end q visited) ; -> t/f
  (cond
	 ((null? q) #f)
	 ((= (car q) end) #t)
	 ;; if (car q) in visited; 
	 ((contains visited (car q))   (bfs 
				g 
				end 
				(cdr q)
				visited
				))
	 (else (bfs 
				g 
				end 
				(append (cdr q) (get_neighbours g (car q)))
				(cons (car q) visited)
				)
			 )
	)
  )


(define (isWay? g start end)
  (bfs g end (list start) '())
  )




(display (if (equal? (isWay? '((1 2) (2 3) (1 3) (2 4)) 1 4) #t) "isWay? 16 SUCCESS" "isWay? 16 FAILURE"))(newline)
(display (if (equal? (isWay? '((1 2) (2 3) (1 3) (4 5)) 1 5) #f) "isWay? 17 SUCCESS" "isWay? 17 FAILURE"))(newline)
(display (if (equal? (isWay? '((1 2)) 1 1) #t) "isWay? 18 SUCCESS" "isWay? 18 FAILURE"))(newline)