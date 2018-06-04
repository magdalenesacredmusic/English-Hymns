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
  poet = \markup{ \fontsize #4 \smallCaps "Lift High the Cross"  }
  meter = \markup { \small { Music: CRUCIFER, 10.10.10.10.; Sydney H. Nicholson, 1916 } }
  piece = \markup { \small {Text: George William Kitchin, 1887; adapt. Michael Robert Newbolt, 1916 }}
  %breakbefore
  %copyright = ""
  tagline = ""
}

global = {
  \key c \major
  \time 4/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

refrain = \relative c'' {
  \global
  g2 c4. g8 |
  f2. g4 |
  e4. f8 g4 a |
  d,2. d4 | \break
  e g c2~ |
  c4 a g2~ |
  g4 a f8[ e] d4 |
  c1^\markup {\italic Fine}
  \bar "|." \break
}

verses = \relative c'' {
  g2 fs4. e8 |
  fs2 d |
  e4. fs8 g4 a |
  b2 g |
  c b4( a) |
  d2 d, |
  e4. g8 g4 fs |
  g1^\markup {\italic "D.C. al Fine"}
  \bar "||"
}

alto = \relative c' {
  \global
  c4( d) e c |
  c( b c) d |
  c4. c8 c4 c |
  c( b a) g |
  g b c( d |
  e) f g( f |
  e) d8[ c] c4 b8[ a] |
  g1
  \bar "|."

  e'4( d) c4. c8 |
  d2 d |
  g,4. b8 b4 e |
  ds2 e4( d) |
  c( e) d2 |
  d2 d |
  c4. e8 d4 d |
  << { \voiceTwo d1 } \\ {\voiceThree  \override NoteHead #'font-size = #-3 s4 <a c f!>4 <f a d> <g b e> } >> \bar "||"
}

tenor = \relative c {
  \global
  e4( f) g g |
  a( g f) d |
  g4. f8 e4 d |
  g2. f4 |
  e f g( a |
  b) c d( c |
  b) a a8[ g] f4 |
  f4( d e2) \bar "|."

  b'2 a4. a8 |
  a2 g4( fs) |
  e4. ds8 e4 e |
  fs2 g |
  a4( g) fs2 |
  g4( a) g( fs) |
  e4. c'8 a4 a |
  b1 \bar "||"
}

bass = \relative c {
  \global
  c2 c4 e |
  d( g, a) b |
  c a g fs |
  g2( a4) b |
  c d e( f |
  g) a b( a |
  g) f8[ e] d4 g, |
  c1 \bar "|."

  e2 a,4. a8 |
  d4( c) b2 |
  c4. b8 e4 c |
  b2 e |
  a, d4( c) |
  b2 b |
  c4. c8 d4 d |
  g,1 \bar "||"
}

refrainText = \lyricmode {
  Lift high the cross, the love of Christ pro -- claim
  till all the world a -- dore his sac -- red Name.
}

verseOne = \lyricmode {
  \set stanza = "1."
  Come, breth -- ren, fol -- low where our Cap -- tain trod,
  our King vic -- to -- rious, Christ the Son of God.
}

verseTwo = \lyricmode {
  \set stanza = "2."
  Led on their way by this tri -- um -- phant sign,
  the hosts of God in con -- quering ranks com -- bine.
}

verseThree = \lyricmode {
  \set stanza = "3."
  Each new -- born sol -- dier of the Cru -- ci -- fied
  bears on the brow the seal of him who died.
}

verseFour = \lyricmode {
  \set stanza = "4."
  This is the sign which Sa -- tan's le -- gions fear
  and an -- gels veil their fa -- ces to re -- ver.
}

\score {
  \context ChoirStaff <<
    \context Staff = upper <<
      \context Voice = refrain {
        \voiceOne
        \refrain {
          \context Voice = verses {
            \voiceOne
            \verses
          }
        }
      }
      \context Voice =
      altos { \voiceTwo << \alto >> }
      \context Lyrics = one \lyricsto refrain \refrainText
      \context Lyrics = one \lyricsto verses \verseOne
      \context Lyrics = two \lyricsto verses \verseTwo
      \context Lyrics = three \lyricsto verses \verseThree
      \context Lyrics = four \lyricsto verses \verseFour
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
      tempoWholesPerMinute = #(ly:make-moment  96 4)
    }
  }

  \layout {}
}

%\pageBreak

\markup {
  \large {
    \fill-line {
      \hspace #1.0
      \column {
        \line {
          \bold "5. "
          \column {
            "Saved by this Cross whereon their Lord was slain,"
            "the sons of Adam their lost home regain."
          }
        }
        \vspace #1
        \line {
          \bold "6. "
          \column {
            "From north and south, from east and west they raise"
            "in growing unison their songs of praise."
          }
        }
        \vspace #1
        \line {
          \bold "7. "
          \column {
            "O Lord, once lifted on the glorious tree,"
            "as thou hast promised, draw the world to thee."
          }
        }
        \vspace #1
        \line {
          \bold "8. "
          \column {
            "Let every race and every language tell"
            "of him who saves our souls from death and hell."
          }
        }
        \vspace #1
        \line {
          \bold "9. "
          \column {
            "From farthest regions let their homage bring,"
            "and on his Cross adore their Savior King. "
          }
        }
        \vspace #1
        \line {
          \bold "10. "
          \column {
            "Set up thy throne, that earth's despair may cease"
            "beneath the shadow of its healing peace. "
          }
        }
        \vspace #01
        \line {
          \bold "11. "
          \column {
            "For thy blest Cross which doth for all atone"
            "creation's praises rise before thy throne."
          }
        }
      }
      \hspace #1.0

    }
  }
}

