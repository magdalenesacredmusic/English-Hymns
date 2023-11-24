%{
The music and poetry produced by this source code are believed to be in the public domain in the United States.
The source code itself is licensed under a Creative Commons Attribution-NonCommercial 4.0 International License:
http://creativecommons.org/licenses/by-nc/4.0/

Musicam Ecclesiae - sites.google.com/site/musicamecclesiae
%}

\version "2.18.2"
\include "english.ly"
\include "hymn_definitions.ly"

refs = \markup {
  \fontsize #-3 {
    \left-column {
      \wordwrap {
        Text: \italic "Beata nobis gaudia," Tr. Robert Ellis Roberts (1879-1953), 1906
      }
      \wordwrap {
        Music: BEATA NOBIS GAUDIA  LM, \italic "Psalterium Chorale," Constance, 1510; Harm. \italic "The English Hymnal," 1906
      }
    }
  }
}



%%generates the breathmarks
breathmark = {
  \override Score.RehearsalMark #'break-visibility = #begin-of-line-invisible
  \override Score.RehearsalMark #'Y-offset = #'4.0
  \override Score.RehearsalMark #'X-offset = #'-0.5
  \mark \markup {\fontsize #4 ","}
}



global = {
  \key ef \major
  \cadenzaOn
  %\autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
  \global
  bf'4   g ef \bar "" %\bar "!"
  f( g af g) f( ef) c d \bar "" %\bar "!"
  ef2 %\breathmark 
  \bar "|"

  ef4 g af \bar "" %\bar "!"
  bf4 c( bf af) bf c \bar "" %\bar "!"
  d( c bf) \bar "|"

  bf c( d ef) bf \bar "" %\bar "!"
  g ef af( g) f \bar "" %\bar "!"
  g( f ef) \bar "|" f c ef \bar "" %\bar "!"
  ef ef( d)
  f( g af g) f( ef) \bar "" %\bar "!"
  ef2. \bar "||" \break
  
  g4( f ef d ef) ef2 \bar "|."
}


alto = \relative c' {
  \global
  ef4^\markup { \italic Unison. } d ef
  <af, c>1 <g c>2 af4 bf
  g2

  ef'2. ~
  ef4 g( f2 ) d4 f
  d2. 

  f4 f2( ef4) f
  ef ef c2 d4
  bf2 g4

  c2.
  bf2. c1 d2
  ef2.
  
  c2 bf2. bf2
}

tenor = \relative c {
  \global
  s4 s4 s4
  s1 s2 f2
  ef2

  g4 bf af
  g4 c2. s4 s4
  s2.

  s4 s2 s4 s4
  bf4 c f,2 d4
  s2 s4

  af'2 g4 ~
  g4 f2 af1 <f bf>2
  <g bf>2. 
  
  g4 af g f g g2
}

bass = \relative c {
  \global
  <ef g>4 <bf bf'> <c g'>
  f1 c2 f,4 bf
  ef,2

  ef'2. ~
  ef4 ef( f2) <g bf>4 <f a>
  <bf, f'>2.

  <bf' d>4 \set doubleSlurs = ##t <af! c >2( <g bf>4) <d bf'>
  ef c af2 bf4
  <g d'>2 <c ef>4

  af2.
  bf2. f'1 bf,2
  ef2.
  
  c4 f, g bf ef, ef2
}

verseOne = \lyricmode {
  \vOne
  Re -- joice! the year up -- on its way
  has brought a -- gain that bles -- sed day,
  when on the cho -- sen of the Lord
  the Ho -- ly Spi -- rit was out -- poured.
}

verseTwo = \lyricmode {
  \vTwo
  On each the fire, des -- cend -- ing, stood,
  in quiv' -- ring tongues' si -- mi -- li -- tude,
  tongues, that their words might rea -- dy prove,
  and fire, to make them flame with love.
}

verseThree = \lyricmode {
  \vThree
  To all in ev' -- ry tongue they spoke;
  a -- maze -- ment in the crowd a -- woke,
  who mocked, as ov -- er -- come with wine,
  those who were filled with pow'r di -- vine.
}

verseFour = \lyricmode {
  \vFour
  These things were done in type that day,
  When East -- er -- tide had passed a -- way,
  The num -- ber told which once set free
  The cap -- tive at the ju -- bi -- lee.
  
  \vOff
  \set stanza = "6."
  A -- men.
}

extraVerses = 
  \markup {
  \fontsize #0.2 {
    \fill-line {
      \hspace #0.1 % moves the column off the left margin;
      % can be removed if space on the page is tight
      \column {
        \line {
          \bold "5."
          \column {
            "And now, O holy God, this day"
            "Regard us as we humbly pray,"
            "And send us, from thy heavenly seat,"
            "The blessings of the Paraclete."
          }
        }
      }
      \hspace #0.1  % adds horizontal spacing between columns;
      % if they are still too close, add more " " pairs
      % until the result looks good
      \column {
        \line {
          \bold "6."
          \column {
            "To God the Father, God the Son,"
            "And God the Spirit, praise be done;"
            "May Christ the Lord upon us pour"
            "The Spirit's gift for evermore."
          }
        }
      }
      \hspace #0.1 % gives some extra space on the right margin;
      % can be removed if page space is tight
    }
  }
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
    \include "hymn_layout_ragged.ly"
  }
  
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
    \include "hymn_hymnal_layout_ragged.ly"
  }    
  
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
    \include "hymn_layout_ragged.ly"
  }
  \markup { 
    \vspace #0.5 
  }
  
\extraVerses
\markup {
  \vspace #0.5
}
  %}
  \refs
}
