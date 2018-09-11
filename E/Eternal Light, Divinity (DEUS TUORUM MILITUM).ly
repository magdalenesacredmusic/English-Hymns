%{
The music and poetry produced by this source code are believed to be in the public domain in the United States.
The source code itself is licensed under a Creative Commons Attribution-NonCommercial 4.0 International License:
http://creativecommons.org/licenses/by-nc/4.0/

Musicam Ecclesiae - sites.google.com/site/musicamecclesiae
%}

\version "2.18.2"
\include "english.ly"
\include "hymn_definitions.ly"

top = \markup {
  \fill-line {
    \column {
      \line {DEUS TUORUM MILITUM  LM}
    }
    \right-column{
      \line {Grenoble Church Melody}
      \line {harm. \italic "The English Hymnal"}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null 
    \right-column {
      \line {"Aeterna Lux, Divinitas"}
      \line {18th cent.; tr. R.F. Littledale}
    }
  } 
}

\header {
  tagline = ""
}

global = {
  \key c \major
  \time 3/4
  %\autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
  \global
  \partial 4
  \partial 4 c4^\markup { \italic "To be sung in unison." } |
  e2 g4 | c2 g4 |
  f4( e4) d4 |
  c2 \bar "||"

  c'4 |
  e2 c4 |
  a4( b) c |
  g2 fs4 |
  g2 \bar "||"  \break

  g4 |
  a2 b4 |
  c2 g4 |
  f4( e) d |
  e2 \bar "||"

  g4 |
  a4( b) c |
  g( f) e |
  d2 c4 |
  c2 \bar "||"
}

melodya = \relative c' {
  \global
  \partial 4
  \partial 4 c4^\markup { \italic "To be sung in unison." } |
  e2 g4 | c2 g4 |
  f4( e4) d4 |
  c2 \bar "||"

  c'4 |
  e2 c4 |
  a4( b) c |
  g2 fs4 |
  g2 \bar "||" 

  g4 |
  a2 b4 |
  c2 g4 |
  f4( e) d |
  e2 \bar "||"

  g4 |
  a4( b) c |
  g( f) e |
  d2 c4 |
  c2 \bar "||"
}

alto = \relative c' {
  \global
  \partial 4
  s4 |
  s2. |
  <c e>2 <c e>4 |
  s2. |
  s2 \bar "||"

  <e g>4 |
  <e a>2 <e a>4 |
  fs2 <e g>4 |
  b2 d4 |
  d2 \bar "||"

  <c e>4 |
  <c f>2 f4 |
  e2 c4 |
  c2 b4 |
  b2 \bar "||"

  c4 |
  <c e>4 \tieUp <d g ~>4 <e g>4 |
  <b d>4 c c |
  s2 c4 |
  c2 \bar "||"
}

tenor = \relative c {
  \global
  \partial 4
  <e g>4 |
  <g c>2 <g b>4 |
  s2. |
  <a c>4 g4 b4 |
  <e, g>2 \bar "||"

  c'4 |
  c2 a4 |
  d2 g,4 |
  g2 a4 |
  <g b>2 \bar "||"


  s4 |
  s2 b4 |
  a2 g4 |
  a g g |
  g2 \bar "||"

  e4 |
  s2. |
  s4 a4 g |
  <g b>2 <e g>4 |
  <e g>2 \bar "||"
}

bass = \relative c {
  \global
  \partial 4
  c4 |
  c2 e4 |
  a,2 c4 |
  f4 c4 g'4 |
  c,2 \bar "||"

  c'4 |
  a2 c,4 |
  d2 c4 |
  e2 d4 |
  g,2 \bar "||"

  c4 |
  f2 d4 |
  a2 e'4 |
  f c g' |
  e2 \bar "||"

  c4 |
  a g e |
  g a c |
  g2 <c, c'>4 |
  <c c'>2 \bar "||"
}


verseOne = \lyricmode {
  \set stanza = "1."
  E -- ter -- nal Light, Di -- vin -- i -- ty,
  O U -- ni -- ty in Tri -- ni -- ty,
  Thy ho -- ly name Thy ser -- vants bless,
  To Thee we pray, and Thee con -- fess.
}

verseTwo = \lyricmode {
  \set stanza = "2."
  We praise the Fa -- ther migh -- ty One;
  We praise the sole -- be -- got -- ten Son;
  We praise the Ho -- ly Ghost a -- bove,
  Who joins Them in one bond of love.
}

verseThree = \lyricmode {
  \set stanza = "3."
  For of the Fa -- ther in -- fi -- nite
  Be -- got -- ten is the Ligh of light,
  And from His love e -- ter -- nal -- ly
  Pro -- ceeds the Spi -- rit, God most high.
}


verseFour = \lyricmode {
  \set stanza = "4."
  None can more high or ho -- ly be,
  Co -- e -- qual is their De -- i -- ty,
  The sub -- stance of the Three is One,
  And e -- qual laud to Them is done.
}

