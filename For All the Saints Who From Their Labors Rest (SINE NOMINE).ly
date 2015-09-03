%{
The music and poetry produced by this source code are believed to be in the public domain in the United States.
The source code itself is licensed under a Creative Commons Attribution-NonCommercial 4.0 International License:
http://creativecommons.org/licenses/by-nc/4.0/

Musicam Ecclesiae - sites.google.com/site/musicamecclesiae
%}

\version  "2.18.0-1"
\include "english.ly"
\include "hymnstyle.ly"

\paper {
  page-count = 2
}

\header {
  poet = \markup{ \fontsize #4 \smallCaps "For All the Saints Who From Their Labors Rest"  }
  meter = \markup { \small { Music: SINE NOMINE, 10 10.10 4.; R. Vaughan Williams, \italic "The English Hymnal" 1906 } }
  %piece = \markup { \small {Text: William W. How, 1864  }}
  %breakbefore
  %copyright = ""
  tagline = ""
}

global = {
  \key g \major
  \time 4/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

%%%%%%%%%% Unision, vv. 1, 2, 3

melodyUnison = \relative c'' {
  \global
  r4 d b a |
  g2. d4 |
  e g a d, |
  \tieDashed b'2.~ \bar "||" \break

  b4 |
  a2~ a4 g4 |
  fs2 fs |
  g4 a fs e |
  d2.~ \bar "||" \break

  d4 |
  g2 <<
    {
      \voiceOne
      \once \override NoteColumn #'force-hshift = #1.9 g2
    }
    \new Voice = "alternative" {
      \voiceThree
      \teeny g4 g4
    }
  >>  |
  d'2. d4 |
  c d c8[ b] a[ g] |
  a2 \bar "||" \break

  d( |
  e4) d8[ c] d2 |
  g,2. a8[( b] |
  c4) b a2 |
  g1 \bar "|."
}

sopranoUnison = \relative c'' {
  \global
  b4\rest <d, g b d> <e g b> <c fs a> |
  <e g>2. <g, d'>4 |
  <g e'> <d' g> <c e a> d |
  \override TieColumn #'tie-configuration =
  #'((1.2 . 1) (-3.3 . -1) (-6.5 . -1))
  \tieDashed <d g b>2.~ \bar "||"

  <d g b>4 |
  a'2~ a4 g |
  <a, e' fs>2 <a d fs>2 |
  <g d' g>4 <a d a'>4 <b d fs>4 <g cs e>4 |
  \override TieColumn #'tie-configuration =
  #'((-4 . 1) (-9.5 . -1) (-11.5 . -1))
  \tieDashed <fs a d>2.~ \bar "||"

  <fs a d>4 |
  <g g'>2 <<
    { \voiceOne \shiftOn <g g'>2}
    \new Voice = "alternative"
    {\voiceThree\shiftOff \teeny g'4 g4 }
  >> |
  <d g b d>2. <g b d>4 |
  <c, g c'> <a' d> c8[ b] a[ g] |
  <d fs a>2 \bar "||"

  d'( |
  e4) d8[ c] <g d'>2 |
  g2. a8[( b] |
  c4) b a2 |
  g1 \bar "|."
}

altoUnison = \relative c' {
  \global
  s1 |
  b2 c4 s4 |
  s1 |
  s2. \bar "||"

  s4 |
  <cs e>2 d4 e |
  s1 |
  s1
  s2. \bar "||"

  s4 |
  d4 e d c |
  s1 |
  s4 s4 <d g>4 d4 |
  s2 \bar "||"

  <d g>4 <f b> |
  <e g>2 d4 e8[ fs] |
  g4 b, e <d g~> |
  <e g> <d g> <d g> <c fs> |
  <b d>1 \bar "|."
}

tenorUnison = \relative c' {
  \global
  s1 |
  s1 |
  g2. fs4 |
  s2. \bar "||"

  s4 |
  s1 |
  s1 |
  s1 |
  s2. \bar "||"

  s4 |
  \teeny g2 g |
  <g b d>2. <g b d>4 |
  <g c>4 <a d> <g d'> <g d'> |
  a2 \bar "||"

  \normalsize g2 |
  g g |
  g g |
  s1 |
  s1 \bar "|."
}

bassUnison = \relative c {
  \global
  g4 b c d |
  e d c b |
  c b a d |
  g e fs \bar "||"

  g a a, b cs |
  d e d cs |
  b fs g a |
  d e d \bar "||"

  c! |
  b c b a g a g fs |
  e fs g b |
  d c \bar "||"

  b g |
  c a b c8[ d] |
  e4 d c b |
  a b8[ c] d4 d, |
  g1 \bar "|."
}

%%%%%%%%%% Harmony vv. 4, 5, 6

melodyHarmony = \relative c'' {
  \global
  b4\rest d b a |
  g2. d4 |
  e g a d, |
  b'1 \bar "||" \break

  a2 a4 g4 |
  fs2 fs |
  g4 a fs e |
  \tieDashed d2.~ \bar "||" \break

  d4 |
  g2 <<
    {
      \voiceOne
      \shiftOn g2
    }
    \new Voice = "alt" {
      \voiceFour
      \teeny \once \override NoteColumn #'force-hshift = #-1.5 g4. g8
    }
  >>  |
  d'2. d4 |
  c d c8[ b] a[ g] |
  a2 \bar "||" \break

  d( |
  e4) d8[ c] d2 |
  g,2. a8[( b] |
  c4) b a2 |
  g1 \bar "|."
}

altoHarmony = \relative c'' {
  \global
  s4 g g fs |
  e2. d4 |
  c d c d |
  d1 \bar "||"

  d2 d4 e |
  a,2 d |
  d4 d d cs |
  \slurDotted d2.( \bar "||"

  a4) |
  d2 \slurSolid \shiftOff d4( c) |
  b2 g' |
  g4 a g d |
  fs2 \bar "||"

  g4( f |
  e) g g(fs!) |
  e2 g4( f |
  e) d c( d) |
  b1 \bar "|."
}

tenorHarmony = \relative c' {
  \global
  r4 d4 e c |
  b2. g4 |
  g g g fs |
  g1 \bar "||"

  a2 b4 cs |
  d2 a |
  b4 a b g |
  \tieDotted fs2.~ \bar "||"

  fs4 |
  g2 <<
    {
      \voiceOne
      \shiftOn g2
    } \\ 		{\voiceThree \teeny \shiftOff g4 g4 }
  >> |
  g2 b |
  c4 a d d |
  d2 \bar "||"

  d2( |
  c4) e d2 |
  d4( c) b( a8[ g] |
  c4) g g( fs) |
  g1 \bar "|."
}

