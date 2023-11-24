\version "2.22.2"

\include "english.ly"
\include "hymn_definitions.ly"

refs = \markup {
  \fontsize #-3 {
    \left-column {
      \wordwrap {
        Text: \italic "Pugnate, Christi milites," Latin, 18th cent.; Tr. John Clark (1839-88)
      }
      \wordwrap {
        Music: ORIENTIS PARTIBUS   77 77, French Medieval Melody; Harm. Ralph Vaughan Williams (1872-1958)
      }
    }
  }
}


\header {
  tagline = ""
}

global = {
  \key f \major
  \time 3/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
  \global
  f2 g4 |
  a2 f4 |
  g2 e4 |
  f2. 
  c'2 c4 |
  d2 a4 |
  c2 c4 |
  a2. |
  
  a2 g4 |
  bf2 a4 |
  g2 f4 |
  a2.
  
  c2 bf4 |
  a2 f4 |
  g2 e4 |
  f2. \bar "||" \break
  
  f2( g4 |
  f2 e4) |
  f2. \bar "|."
}

alto = \relative c' {
  \global
  <a c>2^\markup { \italic Unison. } <c e>4 |
  <c e>2 <a d>4 |
  <bf d>2 <g c>4 |
  <a c>2. |
  
  <c e>2 f4 |
  f2 <c f>4 |
  <c f>2 <c e>4 |
  <c f>2. |
  
  <c f>2 <c ef>4 |
  <d f>2 <c f>4 |
  <bf d>2 <a d>4 |
  <c e>2. |
  
  f2 d4 |
  c2 <a d>4 |
  <bf d>2 <g c>4 |
  <a c>2.
  
  <a d>2 <bf d>4 |
  <a c>2 <g c>4 |
  <a c>2.
}

tenor = \relative c' {
  \global
  s2.
  s2. 
  s2.
  s2. 
  
  a2 a4 |
  a2 a4 |
  g2 g4 |
  f2. |
  
  s2. 
  s2. 
  s2 f4 |
  e2. |
  
  a2 g4 |
  e2 f4 |
  d2 g4 |
  f2.
  
  s2.
  s2.
  f2.
}

bass = \relative c {
  \global
 f2 c4 |
 a2 d4 |
 bf2 c4 |
 f2. |
 
 a,2 f'4 |
 d2 f4 |
 c2 c4 |
 f2. |
 
 f2 c4 |
 bf2 f4 |
 g2 d'4 |
 a2. |
 
 f2 g4 |
 a2 d4 |
 bf2 c4 |
 f,2.
 
 d'2 g,4 |
 a2 c4 |
 f,2.
}

verseOne = \lyricmode {
  \vOne
  Sol -- diers, who are Christ's be -- low,
  Strong in faith re -- sist the foe;
  Bound -- less is the pledged re -- ward
  Un -- to them who serve the Lord.
}

verseTwo = \lyricmode {
  \vTwo
  'Tis no palm of fad -- ing leaves
  That the con -- queror's hand re -- ceives;
  Joys are his, se -- rene and pure,
  Light that ev -- er shall en -- dure.
}

verseThree = \lyricmode {
  \vThree
  For the souls that ov -- er -- come
  Waits the beau -- teous heav -- enly home,
  Where the bless -- èd ev -- er -- more
  Tread on high the star -- ry floor.
}

verseFour = \lyricmode {
  \vFour
  Pass -- ing soon and lit -- tle worth
  Are the things that tempt on earth;
  Heav'n -- ward lift thy soul's re -- gard;
  God him -- self is thy re -- ward.
}

verseFive = \lyricmode {
  \vFive
  Fa -- ther who the crown dost give,
  Sa -- vior by whose death we live,
  Spir -- it who our hearts dost raise,
  Three in One, thy name we praise.
  
  A -- men.
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
    \include "hymn_layout_ragged.ly"
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
    \include "hymn_hymnal_layout_ragged.ly"
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
    \include "hymn_layout_ragged.ly"
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
