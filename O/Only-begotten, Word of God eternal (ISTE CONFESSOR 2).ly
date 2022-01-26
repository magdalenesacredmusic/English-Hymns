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
      \line {ISTE CONFESSOR (2)   11 11 11 5}
    }
    \column{
      \line {\italic "Poitiers Antiphoner," 1746}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null
    \right-column {
      \line {\italic "Christe cunctorum Dominator alme"}
      \line {9th cent.; Tr. Maxwell J. Blacker (1822-88),  1906}
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

melody = \relative c' {
  \global
  d2 a'4 f |
  g2 a |
  d,4. e8 f4 g |
  f( e) d2 |
  
  d2 a'4 f |
  g2 a |
  a4. g8 a4 b |
  c( <g b>) a2 |
  
  d2 c4 d |
  c( bf) a2 |
  c4. bf8 a4 bf |
  <f a>( <e g>) f2 |
  
  a2 d,4 e |
  f2( e) |
  d1 \bar "||" \break
  
  d4( e d c) |
  d1 \bar "|."
}

melodya = \relative c' {
  \global
  d2 a'4 f |
  g2 a |
  d,4. e8 f4 g |
  f( e) d2 |
  
  d2 a'4 f |
  g2 a |
  a4. g8 a4 b |
  c( b) a2 |
  
  d2 c4 d |
  c( bf) a2 |
  c4. bf8 a4 bf |
  a( g) f2 |
  
  a2 d,4 e |
  f2( e) |
  d1 \bar "||" \break
  
  d4( e d c) |
  d1 \bar "|."
}

alto = \relative c' {
  \global
  d2 e4 d |
  d2 c |
  a4. c8 c4 d |
  c2 a |
  
  d2 e4 f |
  <c e>2 <c f> |
  c2 f4 f |
  e2 <c e> |
  
  d2 f4 f |
  e f <c f>2 |
  <c e>4. f8 <c f>4 <bf d> |
  c2 <a d>2 
  
  <a c> bf4 g |
  <a c>1 |
  <f a>1 |
  
  a4 c bf a |
  a1
}

tenor = \relative c' {
  \global
  a2 a |
  d, e |
  f4. g8 a4 bf |
  a g f2 |
  
  a2 a |
  g f |
  f4. g8 c4 d |
  g,2 a |
  
  <f bf> a4 bf |
  g f a2 |
  
  g4. f8 a4 g |
  f g d2 |
  
  f2. c4 |
  c1 d |
  
  f4 a f2 |
  <d f>1
}

bass = \relative c {
  \global
  <d f>2 <c e>4 <d f> |
  bf2 a |
  d4. c8 a4 g |
  a c d2 |
  
  <d f>2 <c e>4 d |
  c2 f, |
  f'4. e8 f4 d |
  c e a2 |
  
  bf,2 f'4 bf, |
  c d f2 |
  c4. d8 f4 g, |
  a c d2 |
  f,2 bf4 c |
  f,2 a |
  d,1 |
  
  d'4 a bf f |
  d1
}

verseOne = \lyricmode {
  \set stanza = "1."
  On -- ly -- be -- got -- ten, Word of God e -- ter -- nal,
  Lord of Cre -- a -- tion, mer -- ci -- ful and might -- y,
  Hear thou thy ser -- vants, when their tune -- ful voice -- es
  Rise to thy pre -- sence.
}

verseTwo = \lyricmode {
  \set stanza = "2."
  Thus in our sol -- emn Feast of Ded -- i -- ca -- tion,
  Graced with re -- turn -- ing rites of due de -- vo -- tion,
  Ev -- er thy child -- ren, year by year re -- joic -- ing,
  Chant in thy tem -- ple.
}

verseThree = \lyricmode {
  \set stanza = "3."
  This is thy pal -- ace; here thy pre -- sence -- cham -- ber;
  Here may thy ser -- vants, at the mys -- tic ban -- quet,
  Dai -- ly a -- dor -- ing, take thy bod -- y bro -- ken,
  Drink of thy cha -- lice.
}

verseFour = \lyricmode {
  \set stanza = "4."
  Here for thy child -- ren stand sthe ho -- ly lav -- er,
  Foun -- tain of par -- don for the guilt of na -- ture,
  Cleansed by whose wa -- ter springs a race an -- oint -- ed,
  Liege -- men of Je -- sus.
}

verseFive = \lyricmode { 
  \set stanza = "5."
  Here in our sick -- ness, heal -- ing grace a -- bound -- eth,
  Light in our blind -- ness, in our toil re -- fresh -- ment;
  Sin is for -- giv -- en, hope o'er fear pre -- vail -- eth,
  Joy ov -- er sor -- row.
  
  \set stanza = "8." A -- men.
}

\book {
  \include "hymn_paper_multipage.ly"
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
    \include "hymn_layout_ragged.ly"
  }
    \markup {
    \vspace #1
  \large {
    \fill-line {
      \hspace #0.1 % moves the column off the left margin;
      % can be removed if space on the page is tight
      \column {
        \line {
          \bold "6. "
          \column {
            "Hallowed this dwelling where the Lord abideth,"
            "This is none other than the gate of heaven;"
            "Strangers and pilgrims, seeking homes eternal,"
            "              Pass through its portals."
          }
        }
        \vspace #1
        \line {
          \bold "7. "
          \column {
            "Lord, we beseech thee, as we throng thy temple"
            "By thy past blessings, by thy present bounty,"
            "Smile on thy children, and with tender mercy"
            "              Hear our petitions."
          }
        }
    \vspace #1
        \line {
          \bold "8. "
          \column {
            "God in Three Persons, Father everlasting,"
            "Son co-eternal, ever-blessèd Spirit,"
            "Thine be the glory, praise, and adoration,"
            "              Now and for ever.  Amen."
          }
        }
      }
      \hspace #0.1 % gives some extra space on the right margin;
      % can be removed if page space is tight
    }
  }
}
\markup {
  \vspace #1
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
      \new Lyrics \lyricsto "tune" { \verseFour}
      \new Lyrics \lyricsto "tune" { \verseFive }
    >>
    \include "hymn_layout_ragged.ly"
  }
      \markup {
    \vspace #1
  \large {
    \fill-line {
      \hspace #0.1 % moves the column off the left margin;
      % can be removed if space on the page is tight
      \column {
        \line {
          \bold "6. "
          \column {
            "Hallowed this dwelling where the Lord abideth,"
            "This is none other than the gate of heaven;"
            "Strangers and pilgrims, seeking homes eternal,"
            "                   Pass through its portals."
          }
        }
        \vspace #1
        \line {
          \bold "7. "
          \column {
            "Lord, we beseech thee, as we throng thy temple"
            "By thy past blessings, by thy present bounty,"
            "Smile on thy children, and with tender mercy"
            "                   Hear our petitions."
          }
        }
    \vspace #1
        \line {
          \bold "8. "
          \column {
            "God in Three Persons, Father everlasting,"
            "Son co-eternal, ever-blessèd Spirit,"
            "Thine be the glory, praise, and adoration,"
            "                   Now and for ever.  Amen."
          }
        }
      }
      \hspace #0.1 % gives some extra space on the right margin;
      % can be removed if page space is tight
    }
  }
}
  \markup {
    \vspace #0.5
  }
  \bottom
}
