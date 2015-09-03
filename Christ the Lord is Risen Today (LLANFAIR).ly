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
  poet = \markup{ \fontsize #4 \smallCaps "Christ the Lord is Risen Today"  }
  meter = \markup { \small { Music: LLANFAIR, 7.4.7.4. D; \italic "Welsh Hymn Melody," R. Williams; \italic "The English Hymnal" } }
  piece = \markup { \small {Text: Charles Wesley }}
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

melody = \relative c'' {
  \global
  g4 g b b |
  d c8[ b] a2 |
  d4.( c8 b4) c8[ b] |
  a2 g \bar "||"

  g4 g b b |
  d c8[ b] a2 |
  d4.( c8 b4) c8[ b] |
  a2 g \bar "||"

  b4 b d d |
  c8[ d] c[ b] a2 |
  b4.( a8 b4) cs |
  d2 d \bar "||"

  g,4 g b b |
  d c8[ b] a2 |
  d4.(^\markup {\italic "In unison"} c8 b4) c8[ b] |
  a2 g \bar "|."
}

alto = \relative c' {
  \global
  d4 d g g |
  g a8[ g] fs2 |
  d4( e8[ fs] g4) g |
  g( fs) g2 \bar "||"

  d4 d g g |
  g a8[ g] fs2 |
  d4( e8[ fs] g4) g |
  g( fs) g2 \bar "||"

  g4 g f f |
  e e fs2 |
  g4.( a8 g4) g |
  fs2 fs \bar "||"

  g4 d d g |
  g a8[ g] fs2 |
  << { \voiceTwo d4 e8[ fs] <d g>4 c8[ d]} \\ { \voiceFour d2 s4 g } >> |
  <e g>4 <d fs> d2 \bar "|."
}

tenor = \relative c' {
  \global
  b4 b g g |
  d' e a,2 |
  b4.( c8 d4) c8[ d] |
  e4 d b2 \bar "||"

  b4 b g g |
  d' e a,2 |
  b4.( c8 d4) c8[ d] |
  e4 d b2 \bar "||"

  g4 g a b |
  c c d2 |
  d2. g,4 |
  a2 d \bar "||"

  d4 d8[ c] b4 g |
  d' e a,2 |
  g4. a8 b4 g |
  a2 b \bar "|."
}

bass = \relative c' {
  \global
  g4 g e e |
  b c d2 |
  b'4.( a8 g4) e8[ d] |
  c4( d) g2 \bar "||"

  g4 g e e |
  b c d2 |
  b'4.( a8 g4) e8[ d] |
  c4( d) g2 \bar "||"

  e4 e d d |
  c a d2 |
  g4.( fs8 g4) e |
  d2 d'4( c!) \bar "||"

  b b8[ a] g4 e |
  b c << { \voiceTwo d2 } \\ { \voiceFour \teeny d4_\markup {\italic Org.}  c } >> |
  b4. a8 g4 a8[ b] |
  <c g'>4 <d fs> <g g,>2 \bar "|."
}

verseOne = \lyricmode {
  \set stanza = "1."
  Christ, the Lord, is ris'n to -- day, Al -- le -- lu -- ia!
  Sons of men and an -- gels say!, Al -- le -- lu -- ia!
  Raise your joys and tri -- umphs high, Al -- le -- lu -- ia!
  Sing, ye heav'ns, and earth re -- ply. Al -- le -- lu -- ia!

}

verseTwo = \lyricmode {
  \set stanza = "2."
  Love's re -- deem -- ing work is done,, Al -- le -- lu -- ia!
  Fought the fight, the bat -- tle won; Al -- le -- lu -- ia!
  Lo! our Sun's ec -- lipse is o'er, Al -- le -- lu -- ia!
  Lo! He sets in blood no more. Al -- le -- lu -- ia!
}

verseThree = \lyricmode {
  \set stanza = "3."
  Vain the stone, the watch, the seal, Al -- le -- lu -- ia!
  Christ hath burst the gates of hell: Al -- le -- lu -- ia!
  Death in vain for -- bids His rise, Al -- le -- lu -- ia!
  Christ hath o -- pened par -- a -- dise. Al -- le -- lu -- ia!

}

verseFour = \lyricmode {
  \set stanza = "4."
  Lives a -- gain our glo -- rious King, Al -- le -- lu -- ia!
  Where, O death, is now thy sting? Al -- le -- lu -- ia!
  Once He died our souls to save, Al -- le -- lu -- ia!
  Where thy vic -- to -- ry, O grave? Al -- le -- lu -- ia!
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
      tempoWholesPerMinute = #(ly:make-moment 84 4)
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
            "Soar we now where Christ hath led, Alleluia!"
            "Foll'wing our exalted head; Alleluia!"
            "Made like Him, like Him we rise, Alleluia!"
            "Ours the cross, the grave, the skies. Alleluia!"
          }
        }
        \vspace #1
        \line {
          \bold "6. "
          \column {
            "What tho' once we perished all, Alleluia!"
            "Partners of our parents fall; Alleluia!"
            "Second life we all receive, Alleluia!"
            "In our heav'nly Adam live. Alleluia!"
          }
        }
                \vspace #1
        \line {
          \bold "7. "
          \column {
            "Hail the Lord of earth and heav'n! Alleluia!"
            "Praise to Thee by both be giv'n! Alleluia!"
            "Thee we greet triumphant now, Alleluia!"
            "Hail the resurrection Thou! Alleluia!"
          }
        }
        \vspace #1
        \line {
          \bold "8. "
          \column {
            "King of glory! soul of bliss! Alleluia!"
            "Everlasting life is this, Alleluia!"
            "Thee to know, Thy pow'r to prove, Alleluia!"
            "Thus to sing, and thus to love! Alleluia!"
          }
        }
      }
      \hspace #0.1 % gives some extra space on the right margin;
      % can be removed if page space is tight
    }
  }
}