\version "2.18.2"
\include "english.ly"
\include "hymn_definitions.ly"

top = \markup {
  \fill-line {
    \column {
      \line {LUCIS CREATOR (ANGERS). LM}
    }
    \right-column{
      \line {Angers Church Melody}
      \line {Harm. Ralph Vaughan Williams, 1906}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null
    \right-column {
      \line {\italic "Audi benigne Conditor"}
      \line {Gregory the Great (540-604)}
      \line {Tr. T.A. Lacey (1853-1931)}
    }
  }
}

\header {
  tagline = ""
}

global = {
  \key g \major
  \time 3/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
  \global
  \partial 4
  e4 |
  e2 g4 |
  e2 d4 |
  g2 a4 |
  b2 
  
  a4 |
  d2 e4 |
  d( cs) b |
  a2 b4 |
  b2 \bar "" \break
  
  e,4 |
  b'( c) b |
  a2 fs4 |
  g( fs) e |
  fs2 
  
  d4 |
  <fs a>( <g b>) <fs a> |
  g2 fs4 |
  e2 d4 |
  e2 \bar "||" \break
  
  \time 7/4
  e4( fs e d e) e2 \bar "|."
}

melodya = \relative c' {
  \global
  \partial 4
  e4 |
  e2 g4 |
  e2 d4 |
  g2 a4 |
  b2 
  
  a4 |
  d2 e4 |
  d( cs) b |
  a2 b4 |
  b2 \bar "" \break
  
  e,4 |
  b'( c) b |
  a2 fs4 |
  g( fs) e |
  fs2 
  
  d4 |
  a'( b) a |
  g2 fs4 |
  e2 d4 |
  e2 \bar "||" \break
  
  \time 7/4
  e4( fs e d e) fs2 \bar "|."
}

alto = \relative c' {
  \global
  s4^\markup {\italic "To be sung in unison."} |
  s2.
  s2.
  s2 <d fs>4
  <d g>2
  
  <d fs>4 
  <fs a>2 <a cs>4
  <fs b> <fs a> <d g>
  <d fs>2 <d fs>4 
  <d fs>2
  
  s4 
  <e g>2 <d g>4
  <d fs>2 <a d>4
  <b d>~ <a d>~ <a cs> 
  <a d>2
  
  s4
  d2.
  <b e>2~ <b d>4
  s2.
  s2.
}

tenor = \relative c' {
  \global
  <g b>4
  <g b>2 <g b>4
  <g c>2 <g b>4
  <g b>2
  s4
  s2
  
  s4
  s2.
  s2.
  s2.
  s2 
  
  <g b>4
  s2.
  s2.
  s2.
  s2
  
  <fs a>4
  s2.
  s2.
  <g c>2~ <g b>4
  <g b>2
  
  <g c>4 <b d> <g c> <g b>2 <g b>2
}

bass = \relative c {
  \global
 e4 |
 e2 e4 |
 c2 g4 |
 e'2 d4 |
 g2
 
 d4 |
 d2 a4 |
 b fs' g |
 d2 b4 |
 b2
 
 e4 |
 e c g' |
 d2 d4 |
 g, d' a |
 d2 
 
 d4 |
 d g d |
 e2 b4 |
 c2 g4 |
 e2
 
 c'4 b c g e e2
}

verseOne = \lyricmode {
  \vOne
  O kind Cre -- a -- tor, bow thine ear
  To mark the cry, to know the tear
  Be -- fore thy throne of mer -- cy spent
  In this thy ho -- ly fast of Lent.
}

verseTwo = \lyricmode {
  \vTwo
  Our hearts are o -- pen, Lord, to thee:
  Thou know -- est our in -- fir -- mi -- ty;
  Pour out on all who seek thy face
  A -- bun -- dance of thy pard -- 'ning grace.
}

verseThree = \lyricmode {
  \vThree
  Our sins are man -- y, this we know;
  Spare us, good LOrd, thy per -- cy show;
  And for the hon -- or of thy name
  Our faint -- ing souls to life re -- claim.
}

verseFour = \lyricmode {
  \vFour
  Give us the self -- con -- trol that springs
  From dis -- ci -- pline of out -- ward things,
  That fast -- ing in -- ward se -- cret -- ly
  The soul may pure -- ly dwell with thee.
}

verseFive = \lyricmode {
  \vFive
  We pray thee, ho -- ly Trin -- i -- ty,
  One God, un -- chang -- ing U -- ni -- ty,
  That we from this our ab -- sti -- nence
  May reap the fruits of pen -- i -- tence.
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
        tempoWholesPerMinute = #(ly:make-moment 126 4)
      }
    }
    \include "hymn_layout_ragged.ly"
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
        \melodya
      }
      \new Lyrics \lyricsto "tune" { \verseOne }
      \new Lyrics \lyricsto "tune" { \verseTwo }
      \new Lyrics \lyricsto "tune" { \verseThree }
      \new Lyrics \lyricsto "tune" { \verseFour}
      \new Lyrics \lyricsto "tune" { \verseFive }
    >>
    \include "hymn_layout_ragged.ly"
  }
  \markup {
    \vspace #0.5
  }
  \bottom
}
