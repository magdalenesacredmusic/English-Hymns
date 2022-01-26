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
      \line {DIVINUM MYSTERIUM  87 87 87 7}
    }
    \right-column{
      \line {13th Cent. Plainsong}
      \line {harm. C. Winfred Douglas, 1940}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null 
    \right-column {
      \line {\italic "Corde natus ex parentis"}
      \line {Prudentius; tr. J.M. Neale, 1854, and H.W. Baker, 1859}
    } 
  }
}


global = {
  \key ef \major
  \cadenzaOn
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}


melody = \relative c' {
  \global
  ef8 f g af g f g[ f] ef4 \divisioMinima \bar ""
  g8 af bf c bf[ g] af bf4 \divisioMaior \bar "" \break
  c8 d ef bf bf af g[ f] ef4 \divisioMinima \bar ""
  c8 d ef f ef[ c] d ef4 \divisioMaior \bar "" \break
  ef8 f g af g f bf[( c] bf[ g af]) bf4 \divisioMinima \bar ""
  ef,8 d c d \bar "" \break
  ef c bf4 \divisioMaior \bar ""

  ef8 f g bf g ef f4( ef) \bar "||"

  ef8[ f ef] d4( ef) \bar "||"
}

melodya = \relative c' {
  \global
  ef8 f g af g f g[ f] ef4 \bar "'"
  g8 af bf c \bar "" \break bf[ g] af bf4 \once \override Staff.BarLine.bar-extent = #'( -1 . 1 )
  \bar "|" \noBreak
  c8 d ef bf bf af g[ f] ef4 \bar "'"
  c8 d ef f ef[ c] d ef4 \once \override Staff.BarLine.bar-extent = #'( -1 . 1 )
  \bar "|"
  ef8 f g af \bar "" \break g f bf[( c] bf[ g af]) bf4 \bar "'"
  ef,8 d c d \bar "" %\break
  ef c bf4 \once \override Staff.BarLine.bar-extent = #'( -1 . 1 )
  \bar "|"

  ef8 f g bf g ef f4( ef) \bar "||" \break

  ef8[ f ef] d4( ef) \bar "||"
}

alto = \relative c' {
  \global
  s2^\markup {\italic "To be sung in unison."} c4 d ef
  ef2~ ef4 f8~ f4
  ef2~ ef4 d4 c
  s2 s4. s4
  s2 c4 ef4~ ef4. d4
  bf4 af g8[ af] f4

  bf2 c4~ c8[ d] ef4

  bf4.~ bf2
}

tenor = \relative c' {
  \global
  g8[ af] bf4 s4 bf4 g4
  s2 bf4 c8 d4
  c4 bf4~ bf8[ c] bf4 g4
  af4 bf g4 bf8 g4
  g8[ af] bf4 s4 ef,4~ ef4. f4
  g4 ef2 d4
  ef2~ ef8[ g] f4 g4

  g4. f4 g
}

bass = \relative c {
  \global
 ef2 af,4 bf ef4
  ef8[ f g af] g4 f8 bf4
  af4 g4 g,8[ af] bf4 c
  af4 g4 c4 bf8 ef4
  ef2 af,4 g4. c4 bf4
  g4 af8[ bf c af] bf4
  g2 c4 af8[ bf] ef4

  ef4. bf4 ef,
}


verseOne = \lyricmode {
  \set stanza = "1."
  Of the Fa -- ther’s love be -- got -- ten,
  Ere the worlds be -- gan to be,
  He is Al -- pha and O -- me -- ga,
  He the source, the end -- ing he,
  Of the things that are, that have been,
  And that fu --  ture years shall see,
  
}

verseTwo = \lyricmode {
  \set stanza = "2."
 O that birth for -- ev -- er bles -- sèd,
  When the vir -- gin, full of grace,
  By the Ho -- ly Ghost con -- ceiv -- ing,
  Bare the Sav -- ior of our race;
  And the Babe, the world’s Re -- deem -- er,
  First re -- vealed his sac -- red face,
}

verseThree = \lyricmode {
  \set stanza = "3."
  This is he whom seers in old time
              Chant -- ed of with one ac -- cord;
            Whom the voic -- es of the proph -- ets
              Prom -- ised in their faith -- ful word;
            Now he shines, the long ex -- pect -- ed,
              Let cre -- a -- tion praise its Lord,
              \override Lyrics . LyricText #'font-shape = #'italic Ev -- er -- more and ev -- er -- more!
  \set stanza = "5." A -- men.
}

verseFour = \lyricmode {
  \set stanza = "4."
 O ye heights of heav'n a -- dore him;
             An -- gel hosts, his prais -- es sing;
            Powers, do -- min -- ions, bow be -- fore him,
             and ex -- tol our God and King!
            Let no tongue on earth be si -- lent,
              Ev -- 'ry voice in con -- cert sing,
}

verseFive = \lyricmode {
  \set stanza = "5."
  Christ, to thee with God the Fa -- ther,
              And, O Ho -- ly Ghost, to thee,
            Hymn and chant with high thanks -- giv -- ing,
              And un -- wear -- ied prais -- es be:
            Hon -- or, glo -- ry, and do -- min -- ion,
              And e -- ter -- nal vic -- to -- ry,
              
              _ _ _ _ _ _ _
              
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
      \new Lyrics \lyricsto "tune" { \verseFive }
    >>
    \include "hymn_layout_ragged.ly"
  }
  \markup { 
    \vspace #0.5 
  }
  \bottom
}