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
      \line {VERBUM SUPERNUM (MODE I)  LM}
    }
    \right-column{
      \line {Roman Use}
      \line {Harm. after Winfred Douglas}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null
    \right-column {
      \line {\italic "Magnis prophetae vocibus"}
      \line {Tr. William Dotson (1986—), © William Dotson}
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
  fs8 d fs a b cs b b^- \bar "'"
  a8 b cs d cs[ a] b cs b4 \once \override ChoirStaff.BarLine.bar-extent = #'( -1 . 1 )
  \bar "|"
  b8 b cs a fs[ a] g fs e^- \bar "'"
  fs8 d fs a b cs b b4 \bar "||" \break
  
  b8[ cs b] a4( b) \bar "||"
}

alto = \relative c' {
  \global
  s8 d2 e4 d8~
  d8 d4. a'4~ a g~
  g8 fs4.~ fs4 d cs8~
  cs8 d4 fs a fs
  
  e4. cs4 d
}

tenor = \relative c' {
  \global
  a4. fs4 a fs8~
  fs8 fs4. fs8 d'~ d2~
  d8 cs4.~ cs4 b a8~
  a8 b4 cs~ cs d4
  
  g,4. fs4~ fs4
}

bass = \relative c {
  \global
 d4.~ d8[ b8] a4 b8~
 b8 d4. fs4 g2~
 g8 fs4.~ fs4 g a8~
 a8 b4 a fs b
 
 e,4. fs4 b,
 
}

verseOne = \lyricmode {
  \set stanza = "1."
  With might -- y voice the proph -- ets tell
  That Christ will come with us to dwell;
  His way pre -- pared by heal -- ing grace
  By which he saved our fall -- en race.
}

verseTwo = \lyricmode {
  \set stanza = "2."
  And when that faith -- ful voice goes forth,
  An -- nouc -- ing grace has come to earth,
  The morn -- ing breaks with new -- born light,
  And all our hearts with joy are bright.
}

verseThree = \lyricmode {
  \set stanza = "3."
  When first he came by vir -- gin birth,
  He did not come to judge the earth,
  But heal the wound that sin had made,
  What -- e'er was lost and dead to save.
}

verseFour = \lyricmode {
  \set stanza = "4."
  He warned that he woudl come once more
  And now stands wait -- ing at the door,
  His heav'n -- ly reign to wel -- come in,
  His saints to crown in high with him.
}

verseFive = \lyricmode {
  \set stanza = "5."
  New Light is prom -- ised from on high,
  Sal -- va -- tion's star now fills the sky;
  Its splen -- dor calls us in the night
  To set our ways and lives a -- right.
}

verseSix = \lyricmode {
  \set stanza = "6."
  O Christ, the sun we long to see,
  Our God, who reigns e -- ter -- nal -- ly,
  May we see you and al -- ways raise
  Our nev -- er -- end -- ing hymn of praise.
  
  \set stanza = "6." A -- men.
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
        tempoWholesPerMinute = #(ly:make-moment 80 4)
      }
    }
    \include "hymn_layout_ragged.ly"
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
      \new Lyrics \lyricsto "tune" { \verseFour}
      \new Lyrics \lyricsto "tune" { \verseFive}
      \new Lyrics \lyricsto "tune" { \verseSix}
    >>
    \include "hymn_layout_ragged.ly"
  }
  \markup {
    \vspace #0.5
  }
  \bottom
}
