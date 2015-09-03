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
  page-count = 1
}

\header {
  poet = \markup{ \fontsize #4 \smallCaps "Eternal Monarch, King Most High"  }
  meter = \markup { \small { Music: DEUS TUORUM MILITUM, L.M.; Grenoble Church Melody, \italic "The English Hymnal" }}
  piece = \markup { \small {Text: \italic "Aeterne Rex altissime," c. 5th cent.; tr. J.M. Neale }}
  %breakbefore
  %copyright = ""
  tagline = ""
}

global = {
  \key c \major
  \time 3/4
  %\autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
  \global
  \partial 4
  \partial 4 c4^\markup { \italic "To be sung in unison." } |
  e2 g4 | c2 g4 |
  f4( e4) d4 |
  c2 \bar "||"

  c'4 |
  e2 c4 |
  a4( b) c |
  g2 fs4 |
  g2 \bar "||" \break

  g4 |
  a2 b4 |
  c2 g4 |
  f4( e) d |
  e2 \bar "||"

  g4 |
  a4( b) c |
  g( f) e |
  d2 c4 |
  c2 \bar "||"
}

soprano = \relative c' {
  \global
  \partial 4 c4 |
  e2 g4 | c2 g4 |
  f4( e4) d4 |
  c2 \bar "||"

  c'4 |
  e2 c4 |
  a4( b) c |
  g2 fs4 |
  g2 \bar "||" \break

  g4 |
  a2 b4 |
  c2 g4 |
  f4( e) d |
  e2 \bar "||"

  g4 |
  a4( b) c |
  g( f) e |
  d2 c4 |
  c2 \bar "||"
}

alto = \relative c' {
  \global
  \partial 4
  s4 |
  s2. |
  <c e>2 <c e>4 |
  s2. |
  s2 \bar "||"

  <e g>4 |
  <e a>2 <e a>4 |
  fs2 <e g>4 |
  b2 d4 |
  d2 \bar "||"

  <c e>4 |
  <c f>2 f4 |
  e2 c4 |
  c2 b4 |
  b2 \bar "||"

  c4 |
  <c e>4 \tieUp <d g ~>4 <e g>4 |
  <b d>4 c c |
  s2 c4 |
  c2 \bar "||"
}

tenor = \relative c {
  \global
  \partial 4
  <e g>4 |
  <g c>2 <g b>4 |
  s2. |
  <a c>4 g4 b4 |
  <e, g>2 \bar "||"

  c'4 |
  c2 a4 |
  d2 g,4 |
  g2 a4 |
  <g b>2 \bar "||"


  s4 |
  s2 b4 |
  a2 g4 |
  a g g |
  g2 \bar "||"

  e4 |
  s2. |
  s4 a4 g |
  <g b>2 <e g>4 |
  <e g>2 \bar "||"
}

bass = \relative c {
  \global
  \partial 4
  c4 |
  c2 e4 |
  a,2 c4 |
  f4 c4 g'4 |
  c,2 \bar "||"

  c'4 |
  a2 c,4 |
  d2 c4 |
  e2 d4 |
  g,2 \bar "||"

  c4 |
  f2 d4 |
  a2 e'4 |
  f c g' |
  e2 \bar "||"

  c4 |
  a g e |
  g a c |
  g2 <c, c'>4 |
  <c c'>2 \bar "||"
}


verseOne = \lyricmode {
  \set stanza = "1."
  E -- ter -- nal Mon -- arch, King most high,
  Whose Blood hath brought re -- demp -- tion nigh,
  By whom the death of Death was wrought,
  And con -- qu'ring Gra -- ce's bat -- tle fought:
}

verseTwo = \lyricmode {
  \set stanza = "2."
  As -- cend -- ing to the throne of might,
  And seat -- ed at the Fa -- ther's right,
  All pow'r in heav'n is Je -- sus' own.
  That here His man -- hood had not known.
}

verseThree = \lyricmode {
  \set stanza = "3."
  That so, in na -- ture's tri -- ple frame,
  Each heav'n -- ly and each earth -- ly name,
  And things in hell's a -- byss ab -- horred,
  May bend the knee and own Him Lord.
}

verseFour = \lyricmode {
  \set stanza = "4."
  Yea, An -- gels trem -- ble when they see
  How changed is our hu -- man -- i -- ty;
  That flesh hath purged what flesh had stained,
  And God, the Flesh of God, hath reigned.
}


%{verseFive = \lyricmode {
  \set stanza = "5."
  Be Thou our joy and strong de -- fence,
  Who art our fu -- ture re -- com -- pense:
  So shall the light that springs from Thee
  Be ours through all e -- ter -- ni -- ty.
}

verseSix = \lyricmode {
  \set stanza = "6."
  O ri -- sen Christ, as -- cend -- ed Lord,
  All praise to Thee let earth ac -- cord,
  Who art, while end -- less a -- ges run,
  With Fa -- ther and with Spir -- it One.
}
%}

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
      %\context Lyrics = five \lyricsto sopranos \verseFive
      % \context Lyrics = six \lyricsto sopranos \verseSix
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
      \hspace #0.1 % moves the column off the left margin;
      % can be removed if space on the page is tight
      \column {
        \line {
          \bold "5. "
          \column {
            "Be Thou our joy and strong defence,"
            "Who art our future recompense:"
            "So shall the light that springs from Thee"
            "Be ours through all  ternity."
          }
        }
      }
      \hspace #0.1  % adds horizontal spacing between columns;
      % if they are still too close, add more " " pairs
      % until the result looks good
      \column {
        \line {
          \bold "6. "
          \column {
            "O risen Christ, ascended Lord,"
            "All praise to Thee let earth accord,"
            "Who art, while endless ages run,"
            " With Father and with Spirit One."
          }
        }
      }
      \hspace #0.1 % gives some extra space on the right margin;
      % can be removed if page space is tight
    }
  }
}

%{
\markup \fill-line {
  \center-column 	{
    \large {
      \vspace #1.5
      \column {
        \line {
          \bold "6. "
          \column {
            "O risen Christ, ascended Lord,"
            "All praise to Thee let earth accord,"
            "Who art, while endless ages run,"
            " With Father and with Spirit One."
          }
        }
        \hspace #1.0
      }
    }
  }
}

%}
