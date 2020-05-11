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
      \line {VOM HIMMEL HOCH LM}
    }
    \right-column{
      \line {adapt. from Schumann's \italic "Gesangbuch," 1539; adapt. J.S. Bach }
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null 
    \right-column {
      \line {\italic "Christe Redemptor omnium," 6th cent.}
      \line {tr. John Mason Neale}
    }
  } 
}

\header {
  tagline = ""
}



global = {
  \key c \major
  \time 4/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c'' {
  \global
  \partial 4
  c4 |
  b a b g |
  a b c \bar "||" \break

  c4 |
  c g g e8[ f] |
  g4 f e \bar "||" \break

  e4 |
  a a g8[ a] b4
  c8[ b] a4 g \bar "||" \break

  c4 |
  b a g a8[ g] |
  f8[ e] d4 c \bar "|."
}

alto = \relative c'' {
  \global
  \partial 4
  g4 |
  g8[ fs] e4 d e8[ d] |
  c4 d e

  e8[ f] |
  g8[ f] d4 d c |
  c d c

  c8[ d] |
  e4 d d8[ fs] g4 |
  g g8[ fs] g4

  e8[ d] |
  d[ e] e[ d] d[ c] c4 |
  c8[ a] b4 c
}

tenor = \relative c' {
  \global
  \partial 4
  e4 |
  d c b c8[ b] |
  a[ g] f4 g

  g4 |
  c c b bf8[ a] |
  g4 g g

  g4 |
  g fs g8[ c] b[ a] |
  g[ b] e[ d] b4

  a4 |
  g g8[ f!] f[ e] a[ b] |
  c4 g8[ f] e4
}

bass = \relative c {
  \global
  \partial 4
  c4 |
  g'4. fs8 g[ f] e4 |
  f8[ e] d4 c

  c8[ d] |
  e4 e8[ f] g4 g8[ f] |
  e[ d] c[ b] c4

  c4 |
  cs d8[ c] b[ a] g4 |
  e'8[ d] c[ d] g4

  g8[ fs] |
  g[ e] c[ d] b[ c] f[ g] a[ f] g[ g,] c4
}

verseOne = \lyricmode {
  \set stanza = "1."
  Je -- sus, the Fa -- ther's on -- ly Son,
  Whose death for all re -- demp -- tion won;
  Be -- fore the worlds, of God most high
  Be -- got -- ten all in -- eff -- ab -- ly.
}

verseTwo = \lyricmode {
  \set stanza = "2."
  The Fa -- ther's light and splen -- dour thou,
  Their end -- less hope to thee that bow;
  Ac -- cept the prayers and praise to -- day
  That through the world thy ser -- vants pay.
}

verseThree = \lyricmode {
  \set stanza = "3."
  Sal -- va -- tion's au -- thor, call to mind
  How, tak -- ing form of hu -- man -- kind,
  Born of a Vir -- gin un -- de -- filed,
  Thou in man's flesh be -- cam'st a child.
}

verseFour = \lyricmode {
  \set stanza = "4."
  Thus tes -- ti -- fies the pre -- sent day,
  Through ev -- 'ry year in long ar -- ray,
  That Thou, sal -- va -- tion's source a -- lone,
  Pro -- ceed -- edst from the Fa -- ther's throne.
}

%{ verseFive = \lyricmode {
	\set stanza = "5."
	Whence sky, and stars, and sea's a -- byss,
	And earth, and all that there -- in is,
	Shall still, with laud and ca -- rol meet,
	The Au -- thor of Thine ad -- vent greet.
}

verseSix = \lyricmode {
	\set stanza = "6."
	And we who, by Thy pre -- cious blood
	From sin re -- deemed, are marked for God,
	On this the day that saw Thy birth,
	Sing the new song of ran -- somed earth:
}

verseSeven = \lyricmode {
	\set stanza = "7."
	For that Thine ad -- vent glo -- ry be,
	O Je -- su, vir -- gin -- born, to Thee;
	With Fa -- ther, and with Ho -- ly Ghost,
	From men and from the heav'n -- ly host.
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
  \markup {
  \large {
    \fill-line {
      \hspace #1.0
      \column {
        \line {
          \bold "5. "
          \column {
            "Whence sky, and stars, and sea's abyss,"
            "And earth, and all that therein is,"
            "Shall still, with laud and carol meet,"
            "The Author of thine advent greet."
          }
        }
        \vspace #1
        \line {
          \bold "6. "
          \column {
            "And we who, by thy precious blood"
            "From sin redeemed, are marked for God,"
            "On this the day that saw thy birth,"
            "Sing the new song of ransomed earth:"
          }
        }
        \vspace #1
        \line {
          \bold "7. "
          \column {
            "For that thine advent glory be,"
            "O Jesu, virgin-born, to thee;"
            "With Father, and with Holy Ghost,"
            "From men and from the heav'nly host."
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
      \new Lyrics \lyricsto "tune" { \verseFour }
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
          \bold "5. "
          \column {
            "Whence sky, and stars, and sea's abyss,"
            "And earth, and all that therein is,"
            "Shall still, with laud and carol meet,"
            "The Author of thine advent greet."
          }
        }
        \vspace #1
        \line {
          \bold "6. "
          \column {
            "And we who, by thy precious blood"
            "From sin redeemed, are marked for God,"
            "On this the day that saw thy birth,"
            "Sing the new song of ransomed earth:"
          }
        }
        \vspace #1
        \line {
          \bold "7. "
          \column {
            "For that thine advent glory be,"
            "O Jesu, virgin-born, to thee;"
            "With Father, and with Holy Ghost,"
            "From men and from the heav'nly host."
          }
        }
      }
      \hspace #1.0

    }
  }
}
  \bottom
  
}
