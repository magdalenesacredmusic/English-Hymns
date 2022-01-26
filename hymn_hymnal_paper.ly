\version "2.18.2"

#(set! paper-alist
  (cons '("ustrade" . (cons (* 6 in) (* 9 in))) paper-alist))

%%%%%%%%%%%%%%%%%%%%
\paper {
  #(set-paper-size "ustrade")
  page-count = #1
	%#(set-paper-size "ustrade") 
	top-margin = 0.5\in
	bottom-margin = 0.5\in
	left-margin = 0.5\in
	right-margin = 0.5\in

}

%{\paper {
  indent=0\mm
  line-width=5.0\in
  oddFooterMarkup=##f
  oddHeaderMarkup=##f
  bookTitleMarkup = ##f
  scoreTitleMarkup = ##f

}


%}