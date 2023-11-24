\version "2.22.2"

\include "english.ly"
\include "hymn_definitions.ly"

refs = \markup {
  \fontsize #-3 {
    \left-column {
      \wordwrap {
        Text: Charles Wesley (1707-88)
      }
      \wordwrap {
        Music: FROM STRENGTH TO STRENGTH  DSM, Edward Woodall Naylor (1867-1934)
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
  g4 d8. d16 g4 a |
  b g g c |
  b2 a |
  g \bar "" \break
  
  b4 a8 g |
  fs4 e fs g |
  a fs d g |
  fs2 e |
  d \bar "" \break
  
  d4 e8 fs |
  g2 g |
  g4 e fs g |
  a2 a |
  a \bar "" \break
  
  g4 a8 b |
  c4. c8 b4 a |
  d b g a |
  b2( a4.) g8 |
  g1 \bar "|."
}

alto = \relative c' {
  \global
  <b d>4^\markup { \italic Unison. } <g b>8. <g b>16 <b e>4 <d fs>4 |
  d <b d> <b e> <e g> |
  <d g>2 <c d fs> |
  <b d> <d g>4 <b d> |
  
  b4 cs d cs |
  d2 b4 d |
  d2 cs |
  d d4 d |
  
  <<{\voiceThree g4 fs4 d c}\\{d2 e}>> |
  <b d>2 <b d> |
  <cs e>4 <a d> <d g> <<{\voiceThree cs4 d c }\\{fs8 e fs2]}>> 
    <b, e>2
    <c e g> <d g>4 <d fs> |
    <d g>2 <b e>4 <e g> |
    <d g>2 <c d fs> |
    <b d>1
  
}

tenor = \relative c' {
  \global
s1
s1 s1 s1

a2 a4 a |
a2 fs4 b |
a2 <g a> |
<fs a> <fs a>4 a |
g2 c, |
s1
g'4 fs e g |
<fs a>2
}

bass = \relative c' {
  \global
   g4. fs8 e4 d |
   g,4. fs8 e4 c |
   d2 d |
   g4 fs e2 |
   a4. g8 fs4 e |
   fs g8[ a] b4 g |
   a2 a |
   d4 e d c |
   b2 c |
   g4 g' fs e |
   a,2 <a a'> |
   d2 e4 fs8[ g] |
   a4 a, d c |
   b4. b8 e4 c |
   d2 d, |
   g1
}

verseOne = \lyricmode {
  \vOne
  Sol -- diers of Christ, a -- rise 
  And put your ar -- mor on,
  Strong in the strength which God sup -- plies
  Through his e -- ter -- nal Son;
  
  Strong in the Lord of Hosts, 
  And in his might -- y power;
  Who in the strength of Je -- sus trusts
  Is more than con -- quer -- or.
}

verseTwo = \lyricmode {
  \vTwo
  Stand then, in his great might,
  With all his strength en -- dued;
  And take, to arm you for the fight,
  The pan -- o -- ply of God.
  
  To keep your ar -- mor bright
  At -- tend with con -- stant care,
  Still walk -- ing in your Cap -- tain's sight,
  And watch -- ing un -- to prayer.
}

verseThree = \lyricmode {
  \vThree
  From strength to strength go on,
  Wres -- tle and fight and pray;
  Tread all the powers of dark -- ness down,
  And win the well -- fought day;
  
  That, hav -- ing all things done,
  And all your con -- flicts past,
  Ye may o'er -- come through Christ a -- lone,
  And stand en -- tire at last.
}

verseFour = \lyricmode {
  \vFour

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
      \new Lyrics \lyricsto soprano \verseFour
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
      \new Lyrics \lyricsto soprano \verseFour
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
      \new Lyrics \lyricsto "tune" { \verseFour }
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
