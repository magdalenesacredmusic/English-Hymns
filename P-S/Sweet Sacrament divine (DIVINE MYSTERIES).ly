\version "2.22.2"

\include "english.ly"
\include "hymn_definitions.ly"

refs = \markup {
  \fontsize #-3 {
    \left-column {
      \wordwrap {
        Text: Francis Stanfield (1835-1914)
      }
      \wordwrap {
        Music: DIVINE MYSTERIES, 66 66 886, Francis Stanfield (1835-1914)
      }
    }
  }
}


\header {
  tagline = ""
}

global = {
  \key ef \major
  \time 3/2
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c'' {
  \global
  \partial 2
  g2
  bf2. af4 f g
  ef1 g2
  c,2. d4 ef f 
  g2( f) \bar "" \break
    g2
  bf2. af4 f g
  ef1 g2
  af2. af4 g f
  ef1 \bar "" \break
    ef2
  ef'2. ef4 d c
  bf4. af8 g2. g4
  c2. c4 bf g
  f ef f2 \bar "" \break
    g2
  bf2. af4 f g
  ef1 g2
  af2. af4 g f
  ef1 \bar "|."
}

alto = \relative c' {
  \global
  ef2
  ef2. ef4 d d 
  ef1 d2
  c2. bf4 bf ef
  ef2( d)
    ef2
  f2. ef4 ef d 
  ef1 ef2 
  f2. ef4 d d 
  ef1
    ef2
  ef2. g4 g af
  ef4. d8 ef2. ef4
  ef2. ef4 ef ef 
  c ef d2
    ef2
  f2. ef4 ef d 
  ef1 ef2
  f2. ef4 d d
  ef1
}

tenor = \relative c' {
  \global
 bf2
 g2. c4 af bf 
 g1 g2 
 af2. f4 ef c' 
 bf1
   bf2
 f2. af4 c bf
 g1 c2 
 c2. c4 bf af 
 g1
   g2 
 c2. ef4 ef ef
 bf4. bf8 bf2. bf4
 af2. af4 bf bf 
 a a bf2
   bf2
 f2. af4 c bf
 g1 c2
 c2. c4 bf af 
 g1
}

bass = \relative c {
  \global
 ef2
 ef2. af,4 bf bf 
 c1 bf2 
 af2. af4 g af 
 bf1
   ef2
 d2. c4 af bf 
 c1 c2
 f2. f4 bf, bf 
 ef1
   ef2
 c2. c'4 bf af
 g4. f8 ef2. ef4
 af2. af4 g ef
 f f bf,2
   ef2
 d2. c4 af bf
 c1 c2
 f2. f4 bf, bf 
 ef1
}

verseOne = \lyricmode {
  \vOne
  Sweet Sac -- ra -- ment di -- vine,
  Hid in thine earth -- ly home,
  Lo, round thy low -- ly shrine, 
  With sup -- pliant hearts we come;
  Je -- sus, to thee our voice we raise
  In songs of love and heart -- felt praise:
  Sweet Sac -- ra -- ment di -- vine,
   Sweet Sac -- ra -- ment di -- vine.
}

verseTwo = \lyricmode {
  \vTwo
  Sweet Sac -- ra -- ment of peace,
  Dear home for ev -- 'ry heart,
  Where rest -- less yearn -- ings cease
  And sor -- rows all de -- part;
  There in thine ear all trust -- ful -- ly
  We tell our tale of mis -- er -- y:
  Sweet Sac -- ra -- ment of peace,
  Sweet Sac -- ra -- ment of peace.
}

verseThree = \lyricmode {
  \vThree
  Sweet Sac -- ra -- ment of rest,
  Ark from the o -- cean's roar,
  With -- in thy shel -- ter blest
  Soon may we reach the shore;
  Save us, for still the tem -- pest raves,
  Save, lest we sink be -- neath the waves:
  Sweet Sac -- ra -- ment of rest,
  Sweet Sac -- ra -- ment of rest.
}

verseFour = \lyricmode {
  \vFour
  Sweet Sac -- ra -- ment di -- vine,
  Earth's light and ju -- bi -- lee,
  In thy far depths doth shine
  The God -- head's ma -- jes -- ty;
  Sweet light, so shine on us, we pray
  That earth -- ly joys may fade a -- way:
  Sweet Sac -- ra -- ment di -- vine,
  Sweet Sac -- ra -- ment di -- vine.
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
