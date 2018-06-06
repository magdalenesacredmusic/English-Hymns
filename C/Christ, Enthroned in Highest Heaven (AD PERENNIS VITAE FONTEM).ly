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
      \line {AD PERENNIS VITAE FONTEM   87 87 87}
    }
    \column{
      \line {Tours Breviary}
      \line {\italic "The English Hymnal," 1906}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null 
    \right-column {
      \line {\italic "De profundis exclamantes," 13th cent.}
      \line {tr. R.F. Littledale }
    }
  } 
}



global = {
  \key d \minor
  \cadenzaOn
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
  \global
  d4^\markup {\italic "To be sung in unison."} d f g a d, \bar "|"
  g2 e \bar "||"

  f4 f g a bf bf \bar "|"
  a1 \bar "||"

  a4 bf c c d c \bar "|"
  a2 a \bar "||"

  a4 b c f, f g \bar "|"
  a1 \bar "||"

  g4 a a d, g f \bar "|"
  e2 e \bar "||"

  d4 f g e a bf \bar "|"
  a1 \bar "||"

  d2(^\markup {\italic Harmony.} bf) a\fermata \bar "|."
}

alto = \relative c' {
  \global
  s1. |
  d2 c |
  c1 d2 |
  c1 |
  f1~ f4 g |
  f1 |

  e2. d4 d e |
  f1 |

  d1 d2 |
  c1 |
  a2 d4 c d2 |
  cs1 |

  a'2~( a4 g8[ f]) e2
}

tenor = \relative c {
  \global
  <d f a>1.
  bf'2 g

  a1 f2 |
  f1

  a1~ a4 c |
  c1 |

  c2. a4 a c |
  c1 |
  bf2 a bf |
  g1 |
  f2 bf4 g a g |
  e1 |

  d'1 d4( cs)\fermata
}

bass = \relative c {
  \global
  s1. |
  g2 c |
  f1 bf,2 |
  f'1 |
  f1 d4 e |
  f1 |
  a,2. d4 d c |
  f1 |

  g2 f g, |
  c1 |
  d2 g,4 c f, g |
  a1

  <<{	\ignore \slurDown \stemDown \override Stem #'length = #4.0 f'2( g) a }\\{\teeny \override Stem #'length = #5.6 f,_\markup {\small \italic "Organ"} g a\fermata}>>
}

verseOne = \lyricmode {
  \set stanza = "1."
  Christ, en -- throned in high -- est heav -- en,
  Hear us cry -- ing from the deep,
  For the faith -- ful ones de -- part -- ed,
  For the souls of all that sleep;
  As Thy kneel -- ing Church en -- treat -- eth
  Heark -- en, Shep -- herd of the sheep.
}

verseTwo = \lyricmode {
  \set stanza = "2."
  King of Glo -- ry, hear our voic -- es,
  Grant Thy faith -- ful rest, we pray;
  We have sinn'd, and may not bide it,
  If thou mark our steps a -- stray,
  Yet we plead that sav -- ing Vic -- tim,
  Which for them we bring to -- day.
}

verseThree = \lyricmode {
  \set stanza = "3."
  That which Thou Thy -- self hast of -- fered
  To Thy Fa -- ther, of -- fer we;
  Let it win for them a bless -- ing,
  Bless them, Je -- su, set them free:
  Thy are thine, they wait in pa -- tience,
  Mer -- ci -- ful and gra -- cious be.
}

verseFour = \lyricmode {
  \set stanza = "4."
  They are thine, O take them quick -- ly,
  Thou their Hope, O raise them high;
  Ev -- er hop -- ing, ev -- er trust -- ing,
  Un -- to Thee they strive and cry;
  Day and night, both morn and ev -- en,
  Be, O Christ, their Guard -- ian nigh.
}

verseFive = \lyricmode {
  \set stanza = "5."
  Let Thy plen -- teous lov -- ing -- kind -- ness
  On them, as we pray, be poured;
  Let them through Thy bound -- less mer -- cy,
  From all e -- vil be re -- stored;
  Heark -- en to the gen -- tle plead -- ing
  Of Thy Mo -- ther, gra -- cious Lord.
}

verseSix = \lyricmode {
  \set stanza = "6."
  When, O kind and ra -- diant Je -- su,
  Kneels the Queen Thy throne be -- fore,
  Let the court of Saints at -- tend -- ing,
  Mer -- cy for the dead im -- plore;
  Heark -- en, lov -- ing Friend of sin -- ners,
  Whom the Cross ex -- alt -- ed bore.
}

verseSeven = \lyricmode {
  \set stanza = "7."
  Hear and an -- swer prayers de -- vout -- est,
  Break, O Lord, each bind -- ing chain,
  Dash the gates of death a -- sund -- er,
  Quell the de -- vil and his train;
  Bring the souls which Thou hast ran -- somed
  Ev -- er -- more in joy to reign.
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
     % \new Lyrics \lyricsto soprano \verseSix
    %  \new Lyrics \lyricsto soprano \verseSeven
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

  \markup {
	\large {
  \fill-line {
    \hspace #0.1 % moves the column off the left margin;
        % can be removed if space on the page is tight
     \column {
      \line { \bold "6. "
		\column {
  "When, O kind and ra -- diant Je -- su,"
  "Kneels the Queen Thy throne be -- fore,"
  "Let the court of Saints at -- tend -- ing,"
  "Mer -- cy for the dead im -- plore;"
  "Heark -- en, lov -- ing Friend of sin -- ners,"
  "Whom the Cross ex -- alt -- ed bore."
        }
     	}

    }
    \hspace #0.1  % adds horizontal spacing between columns;
        % if they are still too close, add more " " pairs
        % until the result looks good
     \column {
      \line { \bold "7. "
		\column {
  "Hear and an -- swer prayers de -- vout -- est,"
 " Break, O Lord, each bind -- ing chain,"
  "Dash the gates of death a -- sund -- er,"
  "Quell the de -- vil and his train;"
  "Bring the souls which Thou hast ran -- somed"
  "Ev -- er -- more in joy to reign."
 "A -- men."

        }
      	}
    }
  \hspace #0.1 % gives some extra space on the right margin;
      % can be removed if page space is tight
  }
}
}
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
      \new Lyrics \lyricsto "tune" { \verseFive}
     % \new Lyrics \lyricsto "tune" {\verseSix }
    %\new Lyrics \lyricsto "tune" {\verseSeven}
    >>
    \include "hymn_layout.ly"
  }
  \markup { 
    \vspace #0.5 
  }
  \bottom
}

