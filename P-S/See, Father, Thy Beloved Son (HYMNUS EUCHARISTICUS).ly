\version "2.22.2"

\include "english.ly"
\include "hymn_definitions.ly"

refs = \markup {
  \fontsize #-3 {
    \left-column {
      \wordwrap {
        Text: {Vs. 1,2 William Henry Hammond Jervois (1852-1905)
      }
      }
      \wordwrap {
        Music: HYMNUS EUCHARISTICUS  LM, Benjamin Rogers (1614-1698)
      }
    }
  }
  }

global = {
  \key g \minor
  \time3/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c'' {
  \global
  g4 g a |
  bf4.( c8) d4
  c8[( bf] a4.) g8 |
  g4( fs2) %\bar "||"

  fs4 fs g | \break
  a2 bf4 |
  c c4.( bf8) |
  bf2. %\bar "||"

  bf4 bf bf |
  a2 bf8[ a] |
  g4 g4.( a8) |
  g4( fs2) %\bar "||"

  g4 a bf |
  c2 c8[ bf] |
  bf4( a4.) a8 |
  g2. \bar "|."
}

alto = \relative c' {
  \global
  d4 d d |
  d2 d4 |
  ef2 ef4 |
  d2. |
  d4 d d |
  f!2 f4 |
  ef8[ d] c4.( d8) |
  d2. |
  d4 d d |
  c2 d4 |
  d2~ d8 c |
  d2. |
  bf4 c d |
  c4.( d8) ef4 |
  d2 c8[ d] |
  bf2. |

}

tenor = \relative c' {
  \global
  bf4 bf fs |
  g2 a4 |
  g4( c4.) bf8 |
  a2. 

  a4 a bf |
  c2 d4 |
  c8[ bf] bf4( a8[ bf]) |
  bf2.

  f4 f f |
  f2 f4 |
  g2 g4 |
  a2.

  bf4 a f |
  g2 a8[ g] |
  g2 g8[ fs] |
  g2.
}

bass = \relative c' {
  \global
  g4 g d |
  g2 f!4 |
  ef c2 |
  d2. |
  d4 d g |
  f2 d4 |
  ef f2 |
  bf,2. |
  bf4 bf bf |
  f'2 d4 |
  ef2 ef4 |
  d2. |

  g4 f d |
  ef4.( d8) c4 |
  d2 d4 |
  g,2. |
}

verseOne = \lyricmode {
  \vOne
  See, Fath -- er, thy be -- lov -- èd Son,
  Whom here we now pre -- sent to thee;
  The all -- suf -- fi -- cient Sac -- ri -- fice,
  The sin -- ner's one and on -- ly plea.
}

verseTwo = \lyricmode {
  \vTwo
  Through him we pray for all we love,
  For all by pain or sin op -- prest;
  For souls de -- part -- ed in thy fear:
  O grant them thine e -- ter -- nal rest.
}

verseThree = \lyricmode {
  \vThree
  To Fath -- er, Son, and Ho -- ly Ghost,
  The God, whom earth and heav'n a -- dore,
  Be glo -- ry: as it was of old,
  Is now, and shall be ev -- er -- more.
}

#(set-global-staff-size 20)
\book {
  \include "hymn_paper.ly"
  \header {
    tagline = ""
  }
  % \top
  \score {
    \new ChoirStaff <<
      \new Staff  <<
        \new Voice = "soprano" { \voiceOne \melody }
        \new Voice = "alto" { \voiceTwo \alto }
      >>
      \new Lyrics  \lyricsto soprano \verseOne
      \new Lyrics  \lyricsto soprano \verseTwo
      \new Lyrics  \lyricsto soprano \verseThree
      %\new Lyrics \lyricsto soprano \verseFour
      % \new Lyrics \lyricsto soprano \verseFive
      \new Staff  <<
        \clef bass
        \new Voice = "tenor" { \voiceOne \tenor }
        \new Voice = "bass" { \voiceTwo \bass }
      >>
    >>
    \midi {
      \context {
        \Score
        tempoWholesPerMinute = #(ly:make-moment 80 4)
      }
    }
    \include "hymn_layout.ly"
  }
  %{
\extraVerses
\markup {
  \vspace #0.5
}
  %}
  \refs
}

%%%%%%
%%%%%%
%%%%%%
#(set-global-staff-size 16)
#(define output-suffix "Hymnal")
\book {
  \include "lilypond-book-preamble.ly"
  \include "hymn_hymnal_paper.ly"
  \header {
    tagline = ""
  }
  %\top
  \score { %\transpose c d
    \new ChoirStaff <<
      \new Staff  <<
        \new Voice = "soprano" { \voiceOne \melody }
        \new Voice = "alto" { \voiceTwo \alto }
      >>
      \new Lyrics  \lyricsto soprano \verseOne
      \new Lyrics  \lyricsto soprano \verseTwo
      \new Lyrics  \lyricsto soprano \verseThree
     % \new Lyrics \lyricsto soprano \verseFour
      % \new Lyrics \lyricsto soprano \verseFive
      \new Staff  <<
        \clef bass
        \new Voice = "tenor" { \voiceOne \tenor }
        \new Voice = "bass" { \voiceTwo \bass }
      >>
    >>
    \include "hymn_hymnal_layout.ly"
  }    
  %{
\extraVerses
\markup {
  \vspace #0.5
}
  %}
  \refs
}
%%%%%%
%%%%%%
%%%%%%
#(define output-suffix "Melody")
\book {
  \include "lilypond-book-preamble.ly"
  \include "hymn_melody_paper.ly"
  %  \top
  \score {
    %\transpose c bf,
    <<
      \new Voice = "tune" {
        \melody
      }
      \new Lyrics \with {
        \override VerticalAxisGroup.
        nonstaff-relatedstaff-spacing.padding = #1.5 } \lyricsto "tune" { \verseOne }
      \new Lyrics \lyricsto "tune" { \verseTwo }
      \new Lyrics \lyricsto "tune" { \verseThree }
     % \new Lyrics \lyricsto "tune" { \verseFour }
      % \new Lyrics \lyricsto "tune" { \verseFive}
    >>
    \include "hymn_layout.ly"
  }
  \markup { 
    \vspace #0.5 
  }
  %{
\extraVerses
\markup {
  \vspace #0.5
}
  %}
  \refs
}
