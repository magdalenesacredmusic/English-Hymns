\version "2.22.2"

\include "english.ly"
\include "hymn_definitions.ly"

refs = \markup {
  \fontsize #-3 {
    \left-column {
      \wordwrap {
        Text: Christopher Wordsworth (1807-85), 1862
      }
      \wordwrap {
        Music: SALZBURG  77 77 D, Jakob Hintze (1622-1702), 1678; Harm. Johann Sebastian Bach (1685-1750)
      }
    }
  }
}


global = {
  \key d \major
  \time 4/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c'' {
  \global
  a4 d a b |
  a4. g8 fs2 |
  a4 a g fs |
  e e d2 
  a'4 d a b |
  a4. g8 fs2 |
  a4 a g fs |
  e e d2 
  e4 e fs8[ gs] a4 |
  a4 gs a2 |
  b4. cs8 d4 d |
  cs4 cs b2 |
  fs4 fs b a |
  a gs a2 |
  b4 a g fs |
  e e d2 \bar"|."
}

alto = \relative c' {
  \global
  d4 d d d |
  d cs d2 |
  d4 d8[ cs] b[ cs] d4 |
  d cs d2 |
  d4 d d d |
  d cs d2 |
  d4 d8[ cs] b[ cs] d4 |
  d cs d2 |
  cs4 cs d cs |
  fs e8[ d] cs2 |
  e8[ fs] g4 fs fs |
  fs fs8[ e] d2 |
  d4 d d cs |
  d d cs2 |
  d4 d8[ cs] b[ cs] d4 |
  d cs d2 |
}

tenor = \relative c {
  \global
  fs4 fs8[ g] a4 g8[ fs] |
  e[ d] e4 d2 |
  fs4 fs g a |
  b a fs2 
  fs4 fs8[ g] a4 g8[ fs] |
  e[ d] e4 d2 |
  fs4 fs g a |
  b a fs2 
  a4 a a a |
  b b a2 |
  g4. a8 b4 b |
  b as b2 
  a4 a g8[ fs] e4 |
  d8[ fs] e[ d] e2 |
  g4 fs g a |
  b a8[ g] fs2 
}

bass = \relative c {
  \global
  d4 b fs g |
  a a d2 |
  d4 d e fs |
  g a d,2 |
  d4 b fs g |
  a a d2 |
  d4 d e fs |
  g a d,2 |
  a4 a d fs8[ e] |
  d4 e a,2 |
  e'4 e b8[ cs] d[ e] |
  fs4 fs b,2 |
  d4 d g, a |
  b b a2 |
  g4 d' e fs |
  g \once \override NoteColumn #'force-hshift = #1.0 a d,2 |
}

verseOne = \lyricmode {
  \vOne
  Songs of thank -- ful -- ness and praise,
  Je -- sus, Lord, to thee we raise,
  Man -- i -- fest -- ed by the star
  To the sa -- ges from a -- far;
  Branch of roy -- al Da -- vid's stem
  In thy birth at Beth -- le -- hem.
  An -- thems be to thee ad -- dressed,
}

verseTwo = \lyricmode {
  \vTwo
  Man -- i -- fest at Jor -- dan's stream,
  Proph -- et, Priest, and King su -- preme;
  And at Ca -- na, wed -- ding -- guest,
  In thy God -- head man -- i -- fest;
  Man -- i -- fest in pow'r di -- vine,
  Chang -- ing wa -- ter in to wine;
  An -- thems be to thee ad -- dressed,
}

verseThree = \lyricmode {
  \vThree
  Man -- i -- fest in mak -- ing whole
  Pal -- sied limbs and faint -- ing soul;
  Man -- i -- fest in val -- iant fight,
  Quel -- ling all the de -- vil's might;
  Man -- i -- fest in gra -- cious will
  Ev -- er bring -- ing good from ill;
  An -- thems be to thee ad -- dressed,
  God in man made man -- i -- fest.
}

verseFour = \lyricmode {
  \vFour
  Sun and moon shall dark -- ened be,
  Stars shall fall, and heav'ns shall flee;
  Christ will then like light -- ning shine,
  All will see his glo -- rious sign:
  All will then the trum -- pet hear;
  All will see the Judge ap -- pear,
  Who by all will be con -- fessed,
}

verseFive = \lyricmode {
  \vFive
  Grant us grace to see thee, Lord,
  Mir -- ror'd in thy ho -- ly Word;
  May we im -- i -- tate thee now,
  And be pure, as pure art thou;
  That we like to thee may be
  At thy great E -- piph -- an -- y;
  And may praise thee, ev -- er blest,
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
      \new Lyrics \lyricsto soprano \verseFour
      \new Lyrics \lyricsto soprano \verseFive
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
      \new Lyrics \lyricsto soprano \verseFour
      \new Lyrics \lyricsto soprano \verseFive
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
      \new Lyrics \lyricsto "tune" { \verseFour }
      \new Lyrics \lyricsto "tune" { \verseFive}
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
