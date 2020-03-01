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
      \line {INNOCENTS  77 77}
    }
    \right-column{
      \line {French melody}
      \line {arr. W.H. Monk, \italic "The Parish Choir," 1850}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null 
    \right-column {
      \line {\italic "Victis sibi cognomina"}
      \line {Paris Breviary, 1736; tr. John Chandler, 1837}
      \line {alt. \italic "The English Hymnal," 1906}
    }
  } 
}

\header {
  tagline = ""
}

\header {
  tagline = ""
}

global = {
  \key d \major
  \time 4/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
  \global
  \partial 2
fs4. g8 |
a4 d cs b |
a2 d,4. e8 |
fs4 a g fs |
e2 \bar "" \break

fs4. g8 |
a4 d cs b |
a2 d,4. e8 |
fs4 g fs e |
d2 \bar "|."
}

alto = \relative c' {
   \global
\partial 2
d4. cs8 |
d4 fs e d8[ e] |
fs2 d4. cs8 |
d4 a b8[ cs] d4 |
cs2 d4. cs8 |
d4 fs e e8[ d] |
cs2 d4. cs8 |
d4 e d cs |
a2
}

tenor = \relative c' {
  \global
\partial 2
a4. g8 |
fs4 a g8[ a] b8[ cs] |
d2 fs,4. a8 |
a4 fs g a |
a2 a4. g8 |
fs4 fs8[ gs] a4 gs4 |
a2 a4. g8 |
a4 b a g fs2
}

bass = \relative c {
  \global
  d4. e8 |
  fs4 d e8[ fs] g4 |
  d2 b4. a8 |
  d4 fs e d |
  a2 d4. e8 |
  fs4 b, cs8[ d] e4 |
  a4( g) fs4. e8 |
  d4 g, a a |
  d2
}

verseOne = \lyricmode {
  \set stanza = "1."
  Con -- qu'ring kings their ti -- tles take
From the lands they cap -- tive make;
Je -- sus, thine was giv -- en thee
For a world thou mad -- est free.
}

verseTwo = \lyricmode {
  \set stanza = "2."
Not an -- other -- er name is giv'n
Pow'r pos -- sess -- ing un -- der heav'n,
Strong to call dead souls to rise
And ex -- alt them to the skies.
}

verseThree = \lyricmode {
  \set stanza = "3."
That which Christ so hard -- ly wrought,
That which he so dear -- ly bought,
That sal -- va -- tion, mor -- tals, say,
Will ye mad -- ly cast a -- way?
}

verseFour = \lyricmode {
  \set stanza = "4."
Rath -- er glad -- ly for that name
Bear the Cross, en -- dure the shame;
Joy -- ful -- ly for him to die
Is not death but vic -- to -- ry.
}

verseFive = \lyricmode {
  \set stanza = "5."
Je -- sus, if thou con -- de -- scend
To be called the sin -- ner's Friend,
Ours the joy and glo -- ry be
Thus to make our boast of thee.
}

verseSix = \lyricmode {
  \set stanza = "6."
  Glo -- ry to the Fa -- ther be,
  Glo -- ry, Vir -- gin -- born, to thee,
  Glo -- ry to the Ho -- ly Ghost,
  Ev -- er from the heav'n -- ly host.
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
      \new Lyrics \lyricsto soprano \verseSix
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
      \new Lyrics \lyricsto "tune" { \verseSix }
    >>
    \include "hymn_layout.ly"
  }
  \markup { 
    \vspace #0.5 
  }
  \bottom
}


Jesus, who dost condescend
To be called the sinner’s friend,
Hear us, as to thee we pray,
Glorying in the Name today.

Glory to the Father be,
Glory, Virgin-born, to thee,
Glory to the Holy Ghost
From the saints and angel host. Amen.