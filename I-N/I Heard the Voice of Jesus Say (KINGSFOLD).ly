%{
The music and poetry produced by this source code are believed to be in the public domain in the United States.
The source code itself is licensed under a Creative Commons Attribution-NonCommercial 4.0 International License:
http://creativecommons.org/licenses/by-nc/4.0/
%}

\version "2.22.2"
\include "english.ly"
\include "hymn_definitions.ly"

refs = \markup {
  \fontsize #-3 {
    \left-column {
      \wordwrap {
        Text: Horatius Bonar (1808-69), 1846; alt. v. 1, line 6
      }
      \wordwrap {
        Music: \italic "From an English Traditional Melody," Harm. Ralph Vaughan Williams (1872-1958)
      }
    }
  }
}

top = \markup {
  \fill-line {
    \column {
      \line {KINGSFOLD  DCM}
    }
    \right-column{
      \line {\italic "From an English Traditional Melody"}
      \line {harm. Ralph Vaughan Williams}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null 
    \right-column {
      \line {Text: Horatius Bonar (1808-69), 1846; alt. v. 1, line 6}
    }
  } 
}

\header {
  tagline = ""
}

global = {
  \key e \minor
  \time 4/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c'' {
  \global
  \partial 4
  g8[ fs] |
  e4 e e d |
  g g a g8[ a] |
  b4 b a8[ g] e4 |
  d2. \bar "" \break

  g8[ fs] |
  e4 e e d |
  g g a g8[ a] |
  b4 b a8[ g] e4 |
  e2. \bar "" \break

  b'8[ c] |
  d4 b b8[ a] g4 |
  a a b g8[ a] |
  b4 b8[ a] g4 e |
  d2. \bar "" \break

  g8[ fs] |
  e4 e e8[ d] e[ fs] |
  g4 g a g8[ a] |
  b4 b a8[ g] e4 |
  e2. \bar "|."
}

melodya = \relative c'' {
  \global
  \partial 4
  g8[ fs] |
  e4 e e d |
  g g a g8[ a] |
  b4 b a8[ g] e4 | \break
  d2. \bar "" 

  g8[ fs] |
  e4 e e d |
  g g a g8[ a] |
  b4 b \bar "" \break a8[ g] e4 |
  e2. \bar "" 

  b'8[ c] |
  d4 b b8[ a] g4 |
  a a b g8[ a] |
  b4 b8[ a] g4 e |
  d2. \bar "" 

  g8[ fs] |
  e4 e e8[ d] e[ fs] |
  g4 g a g8[ a] |
  b4 b a8[ g] e4 |
  e2. \bar "|."
}

alto = \relative c' {
  \global
  \partial 4
  e4 |
  b b c a |
  d b d d8[ fs] |
  g4 g e c |
  a2.
  d4 |
  d c c8[ b] a4 |
  d cs d d8[ c] |
  b4 d c c |
  b2.
  e4 |
  fs fs g8[ d] d4 |
  e d d d8[ fs] |
  g4 g8[ fs] d4 c8[ b] |
  a2.

  d4 d d c c |
  d d8[ cs] d4 d8[ c] |
  b4 d e c |
  b2.
}

tenor = \relative c' {
  \global
  \partial 4
  b8[ a] |
  g4 g g fs |
  g g fs g8[ c] |
  b4 d c g |
  g2( fs4)
  g4 |
  g g g fs |
  g g fs g8[ fs] |
  g4 g e e8[ fs] |
  g2.

  g4 |
  b d d8[ c] b4 |
  a8[ g] fs4 g d'8[ c] |
  b4 d8[ c] b4 g |
  g2( fs4)

  g4 |
  g g a c |
  b8[ a] g4 fs g8[ fs] |
  g4 fs e e8[ fs] |
  g2.
}

bass = \relative c {
  \global
  \partial 4
  e4 |
  e e8[ d] c4 c |
  b e d b8[ a] |
  g4 g a c |
  d2.

  b4 |
  c c8[ b] a4 d |
  b e d8[ c] b8[ a] |
  g4 b c a |
  e'2.

  e4 |
  b b' e,8[ fs] g4 |
  c, d g b,8[ a] |
  g4 g8[ a] b4 c |
  d2.

  b4 |
  c c8[ b] a4 a' |
  g8[ fs] e4 d b8[ a] |
  g4 b c a |
  << {\ignore \stemDown \override Stem #'length = #4.0  e'2.} \\ {\teeny \override Stem #'length = #5.6 e,2._\markup {\right-align \italic \small Org.} } >>
}

verseOne = \lyricmode {
  \vOne
  I heard the voice of Je -- sus say,
  ‘Come un -- to me and rest;
  Lay down, O wea -- ry one, lay down
  Thy head up -- on my breast.’
  I came to Je -- sus as I was,
  So wea -- ry, worn, and sad;
  I found in him a rest -- ing place,
  And he has made me glad.
}

verseTwo = \lyricmode {
  \vTwo
  I heard the voice of Je -- sus say,
  ‘Be -- hold, I free -- ly give
  The liv -- ing wa -- ter, thirst -- y one;
  Stoop down and drink and live.’
  I came to Je -- sus, and I drank
  Of that life -- giv -- ing stream;
  My thirst was quenched, my soul re -- vived,
  And now I live in him.
}

verseThree = \lyricmode {
  \vThree
  I heard the voice of Je -- sus say,
  ‘I am this dark world’s Light;
  Look un -- to me, thy morn shall rise,
  And all thy day be bright’:
  I looked to Je -- sus, and I found
  In him my Star, my Sun;
  And in that light of life I’ll walk
  Till trav -- 'ling days are done.
}


#(set-global-staff-size 20)
\book {
  \include "hymn_paper.ly"
  \header {
    tagline = ""
  }
  % \top
  \score { %\transpose c bf,
    \new ChoirStaff <<
      \new Staff  <<
        \new Voice = "soprano" { \voiceOne \melody }
        \new Voice = "alto" { \voiceTwo \alto }
      >>
      \new Lyrics  \lyricsto soprano \verseOne
      \new Lyrics  \lyricsto soprano \verseTwo
      \new Lyrics  \lyricsto soprano \verseThree
      %\new Lyrics \lyricsto soprano \verseFour
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
  % \bottom
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
  \score { %\transpose c bf,
    \new ChoirStaff <<
      \new Staff  <<
        \new Voice = "soprano" { \voiceOne \melody }
        \new Voice = "alto" { \voiceTwo \alto }
      >>
      \new Lyrics  \lyricsto soprano \verseOne
      \new Lyrics  \lyricsto soprano \verseTwo
      \new Lyrics  \lyricsto soprano \verseThree
     % \new Lyrics \lyricsto soprano \verseFour
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
    \include "hymn_hymnal_layout.ly"
  }    
  \refs
  %\bottom
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
    >>
    \include "hymn_layout.ly"
  }
  \markup { 
    \vspace #0.5 
  }
  % \bottom
  \refs
}