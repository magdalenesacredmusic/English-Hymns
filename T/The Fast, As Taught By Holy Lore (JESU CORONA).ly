%{
The music and poetry produced by this source code are believed to be in the public domain in the United States.
The source code itself is licensed under a Creative Commons Attribution-NonCommercial 4.0 International License:
http://creativecommons.org/licenses/by-nc/4.0/

Musicam Ecclesiae - sites.google.com/site/musicamecclesiae
%}

\version  "2.18.0-1"
\include "english.ly"
\include "hymnstyle.ly"

\header {
  poet = \markup{ \fontsize #4 \smallCaps "The Fast, As Taught By Holy Lore"  }
  meter = \markup { \small { Music: JESU CORONA, L.M.; Rouen Church Melody, harm. R. Vaughan Williams } }
  piece = \markup { \small {Text: \italic "Ex more docti mystico," St. Gregory the Great; tr. J.M. Neale, 1854  }}
  %breakbefore
  %copyright = ""
  tagline = ""
}

global = {
  \key f \major
  \time 3/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
  \global
  \partial 4
  d |
  f2 g4 |
  a( g) a |
  f2 e4 |
  d2 \bar "||"

  d'4 |
  c2 d4 |
  e( d) c4 |
  b2 a4 |
  a2 \bar "||" \break

  a4 |
  bf2 g4 |
  e( f) g |
  a( g4.) f8 |
  f2 \bar "||"

  c'4 |
  a( g) e |
  f( g) a |
  f( e4.) d8 |
  d2 \bar "|."
}

alto = \relative c' {
  \global
  \partial 4
  s4 |
  <a d>2 <c e>4 |
  << { \voiceTwo \shiftOff f4 e } \\ { \voiceFour \override NoteColumn #'force-hshift = #0.4 c2 } >> <c f>4 |
  <f, c'>2 <g c>4 |
  <f a> 2

  <d' f>4 |
  e2 g4 |
  g2 e4 |
  <e g>2 <c e>4 |
  <c e>2

  d4 |
  d2 d4 |
  e d e |
  <c e>2~ <c e>8[ <a c>] |
  <a c>2

  f'4 |
  <c f> <bf d> <a c> |
  <a d>2 <c e>4 |
  c4 <g c>4. <f a>8 |
  <f a>2 \bar "|."
}

tenor = \relative c {
  \global
  \partial 4
  f4 |
  d2 c4 |
  \override Stem #'direction = #DOWN f( \override Stem #'direction = #UP c) f, |
  a2 c4 |
  d2

  a'4 |
  a2 b4 |
  c b c |
  e,2 e4 |
  e2

  f4 |
  g2 g4 |
  c a c |
  a, c4. s8 |
  s2

  a'4 |
  f, g a |
  d2 c4 |
  f c4. d8 |
  d2 \bar "|."
}

bass = \relative c {
  \global
  \partial 4
  d4 |
  s2. |
  s2. |
  s2. |
  s2

  d4 |
  a'2 g4 |
  c, g' a |
  e2 a,4 |
  a2

  d4 |
  g,2 bf4 |
  c d c |
  s4 s4. f8 |
  f2

  f4 |
  s2. |
  s2. |
  a,4 s2 |
  s2 \bar "|."
}


verseOne = \lyricmode {
  \set stanza = "1."
  The fast, as taught by ho -- ly lore,
  We keep in so -- lemn course once more;
  The fast to all men known, and bound
  In for -- ty days of year -- ly round.
}

verseTwo = \lyricmode {
  \set stanza = "2."
  The law and seers that were of old
  In di -- verse ways this Lent fore -- told,
  Which Christ, all sea -- sons' King and Guide,
  In af -- ter a -- ges sanc -- ti -- fied.
}

verseThree = \lyricmode {
  \set stanza = "3."
  More spar -- ing there -- fore let us make
  The words we speak, the food we take,
  Our sleep and mirth,-- and clos -- er barred
  Be ev' -- ry sense in ho -- ly guard.
}

verseFour = \lyricmode {
  \set stanza = "4."
  In pray'r to -- ge -- ther let us fall,
  And cry for mer -- cy, one and all,
  And weep be -- fore the Ju -- dge's feet,
  And his a -- veng -- ing wrath en -- treat.
}


\score {
  \context ChoirStaff <<
    \context Staff = upper <<
      \context Voice =
      sopranos { \voiceOne << \melody >> }
      \context Voice =
      altos { \voiceTwo << \alto >> }
      \context Lyrics = one \lyricsto sopranos \verseOne
      \context Lyrics = two \lyricsto sopranos \verseTwo
      \context Lyrics = three \lyricsto sopranos \verseThree
      \context Lyrics = four \lyricsto sopranos \verseFour

    >>
    \context Staff = lower <<
      \clef bass
      \context Voice =
      tenors { \voiceOne << \tenor >> }
      \context Voice =
      basses { \voiceTwo << \bass >> }
    >>
  >>
  \midi {
    \context {
      \Score
      tempoWholesPerMinute = #(ly:make-moment 112 4)
    }
  }
  \layout {}
}

\markup {
  \large {
    \fill-line {
      \hspace #1.0
      \column {
        \line {
          \bold "5. "
          \column {
            "Thy grace have we offended sore,"
            "By sins, O God, which we deplore;"
            "But pour upon us from on high,"
            "O pardoning One, Thy clemency."
          }
        }
        \vspace #1
        \line {
          \bold "6. "
          \column {
            "Remember Thou, though frail we be,"
            "That yet Thine handiwork are we;"
            "Nor let the honor of Thy name"
            "Be by another put to shame."
          }
        }
        \vspace #1
        \line {
          \bold "7. "
          \column {
            "Forgive the sin that we have wrought;"
            "Increase the good that we have sought;"
            "That we at length, our wanderings o'er,"
            "May please Thee here and evermore."
          }
        }
        \vspace #1
        \line {
          \bold "8. "
          \column {
            "We pray Thee, Holy Trinity,"
            "One God, unchanging Unity,"
            "That we from this our abstinence"
            "May reap the fruits of penitence."
          }
        }
      }
      \hspace #1.0

    }
  }
}



