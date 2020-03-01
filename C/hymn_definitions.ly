
\version "2.18.2"

#(ly:set-option (quote no-point-and-click))
#(set! paper-alist (cons '("ustrade" . (cons (* 6 in) (* 9 in))) paper-alist))

%setting the global staff size in a top level variable is the only way to adjust the global size
%#(set-global-staff-size 16)

%%%%%%
%%%%%%
%%%%%%

%half bar
hb = {
  %% This creates a half bar that reaches 
  \once \override ChoirStaff.BarLine.bar-extent = #'( -1 . 1 )
  \bar "|"
}

qb = {
  %% Set height of bar line to 2 staff-spaces
  \once \override ChoirStaff.BarLine.bar-extent = #'( 1.5  . 2.5 )
  \bar "|"
}

divisioMinima = {
  \once \override BreathingSign.stencil = #ly:breathing-sign::divisio-minima
  \once \override BreathingSign.Y-offset = #2
  \breathe
}
divisioMaior = {
  \once \override BreathingSign.stencil = #ly:breathing-sign::divisio-maior
  \once \override BreathingSign.Y-offset = #0
  \breathe
}
divisioMaxima = {
  \once \override BreathingSign.stencil = #ly:breathing-sign::divisio-maxima
  \once \override BreathingSign.Y-offset = #0
  \breathe
}
finalis = {
  \once \override BreathingSign.stencil = #ly:breathing-sign::finalis
  \once \override BreathingSign.Y-offset = #0
  \breathe
} 

%%%%%%%%%%%%

hn =
#(define-music-function
     (parser location note)
     (ly:music?)
   #{
     \once \override Voice.NoteHead #'stencil =
       #ly:text-interface::print
     \once \override Voice.NoteHead #'text =
       \markup \musicglyph #"noteheads.s1"
     %\once \override Voice.Stem #'stencil = ##f
     $note
   #})

%%%%%%%%%%%%

i = {
  \override Lyrics.LyricText #'font-shape = #'italic
}

bo = {
\override Lyrics.LyricText #'font-series = #'bold
}

plainText = {
  \revert Lyrics.LyricText #'font-shape
  \revert Lyrics.LyricText #'font-series
}


%%%%%%%%%%%%

orAcc = \override Voice.Accidental.stencil = ##f

revAcc = \revert Voice.Accidental.stencil

%%%%%%%%%%%%%%%

ignore = \override NoteColumn #'ignore-collision = ##t

%%%%%%%%%%%%%

lal =  \once \override LyricText.self-alignment-X = #LEFT

%%%%%%%%%%%%%%%

tagIt = \once \override Lyrics.LyricText #'tagged = ##t

#(define (define-grob-property symbol type? description)
   (if (not (equal? (object-property symbol 'backend-doc) #f))
       (ly:error (_ "symbol ~S redefined") symbol))

   (set-object-property! symbol 'backend-type? type?)
   (set-object-property! symbol 'backend-doc description)
   symbol)

#(map
  (lambda (x)
    (apply define-grob-property x))

  `(
    (tagged ,boolean? "is this grob marked?")
    (syllables ,array? "the lyric syllables at a timestep")
    ))


#(define (Lyric_text_align_engraver ctx)
  "If the property 'tagged is set, collect all lyric syllables at that
timestep in the grob-array 'syllables"
  (let (; We will collect LyricText items here.
        (syl '()))
    (make-engraver
      (acknowledgers
        ((lyric-syllable-interface trans grob source)
         (set! syl (cons grob syl))))
        ((stop-translation-timestep trans)
         ; This ensures that callbacks will have access to all of the LyricText grobs
         ; in a column though any of the LyricText grobs in that column.
         (if (any (lambda (x) (eq? #t (ly:grob-property x 'tagged)))
                  syl)
             (for-each (lambda (x) 
                         (for-each
                           (lambda (y)
                             (ly:pointer-group-interface::add-grob x 'syllables y))
                           syl))
                       syl))
         ; clear our cache of syllables in readiness for another group
         (set! syl '())))))

#(define (X-offset-callback grob)
  (let* (; This is the grob-array we created to hold targeted syllables.
         (target (ly:grob-object grob 'syllables))
         ; Check is necessary because engraver has only created 'syllables
         ; grob-array in response to tag 
         (target
           (if (ly:grob-array? target)
               (ly:grob-array->list target)
               '()))
         ; A procedure to determine the size of a text stencil:
         (length (lambda (item) 
                   (interval-length
                     (ly:stencil-extent
                        (grob-interpret-markup grob (ly:grob-property item 'text))
                        X)))))
    (if (pair? target) ; Do we have a 'syllables grob-array?
        (let ((longest
                (fold
                  (lambda (elem prev)
                    (if (> (length elem) (length prev)) elem prev))
                  (car target)
                  target)))
          (if (eq? grob longest)
              ; If our grob has the longest syllable, return its default
              ; value for 'X-offset.
              (ly:self-alignment-interface::aligned-on-x-parent grob)
              ; Otherwise, give it the X-offset value of the longest syllable.
              (ly:grob-property longest 'X-offset)))
        
        ; If no grob-array, return the default function for 'X-offset
        (ly:self-alignment-interface::aligned-on-x-parent grob))))