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
      \line {ST MATTHEW  DCM}
    }
    \column{
      \line {William Croft (1678-1727)}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null
    \right-column {
      \line {Edward Plumptre (1821-19)}
    }
  }
}

\header {
  tagline = ""
}

global = {
  \key bf \major
  \time 3/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
  \global
  \partial 4
  f4 |
  d2 f4 |
  bf2 d4 |
  c( bf) a |
  bf2 d4 |
  c2 f,4 |
  g( f) e | 
  f2 \bar "" \break

    c'4 |
    a2 f4 |
    bf2 d4 |
    d( c) bf |
    bf( a) f |
    bf2 d4 |
    c( bf) a | 
    bf2 \bar "" \break
    
      d,4 |
      d2 g4 |
      g( fs) g |
      a( g) fs g2 a4 |
      bf2 a8[ g] |
      f2 e4 |
      d2 \bar "" \break
      
      f4 |
      f2 bf4 |
      g2 g4 |
      c2 bf4 |
      bf( a) f |
      bf2 d4 |
      c( bf) a |
      bf2
\bar "|."
}

alto = \relative c' {
  \global
  c4 |
  d2 d4 |
  d2 f4 |
  ef( d) c |
  d2 f4 |
  f2 f4 |
  d( c) c |
  c2
  
    f4 |
    f2 f4 |
    f2 f4 |
    g2 d8[ ef] |
    f2 c4 |
    f2 f4 |
    ef( d) c |
    d2 
    
      c4 |
      bf2 d4 |
      d2 bf4 |
      ef( d) d |
      d2 fs4 |
      g2 d4 |
      d2 cs4 |
      d2
      
        ef4 |
        d( ef) f |
        ef2 f4 |
        ef( f) g |
        f2 f4 |
        f( ef) d |
        g( f) f |
        f2
}

tenor = \relative c {
  \global
  f4 |
  bf2 a4 |
  bf2 bf4 |
  g( f) f |
  f2 bf4 |
  c2 a4 |
  bf( a) g |
  a2 
  
    a4 |
    c2 c4 |
    bf2 bf4 |
    bf( c) d8[ bf] |
    c2 a4 |
    bf2 bf4 |
    g( f) f |
    f2
    
    fs4 |
    g2 g4 |
    bf( a) g |
    c( bf) a |
    bf2 d4 |
    d( cs) d8[ bf] |
    a2 g4 |
    f2 
    
    a4 |
    bf2 bf4 |
    bf2 b4 |
    c2 c4 |
    c2 a4 |
    bf2 f'4 |
    ef( d) c |
    d2
}

bass = \relative c {
  \global
 \partial 4 
 a4 |
 bf2 d4 |
 g2 d4 |
 ef( f) f, |
 bf2 bf4 |
 a2 d4 |
 bf( c) c |
 f2
 
 f4 |
 f2 ef4 |
 d2 bf4 |
 ef2 g4 |
 f2 ef4 |
 d2 bf4 |
 ef( f) f |
 bf,2 
 
   a4 |
   g2 bf4 |
   d2 ef4 |
   c( d) d |
   g2 d4 |
   g4( e) f8[ g] |
   a2 a,4 |
   d2 
   
   c4 |
   bf( c) d |
   ef2 d4 |
   c( d) ef |
   f2 ef4 |
   d( c) bf |
   ef( f) f, |
   bf2
}

verseOne = \lyricmode {
  \set stanza = "1."
  Thine arm, O Lord, in days of old
  Was strong to heal and save;
  It tri -- umphed o'er dis -- ease and death,
  O'er dark -- ness and the grave;
  To thee they went, the blind, the dumb,
  The pal -- sied and the lame,
  The lep -- er with his taint -- ed life,
  The sick with fev -- ered frame.
}

verseTwo = \lyricmode {
  \set stanza = "2."
  And lo! thy touch brought life and health,
  Gave speech, and strength, and sight;
  And youth re -- newed and fren -- zy calmed
  Owned thee the Lord of light;
  And now, O Lord, be here to bless,
  Al -- might -- y as of yore,
  In crowd -- ed street, by rest -- less couch,
  As by Gen -- nesar -- eth's shore.
}

verseThree = \lyricmode {
  \set stanza = "3."
  Be thou our great de -- liver -- er still,
  Thou Lord of life and death;
  Re -- store and quick -- en, soothe and bless
  With thine al -- might -- y breath;
  To hands that work, and eyes that see,
  Give wis -- dom's heav -- enly lore,
  That whole and sick, and weak and strong,
  May praise thee ev -- er -- more.
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
      \new Staff  <<
        \clef bass
        \new Voice = "tenor" { \voiceOne \tenor }
        \new Voice = "bass" { \voiceTwo \bass }
      >>
    >>
    \midi {
      \context {
        \Score
        tempoWholesPerMinute = #(ly:make-moment 106 4)
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
    >>
    \include "hymn_layout.ly"
  }
  \markup {
    \vspace #0.5
  }
  \bottom
}
