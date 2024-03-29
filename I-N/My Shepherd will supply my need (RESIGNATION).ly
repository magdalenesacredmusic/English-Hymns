\version "2.22.2"
\include "english.ly"
\include "hymn_definitions.ly"

refs = \markup {
  \fontsize #-3 {
    \left-column {
      \wordwrap {
        Text: {\italic "Psalm 23 [22]," Isaac Watts (1674-1748), 1719, alt. ('Lord God')
      }
      \wordwrap {
        Music: RESIGNATION CMD, \italic "Southern Harmony," 1835
      }
    }
  }
}
}


\header {
  tagline = ""
}

global = {
  \key c \major
  \time 3/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
  \global
\partial 4 
c8[ e] |
g2 e8[ d] |
e2 g4 |
c2 a8[ g] |
e2 c8[ e] |
g2 c,4 |
e2 d4 | 
c2 \bar "|"

c8[ e] |
g2 e8[ d] |
e2 g4 |
c2 a8[ g] |
e2 c8[ e] |
g2 c,4 |
e2 d4 | 
c2 \bar "|"

g'4 |
c2 e8[ c] |
a2 c4 |
d2 c8[ a] |
g2 e8[ g] |
a2 g8[ a] |
c2 d4 |
c2 \bar "|"

c,8[ e] |
g2 e8[ d] |
e2 g4 |
c2 a8[ g] |
e2 c8[ e] |
g2 c,4 |
e2 d4 |
c2 \bar "|."
}

alto = \relative c' {
  \global
\partial 4 
c4 |
b2 b4 |
b( c) d |
e2 f8[ e] |
c2 c4 |
b2 c4 |
c2 g4 |
g2

c4 |
b2 b4 |
b( c) d |
e2 f8[ e] |
c2 c4 |
d2 c4 | 
c2 b4 |
c2

e4 |
e2 g4 |
f2 a8[ g] |
f2 g8[ f] |
d2 e8[ g] |
e2 e8[ f] |
g2 f4 |
e2

c4 |
d2 b4 |
c2 d4 |
c2 c4 |
b2 c4 |
d2 c4 | 
c2 b4 |
g2
}

tenor = \relative c {
  \global
  \partial 4
e4 |
d2 g4 |
g2 g4 |
g2 f8[ g] |
a2 a4 |
g2 e4 |
a2 g4 |
e2

e4 |
d2 g4 |
g2 g4 |
g2 f8[ g] |
a2 a4 |
g2 e4 |
g2 g4 |
e2

c'4 
c2 b8[ c] |
c2 a4 |
a2 g8[ c] |
b2 c4 |
c2 b8[ d] |
c2 a4 |
g2 

e4 |
d2 g4 |
g2 g4 |
e2 e4 |
g2 e4 |
d2 e4 |
g2 g4 |
e2
}

bass = \relative c {
  \global
\partial 4 
c4 |
g2 g'4 |
e2 b4 |
c2 d8[ e] |
a2 a4 |
e2 c4 |
a2 b4 |
c2 

c4 |
g2 g'4 |
e2 b4 |
c2 d8[ e] |
a2 a,4 |
b2 c4 |
g2 g4 |
c2 

c'4 |
a2 g8[ e] |
f2 f8[ e] |
d2 e8[ g] |
g2 c4 |
a2 e8[ d] |
e2 f4 |
c2 

c4 |
b2 g4 |
c2 b4 |
a2 c4 |
e2 a,4 |
b2 c4 |
g2 g4 |
c2
}

verseOne = \lyricmode {
  \vOne
My Shep -- herd will sup -- ply my need,
The Lord God is his Name;
In pas -- tures fresh he makes me feed,
be -- side the liv -- ing stream.

He brings my wand -- 'ring spir -- it back,
When I for -- sake his ways;
And leads me, for his mer -- cy's sake,
In paths of truth and grace.
}

verseTwo = \lyricmode {
  \vTwo
When I walk through the shades of death
Thy pre -- sence is my stay;
One word of thy sup -- port -- ing breath
Drives all my fears a -- way.
Thy hand, in sight of all my foes,
Doth still my ta -- ble spread;
My cup with bless -- ings o -- ver -- flows,
Thine oil a -- noints my head.
}

verseThree = \lyricmode {
  \vThree
The sure pro -- vi -- sions of my  God
At -- tend me all my days;
O may thy house be my a -- bode,
And all my work be praise.
There would I find a set -- tled rest,
While oth -- ers go and come;
No more a stran -- ger, nor a guest,
But like a child at home.
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
  % \bottom
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
     % \new Lyrics \lyricsto soprano \verseFour
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
        tempoWholesPerMinute = #(ly:make-moment 96 4)
      }
    }
    \include "hymn_hymnal_layout.ly"
  }    
  \refs
  %\bottom
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
      \new Lyrics \lyricsto "tune" { \verseOne }
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
  % \bottom
  \refs
}
