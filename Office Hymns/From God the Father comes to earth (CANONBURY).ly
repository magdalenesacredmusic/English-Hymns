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
      \line {CANONBURY  LM}
    }
    \right-column{
      \line {Robert Schumann, 1839}
      \line {adapt. \italic "Hymns with Tunes, Old and New" 1872}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null
    \right-column {
      \line {\italic "A Patre Unigenite"}
      \line {Vs. 1-4, 6 LH Vespers.}
      \line {Tr. John Mason Neale, \italic "Hymnal Noted," 1889}
    }
  }
}

global = {
  \key g \major
  \time 4/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
  \global
  \partial 4
  d4 |
  b' b b c8[ b] |
  a4 g8[ a] b4 d, |
  e fs \bar "" \break
  g a |
  fs e d d |
  b' b b c8[ b] | \break
  
  a4 b8[ a] b4 d, |
  e fs g b8[ a] |
    \time 3/4 g4 fs g \bar "||"
  
  \time 4/4 g2 g2 \bar "|."
}

melodya = \relative c' {
  \global
  \partial 4
  d4 |
  b' b b c8[ b] |
  a4 g8[ a] b4 \bar "" \break  d, |
  e fs 
  g a |
  fs e d \bar "" d |
  b' b b c8[ b] | 
  
  a4 b8[ a] b4  \bar "" d, |
  e fs g b8[ a] |
  \time 3/4 g4 fs g \bar "||"
  
  \time 4/4 g2 g2 \bar "|."
}

alto = \relative c' {
  \global
  \partial 4
  d4 | 
  d ds e e |
  c4 c b d |
  c c d e |
  d cs d d |
  d ds e e |
  c c b d |
  c c d e |
  d d d
  
  e2 d
}

tenor = \relative c {
  \global
  \partial 4 
  d4 |
  b' a g a8[ g] |
  fs4 e8[ fs] g4 g |
  g a g e | 
  a g fs d |
  g fs gs a8[ g] |
  fs4 e8[ fs] g4 g |
  g a g gs8[ a] |
  b4 a b
  
  c2 b
}

bass = \relative c {
  \global
  \partial 4
  d4 |
  g fs e a, |
  d d g, b |
  c a b cs |
  d a d d |
  g, b e a, |
  d d g, b |
  c a b c |
  d d g,
  
  c2 g2
}

verseOne = \lyricmode {
  \vOne
  From God the Fa -- ther comes to earth
The on -- ly Son, through Vir -- gin -- birth;
His Cross the Font doth con -- sec -- rate,
The faith -- ful to re -- gen -- er -- ate.
}

verseTwo = \lyricmode {
  \vTwo
  From high -- est heaven His course be -- gan,
He took the form of mor -- tal man;
Cre -- a -- tion by his death re -- stored,
And shed new joys of life a -- broad.
}

verseThree = \lyricmode {
  \vThree
  We pray Thee, Sa -- vior, of thy love,
To hear us from thy throne a -- bove:
En -- light -- en thou our cloud -- ed sense,
Fresh beams of light to us dis -- pense.
}

verseFour = \lyricmode {
  \vFour
  A -- bide with us, O Lord, we pray,
The gloom of night re -- move a -- way;
The work of heal -- ing, Lord, be -- gin,
And do a -- way the stain of sin.

\set stanza = "6." 
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
      %\new Lyrics \lyricsto soprano \verseFive
      \new Staff  <<
        \clef bass
        \new Voice = "tenor" { \voiceOne \tenor }
        \new Voice = "bass" { \voiceTwo \bass }
      >>
    >>
    \midi {
      \context {
        \Score
        tempoWholesPerMinute = #(ly:make-moment 84 4)
      }
    }
    \include "hymn_layout.ly"
  }
    \markup {
    \vspace #1
  \large {
    \fill-line {
      \hspace #0.1 % moves the column off the left margin;
      % can be removed if space on the page is tight
      \column {
        \line {
          \bold "* 5. "
          \column {
            "Earth once, we know, thy coming saw,"
"  Thou, we believe, shalt come once more,"
"Thy sceptre now to us extend,"
"  And with thy holy shield defend."
          }
        }
    \vspace #1
        \line {
          \bold "6. "
          \column {
            "All glory, Lord, to thee we pay,"
            "  For thine Epiphany to-day;"
"All glory, as is ever meet,"
"  To Father and to Paraclete. Amen."
          }
        }
      }
      \hspace #0.1 % gives some extra space on the right margin;
      % can be removed if page space is tight
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
        \melodya
      }
      \new Lyrics \lyricsto "tune" { \verseOne }
      \new Lyrics \lyricsto "tune" { \verseTwo }
      \new Lyrics \lyricsto "tune" { \verseThree }
      \new Lyrics \lyricsto "tune" { \verseFour }
      %\new Lyrics \lyricsto "tune" { \verseFive }    
    >>
    \include "hymn_layout.ly"
  }
  \markup { 
    \vspace #0.5 
  }
     \markup {
    \vspace #1
  \large {
    \fill-line {
      \hspace #0.1 % moves the column off the left margin;
      % can be removed if space on the page is tight
      \column {
        \line {
          \bold "* 5. "
          \column {
            "Earth once, we know, thy coming saw,"
"  Thou, we believe, shalt come once more,"
"Thy sceptre now to us extend,"
"  And with thy holy shield defend."
          }
        }
    \vspace #1
        \line {
          \bold "6. "
          \column {
            "All glory, Lord, to thee we pay,"
            "  For thine Epiphany to-day;"
"All glory, as is ever meet,"
"  To Father and to Paraclete. Amen."
          }
        }
      }
      \hspace #0.1 % gives some extra space on the right margin;
      % can be removed if page space is tight
    }
  }
}
  \bottom
}
