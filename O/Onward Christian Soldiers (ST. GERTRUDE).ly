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
      \line {ST. GERTRUDE  65 65 with Refrain}
    }
    \column{
      \line {Arthur Sullivan, 1871}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null 
    \right-column {
      \line {Sabine Baring-Gould, 1865}
    } 
  }
}
%}


global = {
  \key f \major
  \time 4/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c'' {
  \global
  c4 c c c |
  c4.( d8) c2 |
  g4 g f g |
  a1 \bar "||"

  f4 a c f |
  f2 e |
  d4 d a b |
  c1 \bar "||"

  g4 g c g |
  a4.( bf8) a2 |
  c4 c f c |
  d1 \bar "||"

  d4 c bf c |
  d( c) bf( c) |
  d c bf a |
  g1 \bar "||" \break

  f4^\markup {Refrain} f f f |
  f( e8[ d]) e4( f) |
  g4 g g f8[ g] |
  a1 |
  c4 c f e |
  f2 c |
  bf4 a g4. f8 |
  f1 \bar "|."

}

alto = \relative c'' {
  \global
  a4 a a a |
  bf2 bf |
  e,4 e d e |
  f1 \bar "||"

  f4 f f f |
  g2 g |
  f4 f f f |
  e1 \bar "||"

  e4 e g e |
  f4.( g8) f2 |
  f4 f f f |
  f1 \bar "||"

  f4 f f f |
  f2 f |
  f4 f g f |
  e1 \bar "||"

  c4 c c c |
  c2 c |
  c4 c c c |
  c1 |
  a'4 a bf bf |
  a2 f |
  f4 f e4. f8 |
  f1 \bar "|."

}

tenor = \relative c {
  \global
  f4 a c f |
  f2 e |
  c4 c c c |
  c1 \bar "||"

  c4 c c c |
  c4.( d8) c2 |
  b4 b c d |
  c1 \bar "||"

  c4 c c c |
  c2 c |
  a4 a c a |
  bf1 \bar "||"

  bf4 a bf a |
  bf( a) bf( a) |
  bf a g g |
  c1 \bar "||"

  a4 a a a |
  bf2 bf |
  bf4 bf bf bf |
  a f( a) c |
  f2 c |
  c c |
  d4. c8 bf4. a8 |
  a1 \bar "|."
}

bass = \relative c {
  \global
  f4 f f f |
  g2 c, |
  bf'4 bf a g |
  f1 \bar "||"

  a4 a a a |
  g2 g |
  g4 g g g |
  c,1 \bar "||"

  c4 c e c |
  f2 f |
  f4 f a f |
  bf1 \bar "||"

  bf4 f d f |
  bf4( f) d( f) |
  bf, bf bf bf |
  c1 \bar "||"

  f4 c f c |
  g'( c,) g'( c,) |
  e c e c |
  f1 |
  f4 f g g |
  a2 a, |
  bf4 g c4. c8 |
  <f f,>1 \bar "|."
}

verseOne = \lyricmode {
  \set stanza = "1."
  On -- ward, Chris -- tian sol -- diers,
  March -- ing as to war,
  With the cross of Je -- sus
  Go -- ing on be --  fore.
  Christ, the roy -- al Mas -- ter,
  Leads a -- gainst the foe;
  For -- ward in -- to bat -- tle
  See His ban -- ners go!

  On -- ward, Chris -- tian sol -- diers,
  March -- ing as to war,
  With the cross of Je -- sus
  Go -- ing on be -- fore.
}

verseTwo = \lyricmode {
  \set stanza = "2."
  At the sign of tri -- umph
  Sa -- tan’s host doth flee;
  On then, Chris -- tian sol -- diers,
  On to vic -- to -- ry!
  Hell’s foun -- da -- tions qui -- ver
  At the shout of praise;
  Broth -- ers lift your voi -- ces,
  Loud your an -- thems raise.
}

verseThree = \lyricmode {
  \set stanza = "3."
  Like a migh -- ty ar -- my
  Moves the church of God;
  Broth -- ers, we are tread -- ing
  Where the saints have trod.
  We are not di -- vid -- ed,
  All one bo -- dy we,
  One in hope and doc -- trine,
  One in cha -- ri -- ty.
}

%%% if more verses are needed in between the musical staves, uncomment this section
%{
verseFour = \lyricmode {
	\set stanza = "4."

}
%}

\book {
  \include "hymn_paper_multipage.ly.ly"
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
        tempoWholesPerMinute = #(ly:make-moment 108 4)
      }
    }
    \include "hymn_layout.ly"
  }
  \markup {
  \large {
    \fill-line {
      \hspace #1.0
      \column {
        \line {
          \bold "4. "
          \column {
            "What the saints established"
            "  That I hold for true."
            "What the saints believèd,"
            "  That I believe too."
            "Long as earth endureth,"
            "  Men the faith will hold,"
            "Kingdoms, nations, empires,"
            "  In destruction rolled."
          }
        }
        \vspace #1
        \line {
          \bold "5. "
          \column {
            "Crowns and thrones may perish,"
            "  Kingdoms rise and wane,"
            "But the church of Jesus"
            "  Constant will remain."
            "Gates of hell can never"
            "  'gainst that church prevail;"
            "We have Christ’s own promise,"
            "  and that cannot fail."
          }
        }
        \vspace #1
        \line {
          \bold "6. "
          \column {
            "Onward then, ye people,"
            "  Join our happy throng,"
            "Blend with ours your voices"
            "  In the triumph song."
            "Glory, laud and honor"
            "  Unto Christ the King,"
            "This through countless ages"
            "  Men and angels sing."

          }
        }
      }
      \hspace #1.0

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
  \markup {
  \large {
    \fill-line {
      \hspace #1.0
      \column {
        \line {
          \bold "4. "
          \column {
            "What the saints established"
            "  That I hold for true."
            "What the saints believèd,"
            "  That I believe too."
            "Long as earth endureth,"
            "  Men the faith will hold,"
            "Kingdoms, nations, empires,"
            "  In destruction rolled."
          }
        }
        \vspace #1
        \line {
          \bold "5. "
          \column {
            "Crowns and thrones may perish,"
            "  Kingdoms rise and wane,"
            "But the church of Jesus"
            "  Constant will remain."
            "Gates of hell can never"
            "  'gainst that church prevail;"
            "We have Christ’s own promise,"
            "  and that cannot fail."
          }
        }
        \vspace #1
        \line {
          \bold "6. "
          \column {
            "Onward then, ye people,"
            "  Join our happy throng,"
            "Blend with ours your voices"
            "  In the triumph song."
            "Glory, laud and honor"
            "  Unto Christ the King,"
            "This through countless ages"
            "  Men and angels sing."

          }
        }
      }
      \hspace #1.0

    }
  }
}
  \bottom
}



