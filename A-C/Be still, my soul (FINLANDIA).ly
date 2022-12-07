%{
The music and poetry produced by this source code are believed to be in the public domain in the United States.
The source code itself is licensed under a Creative Commons Attribution-NonCommercial 4.0 International License:
http://creativecommons.org/licenses/by-nc/4.0/

Musicam Ecclesiae - sites.google.com/site/musicamecclesiae
%}

\version "2.22.2"
\include "english.ly"
\include "hymn_definitions.ly"

refs = \markup {
  \fontsize #-3 {
    \left-column {
      \wordwrap {
        Text: \italic "Stille, mein Wille; dein Jesus hilft siegen," Kathrina von Schlegel (1697-1797); Tr. Jane Borthwick (1813-1897)
      }
      \wordwrap {
        Music: FINLANDIA,  10 10  10 10  10 10, Jean Sibelius (1865-1957)
      }
    }
  }
}

top = \markup {
  \tiny {
  \fill-line {
    \column {
      \line {FINLANDIA  10 10  10 10  10 10}
    }
    \column{
      \line {Jean Sibelius}
    }
  }
}
}

bottom = \markup  {
  \tiny {
  \fill-line {
    \null
    \right-column {
      \line {\italic "Stille, mein Wille; dein Jesus hilft siegen"}
      \line {Kathrina von Schlegel (1697-1797)}
      \line {Tr. Jane Borthwick (1813-1897)}
    }
  }
}
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
  \partial 2. a4 g a |
  bf2. a4 |
  g a f4. g8 |
  g4( a2.)~ |
  a4 a g a |
  bf2. a4 |
  g a f4. g8 |
  a1~ |
  a4 c c c |
  d2. a4 |
  a c c4. g8 |
  g4( bf2.)~ |
  bf4 \bar ""
    bf a g |
    a2. f4 |
    f g g4. a8 |
    a1~ |
    a4 c c c |
    d2. a4 |
    a c c4. g8 |
    g4( bf2.)~ |
    bf4 bf a g |
    a2. f4 |
    f g g4. f8 |
    f1~ | 
    f4 \bar "|."
}

alto = \relative c' {
  \global
  f4 e f |
  e2. f4 |
  e f d4. e8 |
  e4( f2.~ ) |
  f4 f e f |
  e2. f4 |
  e f d4. e8 |
  f1~ |
  f4 f f f |
  f2. f4 |
  f f f4. e8 |
  e4( g2.~) |
  g4 
    g fs g |
    f2. f4 |
    f f e4. e8 |
    e1~ |
    e4 a f f |
    f2. f4 |
    f f f4. e8 |
    e4( g2.~) |
    g4 g fs g |
    f2. c4 |
    f f e4. f8 |
    f1~ | 
    f4
}

tenor = \relative c' {
  \global
  \partial 2.
  c4 c c |
  c2. c4 |
  c c bf4. bf8 |
  bf4( c2.)~ |
  c4 c c c |
  c2. c4 |
  c c bf4. bf8 |
  c1~ |
  c4 a a a |
  a2. d4 |
  d c c4. c8 |
  c4( d2.)~ |
  d4 d c d |
  c2. c4 |
  d d d4. cs8 |
  cs1~ |
  cs4 c a a |
  a2. d4 |
  d c c4. c8 |
  c4( d2.)~ |
  d4 d c d |
  c2. a4 |
  a bf bf4. a8 |
  a1~ |
  a4
}

bass = \relative c {
  \global
 f4 bf a |
 g2. f4 |
 bf a bf4. g8 |
 g4( f2.)~ |
 f4 f bf a |
 g2. f4 |
 bf a bf4. g8 |
 f1~ |
 f4 f f e |
 d2. d4 |
 d a a4. c8 |
 c4( g2.)~ |
 g4 
   g a bf |
   c2. a'4 |
   bf4 bf bf4. a8 |
   a1~ |
   a4 f f e |
   d2. d4 |
   d a' a4. c8 |
   c4( g2.)~ |
   g4 g, a bf |
   c2. c4 |
   c c c4. f8 |
   f1~ |
   f4
}

verseOne = \lyricmode {
  \vOne
  Be still, my soul— the Lord is on thy side!
  Bear pa -- tient --  ly the cross of grief or pain;
  Leave to thy God to or -- der and pro -- vide—
  In ev -- 'ry change He faith -- ful will re main.
  Be still, my soul— thy best, thy heav'n -- ly Friend
  Through thorn -- y ways leads to a joy -- ful end.
}

verseTwo = \lyricmode {
  \vTwo
  Be still, my soul— thy God doth un -- der -- take
  To guide the fu -- ture as he has the past;
  Thy hope, thy con -- fi -- dence let noth -- ing shake—
  All now mys -- te -- rious shall be bright at last.
  Be still, my soul— the waves and winds still know
  His voice who ruled them while he dwelt be -- low.
}

verseThree = \lyricmode {
  \vThree
  Be still, my soul— the hour is has -- t'ning on
  When we shall be for -- ev -- er with the Lord,
  When dis -- ap -- point -- ment, grief, and fear are gone,
  Sor -- row for -- got, love's pur --est joys re -- stored.
  Be still, my soul— when change and tears are past,
  All safe and bless -- ed we shall meet at last.
}

#(set-global-staff-size 20)
\book {
 % \include "lilypond-book-preamble.ly"
  %\include "hymn_paper.ly"
  \header {
    tagline = ""
  }
  %\top
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
        tempoWholesPerMinute = #(ly:make-moment 96 4)
      }
    }
    \include "hymn_layout.ly"
  }
%  \bottom
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
  \score { %\transpose c d
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
 % \top
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
%  \bottom
\refs
}
