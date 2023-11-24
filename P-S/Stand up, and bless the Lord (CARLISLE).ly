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
        Music: CARLISLE, SM, Charles Lockhart (1745-1815)
      }
    }
  }
}


\header {
  tagline = ""
}

global = {
  \key e \major
  \time 4/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
  \global
  \partial 4
  e4
  b' e, gs8[ fs] e[ ds] |
  e2. e4
  a b8[ cs] b4 e,8[ a]
  gs4( fs2) \bar "" \break
  
    fs4
  gs4 fs8[ e] a4 gs8[ fs] |
  b4 a8[ gs] cs4 ds
  e e,8[ a] gs4 fs 
  e2.  \bar "|."
}

alto = \relative c' {
  \global
 b4 
 b cs cs b 
 b2. b4
 e e e cs8[ fs] 
 e4( ds2)
 
 ds4
 e ds8[ e] fs4 e8[ ds] 
 e4 e e fs
 e e8[ fs] e4 ds
 e2.
}

tenor = \relative c' {
  \global
  gs4
  fs gs a gs8[ fs]
  gs2. gs4
  a gs8[ a] b4 cs
  b2.
  
  b4
  b b cs b 
  b e8[ d] cs4 a
  b cs b b8[ a] 
  gs2.
}

bass = \relative c {
  \global
 e4
 ds cs a b
 e2. d4
 cs b8[ a] gs4 a
 b2.
 
 b4
 e a8[ gs] fs4 b8[ a]
 gs4 cs8[ b] a4 fs
 gs a8[ fs] b4 b, 
 e2.
}

verseOne = \lyricmode {
  \vOne
  Stand up, and bless the Lord,
  Ye peo -- ple of his choice;
  Stand up, and bless the Lord your God
  With heart and soul and voice.
}

verseTwo = \lyricmode {
  \vTwo
  Though high a -- bove all praise,
  A -- bove all bless -- ing high,
  Who would not fear his ho -- ly Name,
  And praise and mag -- ni -- fy?
}

verseThree = \lyricmode {
  \vThree
  O for the liv -- ing flame
  From his own al -- tar brought,
  To touch our lips, our minds in -- spire,
  And wing to heaven our thought!
}

verseFour = \lyricmode {
  \vFour
  God is our strength and song,
  And his sal -- va -- tion ours;
  Then be his love in Christ pro -- claimed
  With all our ran -- somed powers.
}

verseFive = \lyricmode {
  \vFive
  Stand up, and bless the Lord,
  The Lord your God a -- dore;
  Stand up, and bless his glo -- rious name
  Hence -- forth for ev -- er -- more.
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
      \new Lyrics \lyricsto soprano \verseFive
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
      \new Lyrics \lyricsto "tune" { \verseFive}
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