\book {
  \include "hymn_paper.ly"
  \header {
    tagline = ""
  }
  \top
  \score {
    \new ChoirStaff <<
      \new Staff  <<
        \new Voice = "soprano" { \voiceOne \melody }
        \new Voice = "alto" { \voiceTwo \alto }
      >>
      \new Lyrics  \lyricsto soprano \verseOne
      \new Lyrics  \lyricsto soprano \verseTwo
      \new Lyrics  \lyricsto soprano \verseThree
      \new Lyrics \lyricsto soprano \verseFour
      \new Staff  <<
        \clef bass
        \new Voice = "tenor" { \voiceOne \tenor }
        \new Voice = "bass" { \voiceTwo \bass }
      >>
    >>
    \midi {
      \context {
        \Score
        tempoWholesPerMinute = #(ly:make-moment 112 4)
      }
    }
    \include "hymn_layout.ly"
  }
  \bottom
  \markup {
    \vspace #2.0
  \large {
    \fill-line {
      %\hspace #0.1 % moves the column off the left margin;
      % can be removed if space on the page is tight
      \column {
        \line {
          \bold "5. "
          \column {
            "The Three are One Immensity,"
            "The Three One highest Verity,"
            "The Three One perfect Charity,"
            "And They are man's Felicity."
          }
        }
        \vspace #0.5
        \line {
          \bold "6. "
          \column {
            "O Verity! O Charity!"
            "O Ending and Felicity!"
            "In Thee we hope, in Thee believe,"
            "Thyself we love, to Thee we cleave."
          }
        }
      }
      \hspace #0.1  % adds horizontal spacing between columns;
      % if they are still too close, add more " " pairs
      % until the result looks good
      \column {
        \line {
          \bold "7. "
          \column {
            "Thou First and Last, from whom there springs"
            "The Fount of all created things,"
            "Thou art the Life which moves the whole,"
            "Sure Hope of each believing soul."
          }
        }
        \vspace #0.5
        \line {
          \bold "8. "
          \column {
            "Thou who alone the world hast made,"
            "Art still its one sufficing aid,"
            "The oly LIght for gazing eyes,"
            "And, unto them that hope, the Prize."
          }
        }
      }
      % \hspace #0.1 % gives some extra space on the right margin;
      % can be removed if page space is tight
    }
  }
}


\markup \fill-line {
  \center-column 	{
    \large {
      \vspace #1.5
      \column {
        \line {
          \bold "9. "
          \column {
            "O Father, Source of God the Word,"
            "O Word with Him co-equal Lord,"
            "O Spirit of like majesty,"
            "O Triune God, all praise to Thee."
          }
        }
        \hspace #1.0
      }
    }
  }
}



}

%%%%%%
%%%%%%
%%%%%%
#(define output-suffix "Melody")
\book {
  \include "lilypond-book-preamble.ly"
  \include "hymn_melody_paper.ly"
  \top
  \score {
    %\transpose c bf,
    <<
      \new Voice = "tune" {
        \melodya
      }
      \new Lyrics \lyricsto "tune" { \verseOne }
      \new Lyrics \lyricsto "tune" { \verseTwo }
      \new Lyrics \lyricsto "tune" { \verseThree }
      \new Lyrics \lyricsto "tune" { \verseFour }
    >>
    \include "hymn_layout.ly"
  }
  \markup { 
    \vspace #0.5 
  }
  \bottom
  
  \markup {
  \vspace #2.0
  \large {
    \fill-line {
      \hspace #1.0
      \column {
        \line {
          \bold "5. "
          \column {
              "The Three are One Immensity,"
            "The Three One highest Verity,"
            "The Three One perfect Charity,"
            "And They are man's Felicity."
          }
        }
        \vspace #0.5
        \line {
          \bold "6. "
          \column {
            "O Verity! O Charity!"
            "O Ending and Felicity!"
            "In Thee we hope, in Thee believe,"
            "Thyself we love, to Thee we cleave."
          }
        }
        \vspace #0.5
        \line {
          \bold "7. "
          \column {
            "Thou First and Last, from whom there springs"
            "The Fount of all created things,"
            "Thou art the Life which moves the whole,"
            "Sure Hope of each believing soul."
          }
        }
        \vspace #0.5
        \line {
          \bold "8. "
          \column {
             "Thou who alone the world hast made,"
            "Art still its one sufficing aid,"
            "The oly LIght for gazing eyes,"
            "And, unto them that hope, the Prize."
          }
        }
        \vspace #0.5
        \line {
          \bold "9. "
          \column {
             "O Father, Source of God the Word,"
            "O Word with Him co-equal Lord,"
            "O Spirit of like majesty,"
            "O Triune God, all praise to Thee."
          }
        }
      }
      \hspace #1.0

    }
  }
}

 
}

