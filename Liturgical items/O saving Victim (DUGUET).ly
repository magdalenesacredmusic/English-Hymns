%{
The music and poetry produced by this source code are believed to be in the public domain in the United States.
The source code itself is licensed under a Creative Commons Attribution-NonCommercial 4.0 International License:
http://creativecommons.org/licenses/by-nc/4.0/

Musicam Ecclesiae - sites.google.com/site/musicamecclesiae
%}

\version "2.18.2"
\include "english.ly"
\include "hymn_definitions.ly"


\paper {
 indent=0\mm
  line-width=4.5\in
  oddFooterMarkup=##f
  oddHeaderMarkup=##f
  bookTitleMarkup = ##f
  scoreTitleMarkup = ##f

}
#(set-global-staff-size 14)

top = \markup {
  \fill-line {
    \column {
      \line {DUGUET  LM}
    }
    \right-column{
      \line {Abbé Duguet; harm. Traditional, USA}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null 
    \right-column {
      \line {\italic "O Salutaris hostia"}
      \line {Thomas Aquinas; tr. J.M. Neale, E. Caswall, and others}
    }
  } 
}

\header {
  tagline = ""
}


global = {
  \key ef \major
  \time 4/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
  \global
  \partial 4
  ef4 |
  g f g af |
  g f ef

  g4 |
  g f g bf |
  bf4 a bf4

  bf4 |
  c bf g af |
  bf af8[ g] f4
  
  g4 |
  ef f g af |
  g f4 ef  \bar "||" \break
  \cadenzaOn
  ef2 ef \bar "|."
}

alto = \relative c' {
  \global
  \partial 4

  bf4 |
  ef c8[ d] ef4 ef |
  ef d c

  c |
  bf8[ c] d4 ef g |
  f4 f f4

  g4 |
  af g8[ f] ef4 f |
  f f8[ ef] d4

  ef4 |
  c d ef ef |
  ef d ef
  c2 bf

}

tenor = \relative c' {
  \global
  \partial 4

  g4 |
  bf af bf c |
  bf bf g

  ef8[ f] |
  g4 bf bf bf 
  ef8[ d] c4 d4

  ef4 |
  ef d c c |
  bf bf bf

  bf |
  c bf8[ af] bf4 c |
  bf bf g
  af2 g
}

bass = \relative c {
  \global
  \partial 4
  ef4 |
  ef f ef af, |
  bf bf c

  c8[ d] |
  ef4 bf ef d |
  c f bf,4

  ef4 |
  af, bf c f |
  d ef bf

  ef |
  af g8[ f] ef4 af, |
  bf bf ef 
  af,2 ef'
}


verseOne = \lyricmode {
  \set stanza = "1."
  O sav -- ing Vic -- tim! o -- pen wide
  The gate of heav'n to man be -- low,
  Our foes press on from ev' -- ry side,
  Thine aid sup -- ply, thy strength be -- stow.
}

verseTwo = \lyricmode {
  \set stanza = "2."
  All praise and thanks to thee as -- cend
  For ev -- er -- more, blest One in Three;
  O grant us life that shall not end
  In our true na -- tive land with Thee.
  A -- men.
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
      \new Staff  <<
        \clef bass
        \new Voice = "tenor" { \voiceOne \tenor }
        \new Voice = "bass" { \voiceTwo \bass }
      >>
    >>
    \midi {
      \context {
        \Score
        tempoWholesPerMinute = #(ly:make-moment 96 4)
      }
    }
    \include "hymn_layout.ly"
  }
  \bottom
}

%%%%%%
%%%%%%
%%%%%%
#(define output-suffix "Hymnal")
\book {
\include "lilypond-book-preamble.ly"
  \header {
    tagline = ""
  }
  \top
  \score { %\transpose c d
    \new ChoirStaff <<
      \new Staff  <<
        \new Voice = "soprano" { \voiceOne \melody }
        \new Voice = "alto" { \voiceTwo \alto }
      >>
      \new Lyrics  \lyricsto soprano \verseOne
      \new Lyrics  \lyricsto soprano \verseTwo
      \new Staff  <<
        \clef bass
        \new Voice = "tenor" { \voiceOne \tenor }
        \new Voice = "bass" { \voiceTwo \bass }
      >>
    >>
    \midi {
      \context {
        \Score
        tempoWholesPerMinute = #(ly:make-moment 96 4)
      }
    }
    \layout {
  indent = 0.0\cm
  ragged-right = ##f
  ragged-last = ##t
  %#(layout-set-staff-size 16)
  \context {
    \Score
    %**** Turns off bar numbering
    \remove "Bar_number_engraver"
  }
  \context {
    \Staff
    \remove "Time_signature_engraver"
  }
  \context {
    \Lyrics
    % **** Prevents lyrics from running too close together
   % \override LyricSpace #'minimum-distance = #0.6
    % **** Makes the text of lyrics a little smaller
  %  \override LyricText #'font-size = #0.8
    % **** Moves lines of lyrics closer together
   % \override VerticalAxisGroup #'minimum-Y-extent = #'(-1 . 1)
  }
}
  } 
  \bottom
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
        \melody
      }
      \new Lyrics \lyricsto "tune" { \verseOne }
      \new Lyrics \lyricsto "tune" { \verseTwo }
    >>
    \include "hymn_layout.ly"
  }
  \markup {
    \vspace #0.5
  }
  \bottom
}
