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
      \line {REQUIEM AETERNAM}
    }
    \right-column{
      \line {Gregorian, Mode VI}
      \line {harm. Achille Bragers}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null
    \right-column {
      \line {\italic "Requiem aeternam"}
      \line {\italic "The Roman Missal, 3rd ed.," alt. traditional}
    }
  }
}

\header {
  tagline = ""
}

global = {
  \key f \major
  \cadenzaOn
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
  \global
  f8[~ f g] f[~ f] f[ g^- a] a[ g~ g f g] g4( f) \once \override Staff.BarLine.bar-extent = #'( -1 . 1 ) \bar "|"
  f8[ g^- a] a[ g] a \bar "" \break
  
  a8[ c a] g[^- a^\prall bf a g f] f[ g] a[ g f g] g4( f) \bar "|"
  a8[ g] a[ g f] a g[ a] g f f4 \once \override Staff.BarLine.bar-extent = #'( -1 . 1 ) \bar "|" \break
  a8[ g] a[ c a g^- a^\prall bf a g] f[ g] a[ g f g] g4( f) \bar "||" \break
  
  f8[ g] g[ f] g[ a] a a a \bar ""
    a a g a4 \once \override Staff.BarLine.bar-extent = #'( -1 . 1 ) \bar "|"
    f8 g a a a a a a \bar "" \break
    a g bf g a4 \bar "|"
    b8\rest f8 g[ a] a a4 \once \override Staff.BarLine.bar-extent = #'( -1 . 1 ) \bar "|"
    a8 a f g8[ a] g[ f] f4 \bar "||"

\bar "||"
}

alto = \relative c' {
  \global
  c4. d4.~ d4.~ d2~ d2~ 
  d8~ d4~d4.
  f
  d2. f4 f2 g4 f
  d f2 d c4
  d4~ d4.~ d4~ d4. c4~ c2 bf4 a
  
  c2 d4. f4.~ 
  f4~ f4
  d f2 e4
  d2~ d4~ 
  d2~ d8 f4~
  f8 f2 d4 c^\markup {\right-align \italic "Repeat 'Rest eternal'" }
}

tenor = \relative c' {
  \global
  a4.~ a4.~ a4. bf2 a2~
  a8~ a4~ a4.
  c4. bf2. c4~ c2 d4 c4
  bf4 c2 bf a4
  f4~ f4.~ f4~ f4.~ f4~ f e d c
  
  a'2 bf4. c4. d4 c4
  bf c2. bf2 a4~
  a4 bf4~ bf8 d4~ 
  d8 c2 bf4 a
}

bass = \relative c {
  \global
 f4 e8 d4. c bf2 d~
 d8 e4 f4.~f4. g2. a4~ a2 bf4 a
 g4 f2~ f2~ f4
 d4 c4. bf4~ bf4. a4 f2~ f4 f
 
 f'2~ f4.~ f4.~ f4~ f4~
 f4~ f2. g2 f4~
 f2~ f8 d4~ 
 d8 f2.~ f4
}

verseOne = \lyricmode {
  Rest __ _ e -- ter -- nal grant un -- to them __ _ O __ _ Lord
  and let per -- pe -- tu -- al light shine __ _ up -- on __ them.
  \set stanza = "℣."
  A hymn, O God, be -- comes you in Si -- on,
  and a vow shall be paid to you in Je -- ru -- sa -- lem.
  O hear my prayer;
  all flesh shall come to you.
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
    >>
    \include "hymn_layout.ly"
  }
  \markup {
    \vspace #0.5
  }
  \bottom
}
