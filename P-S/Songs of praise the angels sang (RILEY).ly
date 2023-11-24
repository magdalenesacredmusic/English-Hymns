\version "2.22.2"

\include "english.ly"
\include "hymn_definitions.ly"

refs = \markup {
  \fontsize #-3 {
    \left-column {
      \wordwrap {
        Text: James Montgomery (1771-1854)
      }
      \wordwrap {
        Music: RILEY  77 77 D, Martin Shaw (1875-1958), 1915
      }
    }
  }
}

\header {
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
  b4 g e d |
  g g a2 |
  b4 g e d |
  g g g2 |
 
  e4 g d d |
  g fs8[ g] a2 |
  b4 g e d |
  g g g2 |
  
  b4 d c b |
  a gs a2 |
  a4 c b a |
  g e d2 |
  
  b'4 g e d |
  g g a2 
  b4 d c b |
  a8[ g] a4 g2  \bar "|."
}

alto = \relative c' {
  \global
  d4 d c a |
  d b d2 |
  d4 d c a |
  d e d2 |
  
  c4 c b d |
  d cs d2 |
  d4 d c a |
  d e d2 |
  
  g4 g g g |
  e e e2 |
  d4 c d e |
  d c a2 |
  
  d4 d c a |
  d b e( fs) |
  g4 fs e d |
  d4. c8 b2 
}

tenor = \relative c' {
  \global
  g4 g g fs |
  g g fs2 |
  
  g4 g g fs |
  g c b2 |
  g4 g g a |
  b a8[ g] fs2 |
  g4 g g fs |
  g c b2 |
  
  d4 b c d |
  e b c2 |
  a4 g fs e8[ fs] |
  g4 g g( fs) |
  
  g4 g g fs |
  g g c2 |
  d4 b g g |
  g fs g2
}

bass = \relative c {
  \global
 g4 b c d |
 b e d2 |
 g,4 b c d |
 b c g2
 
 c4 e g fs |
 e a, d2 |
 g,4 b c d |
 b c g2 
 
 g'4 g e g |
 c, e a,2 |
 fs'4 e d c |
 b c d2 |
 
 g,4 b c d |
 b e a,2 |
 g4 b c g |
 d' d g,2
}

verseOne = \lyricmode {
  \vOne
  Songs of praise the an -- gles sang,
  Heav'n with Al -- le -- lu -- ias rang,
  When cre -- a -- tion was be -- gun,
  When God spake and it was done.
  
  Songs of praise a -- woke the morn
  When the Prince of peace was born;
  Songs of praise a -- rose when he 
  Cap -- tive led cap -- ti -- vi -- ty.
}

verseTwo = \lyricmode {
  \vTwo
  Heav'n and earth must pass a -- way,
  Songs of praise shall crown that day;
  God will make new heav'ns and earth,
  
  Songs of praise shall hail their birth,
  And will man a -- lone be dumb
  Till that glo -- rious king -- dom come?
  No, the Church de -- lights to raise
  Psalms and hymns and songs of praise.
}

verseThree = \lyricmode {
  \vThree
  Saints be -- low, with heart and voice,
  Still in songs of praise re -- joice;
  Learn -- ing here, by faith and love,
  Songs of priase to sing a -- bove.
  
  Borne up -- on their lat -- est breath,
  Songs of praise shall con -- quer death;
  Then a -- midst e -- ter -- nal joy,
  Songs of praise their powers em -- ploy.
}

#(set-global-staff-size 20)
\book {
  \include "hymn_paper.ly"
  \header {
    tagline = ""
  }
  % \top
  \score {
    \new ChoirStaff <<
      \new Staff  <<
        \new Voice = "soprano" { \voiceOne \melody }
        \new Voice = "alto" { \voiceTwo \alto }
      >>
      \new Lyrics  \lyricsto soprano \verseOne
      \new Lyrics  \lyricsto soprano \verseTwo
      \new Lyrics  \lyricsto soprano \verseThree
      %\new Lyrics \lyricsto soprano \verseFour
      % \new Lyrics \lyricsto soprano \verseFive
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
    \include "hymn_layout.ly"
  }
  %{
\extraVerses
\markup {
  \vspace #0.5
}
  %}
  \refs
}

%%%%%%
%%%%%%
%%%%%%
#(set-global-staff-size 16)
#(define output-suffix "Hymnal")
\book {
  \include "lilypond-book-preamble.ly"
  \include "hymn_hymnal_paper.ly"
  \header {
    tagline = ""
  }
  %\top
  \score { %\transpose c d
    \new ChoirStaff <<
      \new Staff  <<
        \new Voice = "soprano" { \voiceOne \melody }
        \new Voice = "alto" { \voiceTwo \alto }
      >>
      \new Lyrics  \lyricsto soprano \verseOne
      \new Lyrics  \lyricsto soprano \verseTwo
      \new Lyrics  \lyricsto soprano \verseThree
      %\new Lyrics \lyricsto soprano \verseFour
      % \new Lyrics \lyricsto soprano \verseFive
      \new Staff  <<
        \clef bass
        \new Voice = "tenor" { \voiceOne \tenor }
        \new Voice = "bass" { \voiceTwo \bass }
      >>
    >>
    \include "hymn_hymnal_layout.ly"
  }    
  %{
\extraVerses
\markup {
  \vspace #0.5
}
  %}
  \refs
}
%%%%%%
%%%%%%
%%%%%%
#(define output-suffix "Melody")
\book {
  \include "lilypond-book-preamble.ly"
  \include "hymn_melody_paper.ly"
  %  \top
  \score {
    %\transpose c bf,
    <<
      \new Voice = "tune" {
        \melody
      }
      \new Lyrics \with {
        \override VerticalAxisGroup.
        nonstaff-relatedstaff-spacing.padding = #1.5 } \lyricsto "tune" { \verseOne }
      \new Lyrics \lyricsto "tune" { \verseTwo }
      \new Lyrics \lyricsto "tune" { \verseThree }
     % \new Lyrics \lyricsto "tune" { \verseFour }
      % \new Lyrics \lyricsto "tune" { \verseFive}
    >>
    \include "hymn_layout.ly"
  }
  \markup { 
    \vspace #0.5 
  }
  %{
\extraVerses
\markup {
  \vspace #0.5
}
  %}
  \refs
}