bassHarmony = \relative c {
  \global
  \teeny g4 \normalsize b c d |
  e2. b4 |
  c b a d |
  g,1 \bar "||"

  fs'2 fs4 e |
  d2 cs |
  b4 fs g a |
  \slurDotted d2.( \bar "||"

  c4) |
  \slurSolid b( c) b a |
  g2 g'4( fs) |
  e fs g b, |
  d( c) \bar "||"

  b2( |
  c4) a b2 |
  e d( |
  c4) d e( d) |
  g,1 \bar "|."
}

%%%%%%%%% lyrics

verseOne = \lyricmode {
  \set stanza = "1."
  For all the Saints, who from their la -- bours rest,
  \set ignoreMelismata = ##t
  Who Thee
  \unset ignoreMelismata
  by faith be -- fore the world con --
  \set ignoreMelismata = ##t
  fest,
  Thy
  \unset ignoreMelismata
  Name, O Je -- su, be for ev -- er blest.
  Al -- le -- lu -- ia, Al -- le -- lu -- ia!
}

verseTwo = \lyricmode {
  \set stanza = "2."
  Thou wast their Rock, their Fort -- ress and their Might;
  \set ignoreMelismata = ##t
  Thou, Lord,
  \unset ignoreMelismata
  their Cap -- tain in the well fought fight;
  \set associatedVoice = alternative
  Thou, in
  \set associatedVoice = melody
  the dark -- ness drear, their one true Light.
}

