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
      \line {ADORO TE DEVOTE   11 11 11 11}
    }
    \right-column{
      \line {Plainsong, harm. Winfred Douglas}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null 
    \right-column {
      \line {Swahili; Tr. Edmund S. Palmer, 1906}
    }
  } 
}

\header {
  tagline = ""
}

global = {
  \key d \major
  \cadenzaOn
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
  \global
  d8 fs a a a[ b] a4 \divisioMinima \bar ""
  g8 fs e d d4 \divisioMaior \bar ""
  d8 fs a a a[ b] a4 \divisioMinima \bar ""
  g8 fs e d d4 \bar "|"
  
  a'8 a b[ cs] d d[ cs] a b a g fs e4 \divisioMaior \bar ""
  fs8 a g fs e[ d] e4 \bar ""
  fs8 d e d d4 \bar "||" \break
  
  d8[ e d] cs4( d) \bar "|."
}

alto = \relative c' {
  \global
d2 e4 fs
b,2~b4 
d2~ d4 cs 
b cs8[ d] d4
d4~ d4.~ <d a>4.~ d4 b8[ d] cs4
d2 b2 d4 cs8[ d] d4

b4. a2
}

tenor = \relative c {
  \global
fs2 a g fs4 
fs2 e
g4 a fs
fs~ fs4.~ fs4~ fs8 s2 a4
a4 b8[ a] g2 a4 a4 fs

g4. e4 fs
}

bass = \relative c {
  \global
d2 cs4 d e g, b
b fs a2 e'4 a, d4
d8[ cs] b4. fs4 fs'8 g[ fs e d] a4
d2 g,2 fs4 a d

g,4. a4 d
}

verseOne = \lyricmode {
  \set stanza = "1. "
Je -- sus, Son of Ma -- ry,
Fount of life a -- lone,
Here we hail thee pres -- ent
On thine al -- tar -- throne.
Hum -- bly we a -- dore thee,
Lord of end -- less might,
In the mys -- tic sym -- bols
Veiled from earth -- ly sight.
}

verseTwo = \lyricmode {
  \set stanza = "2. "
Think, O Lord, in mer -- cy
On the souls of those
Who, in faith gone from us,
Now in death re -- pose.
Here 'mid stress and con -- flict
Toils can nev -- er cease;
There, the war -- fare end -- ed, 
Bid them rest in peace.
}

verseThree = \lyricmode {
  \set stanza = "3. "
Of -- ten were they wound -- ed
In the dead -- ly strife;
Heal them, Good Phy -- si -- cian,
With the balm of life.
Ev -- 'ry taint of e -- vil,
Frail -- ty and de -- cay,
Good and gra -- cious Sa -- vior,
Cleanse and purge a -- way.
}

verseFour = \lyricmode {
  \set stanza = "4. "
Rest e -- ter -- nal grant them,
Af -- ter wea -- ry fight;
Shed on them the ra -- diance
Of thy heav'n -- ly light.
Lead them on -- ward, up -- ward,
To the ho -- ly place,
Where thy saints made per -- fect
Gaze up -- on thy face.

A -- men.
}

verseFive = \lyricmode {
  \set stanza = "5. "

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
    >>
    \include "hymn_layout.ly"
  }
  \markup { 
    \vspace #0.5 
  }
  \bottom
}
