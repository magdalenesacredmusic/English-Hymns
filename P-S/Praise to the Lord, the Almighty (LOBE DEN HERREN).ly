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
      \line {LOBE DEN HERREN  IRREG.}
    }
    \right-column{
      \line {Anon., 1665; harm. W. S. Bennett, 1864}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null 
    \right-column {
      \line {\italic "Lobe den Herren"}
      \line {Joachim Neander, 1680; trans. Catherine Winkworth, 1863}
    }
  } 
}

\header {
  tagline = ""
}


global = {
  \key g \major
  \time 3/4
  %\autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c'' {
  \global
  g4 g d' |
  b4. a8 g4 |
  fs e d |
  e fs g |
  a2. |
  g2. | \break

  g4 g d' |
  b4. a8 g4 |
  fs e d |
  e fs g |
  a2. |
  g2. | \break

  d'4 d d |
  e2. 

  b4 c d |
  d c b |
  a2. |  \break

  d,4 e fs |
  g a b |
  a2. |
  g2. \bar "|."
}

melodya = \relative c'' {
  \global
  g4 g d' |
  b4. a8 g4 |
  fs e d |
  e fs g |
  a2. |
  g2. | 

  g4 g d' |
  b4. a8 g4 |
  fs e d |
  e fs g |
  a2. |
  g2. | 

  d'4 d d |
  e2. 

  b4 c d |
  d c b |
  a2. |  

  d,4 e fs |
  g a b |
  a2. |
  g2. \bar "|."
}

alto = \relative c' {
  \global
  d4 e d |
  d4. fs8 e4 |
  d c b |
  c c b |
  e( d c)
  b2. |

  d4 e d |
  d4. fs8 e4 |
  d c b |
  c c b |
  e( d c)
  b2. |

  g'4 a g |
  g2. |

  g4 g a |
  g e8[ fs] g4 |
  fs2. |

  d4 c c |
  b e ds |
  e2( d!4) |
  b2. 
}

tenor = \relative c' {
  \global
  b4 b a |
  d4. d8 b4 |
  b g g |
  g a g |
  g( fs2) |
  g2. |

  b4 b a |
  d4. d8 b4 |
  b g g |
  g a g |
  g( fs2) |
  g2. |

  b4 a b |
  c2. |

  d4 c a |
  b c d |
  d2. |

  g,4 g a |
  g e fs |
  e( a8[ g] fs4) |
  g2.
}

bass = \relative c' {
  \global
  g4 e fs |
  g4. d8 e4 |
  b c g |
  c a e' |
  c( d2) |
  g,2. |

  g'4 e fs |
  g4. d8 e4 |
  b c g |
  c a e' |
  c( d2) |
  g,2. |

  g'4 fs g |
  c,2. |

  g'4 e fs |
  g a b8[ g] |
  d2. |

  b4 c a |
  e' c b |
  c2( d4) |
  g,2.
}

verseOne = \lyricmode {
  \set stanza = "1."
  Praise to the Lord! the Al -- migh -- ty, the King of cre -- a -- tion!
  O my soul, praise him, for he is thy health and sal -- va -- tion!
  All ye who hear,
  Now to his tem -- ple draw near,
  Join me in glad ad -- o -- ra -- tion!
}

verseTwo = \lyricmode {
  \set stanza = "2."
  Praise to the Lord! who o'er all things so won -- drous -- ly reign -- eth,
  Shel -- ters thee un -- der his wings, yea so gent -- ly sus -- tain -- eth;
  Hast thou not seen
  How thy de -- sires e'er have been
  Grant -- ed in what he or -- dain -- eth?
}

verseThree = \lyricmode {
  \set stanza = "3."
  Praise to the Lord! who doth pros -- per thy work and de -- fend thee,
  Sure -- ly His good -- ness and mer -- cy here dai -- ly at -- tend thee;
  Pon -- der a -- new
  What the Al -- migh -- ty can do,
  If with his love he be -- friend thee!
}

verseFour = \lyricmode {
  \set stanza = "4."
  Praise to the Lord! Oh let all that is in me a -- dore him!
  All that hath life and breath, come now with prais -- es be -- fore him!
  Let the A -- men
  Sound from His peo -- ple a -- gain,
  Glad -- ly for aye we a -- dore him!
}


\book {
  \include "hymn_paper.ly"
  \header {
    tagline = ""
  }
  \top
  \score { \transpose c bf,
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
    \transpose c bf,
    <<
      \new Voice = "tune" {
        \melodya
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