verseThree = \lyricmode {
  \set stanza = "3."
  O may Thy sol -- diers, faith -- ful, true and bold,
  \set ignoreMelismata = ##t
  Fight as
  \unset ignoreMelismata
  the Saints who no -- bly fought of
  \set ignoreMelismata = ##t
  old,
  And
  \unset ignoreMelismata
  win, with them, the vic -- tor’s crown of gold.
}

verseFour = \lyricmode {
  \set stanza = "4."
  O blest com -- mu -- nion! fel -- low -- ship div -- ine!
  We feeb -- ly strug -- gle, they in glo --
  \set ignoreMelismata = ##t
  ry
  shine;
  \unset ignoreMelismata
  Yet
  all are one in thee, for all are thine.
  Al -- le -- lu -- ia, Al -- le -- lu -- ia!
}

verseFive = \lyricmode {
  \set stanza = "5."
  And when the strife is fierce, the war -- fare long,
  Steals on the ear the dis -- tant tri -- umph
  \set ignoreMelismata = ##t
  song,
  And
  \unset ignoreMelismata
  hearts are brave a -- gain, and arms are strong.
}

verseSix = \lyricmode {
  \set stanza = "6."
  The gol -- den even -- ing brigh -- tens in the west;
  Soon, soon to faith -- ful war -- riors comes their rest;
  \set associatedVoice = alt
  Sweet is
  \set associatedVoice = sopranosHarm
  the calm of Pa -- ra -- dise the blest.
}

%%%%%%%%%% first page

\score {
  <<
    \new Voice = "melody" {\melodyUnison }
    \new Lyrics \lyricsto "melody" \verseOne
    \new Lyrics \lyricsto "melody" \verseTwo
    \new Lyrics \lyricsto "melody" \verseThree

    \context ChoirStaff <<
      \context Staff = upper <<
        \context Voice =
        sopranos { \voiceOne << \sopranoUnison >> }
        \context Voice =
        altos { \voiceTwo << \altoUnison >> }

      >>
      \context Staff = lower <<
        \clef bass
        \context Voice =
        tenors { \voiceOne << \tenorUnison >> }
        \context Voice =
        basses { \voiceTwo << \bassUnison >> }
      >>
    >>
  >>
  \header {
    piece = \markup { \small {Text: William W. How, 1864 }}
  }
  \midi {
    \context {
      \Score
      tempoWholesPerMinute = #(ly:make-moment 112 4)
    }
  }
  \layout {}
}

%%%%%%%%%% second page

\score {
  \context ChoirStaff <<
    \context Staff = upper <<
      \context Voice =
      sopranosHarm { \voiceOne << \melodyHarmony >> }
      \context Voice =
      altos { \voiceTwo << \altoHarmony >> }
      \context Lyrics = one \lyricsto sopranosHarm \verseFour
      \context Lyrics = two \lyricsto sopranosHarm \verseFive
      \context Lyrics = three \lyricsto sopranosHarm \verseSix
    >>
    \context Staff = lower <<
      \clef bass
      \context Voice =
      tenors { \voiceOne << \tenorHarmony >> }
      \context Voice =
      basses { \voiceTwo << \bassHarmony >> }
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
          \bold "7. "
          \column {
            " But lo! there breaks a yet more glorious day;"
            "The Saints triumphant rise in bright array;"
            "The King of glory passes on His way."
            \italic "                                              Alleluia!"
          }
        }
        \vspace #0.5
        \line {
          \bold "8. "
          \column {
            "From earth’s wide bounds, from ocean’s farthest coast,"
            "Through gates of pearl streams in the countless host,"
            "And singing to Father, Son and Holy Ghost:"
            \italic "                                               Alleluia!"
          }
        }
      }
      \hspace #1.0

    }
  }
}

