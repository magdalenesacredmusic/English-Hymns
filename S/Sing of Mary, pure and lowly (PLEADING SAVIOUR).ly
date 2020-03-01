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
          \line {PLEADING SAVIOUR  87 87 D}
      }
      \column{
      \line {\italic "Christian Lyre," New York, 1831}
      \line {harm. R. Vaughan Williams}
      }
}
}

bottom = \markup  {
  \fill-line {
    \null 
    \right-column {
      \line {Roland F. Palmer (1891-1985) 1914}
    }
  } 
}

\header {
  tagline = ""
}

\header {
  tagline = ""
}

global = {
  \key f \major
  \time 4/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c'' {
  \global
a4 g8[ f] d4 f8[ g] |
a4 c a g |
a4 g8[ f] d4 f8[ g] |
a4 g f2 \bar "||"

a4 g8[ f] d4 f8[ g] |
a4 c a g |
a4 g8[ f] d4 f8[ g] |
a4 g f2 \bar "||"

c'4 c8[ a] c4 c |
d4 c8[ a] a4 g |
c4 c8[ a] c4 c |
d4 c8[ a] g2 \bar "||"

a4 g8[ f] d4 f8[ g] |
a4 c a g |
a4 g8[ f] d4 f8[ g] |
a4 g f2 \bar "|."
}

alto = \relative c' {
   \global
c4 c d c8[ e] |
f4 f f e |
c4 c d c8[ f] |
f4 e f2 |

c4 c d c8[ e] |
f4 f f e |
c4 c d c8[ f] |
f4 e f2 |

f4 f f f |
f f f e |
f f f f |
d f f( e)

c4 c d c8[ e] |
f4 f f e |
c4 c d c8[ f] |
f4 e f2 |
}

tenor = \relative c' {
  \global
 c4 bf8[ a] f4 a8[ bf] |
 c4 c d bf
 a4 bf8[ a] bf4 c8[ d]
 c4 c8[ bf] a2
 
  c4 bf8[ a] f4 a8[ bf] |
 c4 c d bf
 a4 bf8[ a] bf4 c8[ d]
 c4 c8[ bf] a2
 
 c4 c c c 
 bf c c c 
 c c c c 
 bf c8[ d] g,4( c)
 
  c4 bf8[ a] f4 a8[ bf] |
 c4 c d bf
 a4 bf8[ a] bf4 c8[ d]
 c4 c8[ bf] a2
}

bass = \relative c {
  \global
  f4 e8[ f] bf,4 a8[ g] |
  f4 a bf c 
  f4 e8[ f] bf,4 a8[ bf]
  c4 c f2
  
    f4 e8[ f] bf,4 a8[ g] |
  f4 a bf c 
  f4 e8[ f] bf,4 a8[ bf]
  c4 c f2
  
  a4 a8[ f] a4 a 
  bf4 a8[ f] c4 c
  a'4 a8[ f] a4 a,
  bf a8[ bf] c2
  
    f4 e8[ f] bf,4 a8[ g] |
  f4 a bf c 
  f4 e8[ f] bf,4 a8[ bf]
  c4 c f2
}

verseOne = \lyricmode {
  \set stanza = "1."
  Sing of Ma -- ry, pure and low -- ly, 
  Vir -- gin -- moth -- er un -- de -- filed,
  Sing of God's own Son most ho -- ly, 
  Who be -- came her lit -- tle child.
  Fair -- est child of fair -- est moth -- er,
  God the Lord who came to earth,
  Word made flesh, our ve -- ry broth -- er,
  Takes our na -- ture by his birth.
}

verseTwo = \lyricmode {
  \set stanza = "2."
Sing of Je -- sus, son of Ma -- ry,
In the home at Na -- za -- reth.
Toil and la -- bor can -- not wea -- ry
Love en -- dur -- ing un -- to death.
Con -- stant was the love he gave her,
Though he went forth from her side,
Forth to preach, and heal, and suf -- fer,
Till on Cal -- va -- ry he died.
}

verseThree = \lyricmode {
  \set stanza = "3."
  Joy -- ful Moth -- er, full of glad -- ness,
  In your arms your Lord was born.
  Mourn -- ful Moth -- er, full of sad -- ness, 
  All your heart with pain was torn.
  Glo -- rious Moth -- er, now re -- ward -- ed
  With a crown at Je -- sus' hand,
  Age to age your name re -- cord -- ed
  Shall be blest in ev -- 'ry land.
}

verseFour = \lyricmode {
  \set stanza = "4."
Glo -- ry be to God the Fa -- ther;
Glo -- ry be to God the Son;
Glo -- ry be to God the Spir -- it;
Glo -- ry to the Three in One.
From the heart of bless -- èd Ma -- ry,
From all saints the song as -- cends,
And the Church the strain re -- ech -- oes
Un -- to earth's re -- mot -- est ends.
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
        tempoWholesPerMinute = #(ly:make-moment 100 4)
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
