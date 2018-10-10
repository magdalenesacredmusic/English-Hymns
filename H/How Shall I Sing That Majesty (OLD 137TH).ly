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
      \line {OLD 137TH  DCM}
    }
    \right-column{
      \line {Day's \italic "Psalter," 1563}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null 
    \right-column {
      \line {John Mason, c. 1683}
    }
  } 
}

\header {
  tagline = ""
}

global = {
  \key g \major
  \cadenzaOn
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c'' {
  \global
  g2 fs4 e d2 g \bar "|"
  b a g1 \bar "||"
  
  g2 a4 b c2 a \bar "|"
  b1 \bar "||"
  
  b2 a4 g fs2 g \bar "|"
  e4 e d1 \bar "||"
  
  d2 \bar "|"
  g2. a4 b2 a \bar "|"
  g1 \bar "||"
  
  d1 \bar "|"
  g2. a4 b2 g |
  c2. c4 b1 \bar "||"
  
  g2 e4 fs g2 a \bar "|"
  g1 \bar "||"
  
  g1 \bar "|"
  b4 c d d e2. e4 \bar "|"
  d1 \bar "||"
  
  b2 a4 b c2 a \bar "|"
  g1 \bar "|."
}

alto = \relative c' {
  \global
  d2 c4 c d2 e 
  d d b1 
  
  e2 fs 4g g2 fs 
  g1 
  
  g2 fs4 e ds2 e4( d) 
  d cs d1 
  
  d2 
  e2. e4 d2. c4 
  b1 
  
  b1 
  e2. fs4 g2 g 
  g2. g4 g1 
  
  b,2
  e4 ds e4( g2) fs4 |
  g1 
  
  \override Voice.Accidental.stencil = ##f d |
  g4 g fs g g2. g4 |
  g1 
  
  g2 e4 g a2 fs |
  g1
}

tenor = \relative c' {
  \global
  b2 a4 c g2 g |
  g fs g1
  
  b2 d4 d e2 d |
  d1
  
  d2 d4 b b2 b |
  a4 a fs1 
  
  g2 |
  b2. c4 g2 fs |
  g1
  
  g1
  
  b2. d4 d2 e |
  e2. e4 d1
  
  e2 g,4 b b2 d |
  b1
  
  b1 |
  d4 g, a d c2. c4 |
  b1
  
  d2 c4 d |
  e2 d4( c) |
  b1
}

bass = \relative c {
  \global
  g2 a4 a b2 c |
  d2 d g,1 |
  
  e'2 d4 g |
  c,2 d |
  g1
  
  g2 d4 e b2 e |
  a,4 a4 d1 
  
  b2 |
  e2. c4 d2 d |
  g,1 
  
  g'1 |
  e2. d4 g2 e |
  c2. e4 g1 |
  
  e2 c4 b |
  e2 d |
  g1 
  
  g1 |
  g4 e d b c2. c4 |
  g'1
  
  g2 c,4 b a2 d |
  g,1
}

verseOne = \lyricmode {
  \set stanza = "1. "
  How shall I sing that Ma -- jes -- ty
  Which An -- gels do ad -- mire?
  Let dust in dust and si --  lence lie;
  Sing, sing, ye heav'n -- ly choir.
  Thou -- sands of thou -- sands stand a -- round
  Thy throne, O God most high;
  Ten thou -- sand times ten thou -- sand sound
  Thy praise; but who am I?
}

verseTwo = \lyricmode {
  \set stanza = "2. "
  Thy bright -- ness un -- to them ap -- pears,
  Whilst I thy foot -- steps trace;
  A sound of God comes to my hears,
  But they be -- hold thy face.
  They sing be -- cause thou art their Sun;
  Lord, send a beam on me;
  For where hea -- ven is once be -- gun
  There Al -- le -- lu -- yas be.
}

verseThree = \lyricmode {
  \set stanza = "3. "
  En -- light -- en with faith's light my heart,
  In -- flame it with love's fire;
  Then shall I sing and bear a part
  With that ce -- les -- tial choir.
  I shall, I fear, be dark and cold,
  With all my fire and light;
  Yet when thou dost ac -- cept their gold,
  Lord, trea -- sure up my mite.
}

verseFour = \lyricmode {
  \set stanza = "4. "
  How great a be -- ing, Lord, is thine,
  Which doth all be -- ings keep!
  Thy know -- ledge is the on -- ly line
  To sound so vast a deep.
  Thou art a sea with -- out a shore,
  A sun with -- out a sphere;
  Thy time is now and ev -- er -- more,
  Thy place is ev -- 'ry -- where.
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
        tempoWholesPerMinute = #(ly:make-moment 120 4)
      }
    }
    \include "hymn_layout.ly"
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
      \new Lyrics \lyricsto "tune" { \verseThree }
      \new Lyrics \lyricsto "tune" { \verseFour }
    >>
    \include "hymn_layout.ly"
  }
  \markup { 
    \vspace #0.5 
  }
  \bottom
}
