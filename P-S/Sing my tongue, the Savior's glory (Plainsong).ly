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
      \line {Mode 3 Plainsong 87 87 87}
    }
    \right-column{
      \line {\italic "Graduale Romanum"}
      %\line {harm. }
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null 
    \right-column {
      \line {\italic "Pange lingua, gloriosi/ Corporis mysterium"}
      \line {Thomas Aquinas; tr. Edward Caswall, \italic "Lyra Catholica"}
    }
  } 
}

\header {
  tagline = ""
}

global = {
  \key c \major
  \cadenzaOn
  %\autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
  \global
   e4 e f e( d) g g a( c) c2 \bar "'"
   c4( d) c c b a c b( a g2) \bar "|"
   g4 a c b a g a g2 \bar "'"
   a4 b g g e a a2( d,) \bar "|"
   e4 g g e g a a g2 \bar "'"
   a4 b g a( g) f( e) d e2 \bar "||" \break
   
   e4( f d) d2( e) \bar "|."
}

melodya = \relative c' {
  \global
   \override Stem #'length = #0
   e4 e f e( d) g g a( c) c2 \bar "'"
   c4( d) c c \bar "" \break  b a c b( a g2) \bar "|"
   g4 a c b a g a g2 \bar "'"
   a4 b g g e a a2( d,) \bar "|"
   e4 g g e \bar "" \break g a a g2 \bar "'"
   a4 b g a( g) f( e) d e2 \bar "||" \break
   
   e4( f d) d2( e) \bar "|."
}

alto = \relative c' {
  \global


}

tenor = \relative c {
  \global


}

bass = \relative c {
  \global


}

verseOne = \lyricmode {
  \set stanza = "1."
  Sing, my tongue, the Sa -- viour's glo -- ry,
  Of His Flesh the mys -- t'ry sing;
  Of the Blood, all price ex -- ceed -- ing,
  Shed by our im -- mor -- tal King,
  Des -- tined, for the world's re -- demp -- tion,
  From a no -- ble womb to spring.
}

verseTwo = \lyricmode {
  \set stanza = "2."
  Of a pure and spot -- less Vir -- gin
  Born for us on earth be -- low,
  He, as Man with man con -- ver -- sing,
  Stay'd, the seeds of truth to sow;
  Then He closed in so -- lemn or -- der
  Won -- drous -- ly His life of woe.
}

verseThree = \lyricmode {
  \set stanza = "3."
  On the night of that Last Sup -- per,
  Seat -- ed with His cho -- sen band,
  He the Pas -- chal vic -- tim eat -- ing,
  First ful -- fulls the Law's com -- mand;	
  Then, as Food to all His breth -- ren
  Gives Him -- self with His own hand.
}

verseFour = \lyricmode {
  \set stanza = "4."
  Word made Flesh, the bread of na -- ture
  By His word to Flesh He turns;
  Wine in -- to His Blood He chang -- es:
  What though sense no change dis -- cerns?
  On -- ly be the heart in earn -- est,
  Faith her les -- son quick -- ly learns.
}


verseFive = \lyricmode {
  \set stanza = "5."
  Down in a -- dor -- a -- tion fal -- ling,
  Lo! the sa -- cred Host we hail;
  Lo! o'er an -- cient forms de -- part -- ing,
  New -- er rites of grace pre -- vail;
  Faith, for all de -- fects sup -- ply -- ing,
  Where the fee -- ble sens -- es fail.
}

verseSix = \lyricmode {
  \set stanza = "6."
  To the Ev -- er -- last -- ing Fa -- ther,
  And the Son who reigns on high,
  With the Ho -- ly Ghost pro -- ceed -- ing
  Forth from Each e -- ter -- nal -- ly,
  Be sal -- va -- tion, ho -- nor, bles -- sing,
  Might, and end -- less ma -- jes -- ty.
  
  A -- men.
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
        tempoWholesPerMinute = #(ly:make-moment 84 4)
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
        \melodya
      }
      \new Lyrics \lyricsto "tune" { \verseOne }
      \new Lyrics \lyricsto "tune" { \verseTwo }
      \new Lyrics \lyricsto "tune" { \verseThree }
      \new Lyrics \lyricsto "tune" { \verseFour }
      \new Lyrics \lyricsto "tune" { \verseFive}
      \new Lyrics \lyricsto "tune" { \verseSix}
    >>
    \include "hymn_layout.ly"
  }
  \markup { 
    \vspace #0.5 
  }
  \bottom
}


