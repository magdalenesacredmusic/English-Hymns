\version "2.22.2"

\include "english.ly"
\include "hymn_definitions.ly"

refs = \markup {
  \fontsize #-3 {
    \left-column {
      \wordwrap {
        Text: \italic "Cultor Dei, memento," Prudentius (348-413), Tr. Thomas Alexander Lacey (1853-1931)
      }
      \wordwrap {
        Music: NUN LASST UNS GEH'N  77 77, \italic "Kirchen-und-Haus-Buch" Dresden 1694
      }
    }
  }
}


\header {
  tagline = ""
}

global = {
  \key ef \major
  \time 3/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c'' {
  \global
  bf4 af g |
  f2 ef4 |
  f2. |
  ef2 g4 |
  af( bf) c |
  bf( af) g |
  g2( f4) |
  g2. |
  
  bf4 c d |
  ef2 d4 |
  c2. |
  bf2 c4 |
  af2 bf4 |
  g2 f4 |
  f2. |
  ef2. \bar "||"
  
  ef2. |
  ef2.

\bar "|."
}

alto = \relative c' {
  \global
  ef4 c8[ d] ef4 |
  c2 ef4 |
  ef2( d4) |
  ef2 ef4 |
  f2 g4 |
  f2 ef4 |
  c2. |
  d2. |
  
  ef4 ef f |
  ef2 g4 |
  af2. |
  ef2 g4 |
  f2 f4 |
  ef2 c4 |
  d2. |
  ef2. |
  
  c2. |
  bf2.
}

tenor = \relative c' {
  \global
  g4 af bf |
  af2 g4 |
  bf2. |
  g2 c4 |
  c2 c4 |
  f,2 bf4 |
  c2. |
  b2. |
  
  bf4 af af |
  bf2 bf4 |
  ef2( d4) |
  ef2 c4 |
  c2 bf4 |
  bf2 c4 |
  bf2( af4) |
  g2. |
  
  af2. |
  g2.
}

bass = \relative c {
  \global
  g'4 f ef |
  af,2 c4 |
  bf2. |
  ef2 c4 |
  f2 ef4 |
  d2 ef4 |
  af,2. |
  g2. |
  
  g'4 af f |
  g2 ef4 |
  f2. |
  g2 ef4 |
  f2 d4 |
  ef2 af,4 |
  bf2. |
  ef2. |
  
  af2. |
  ef2.
}

verseOne = \lyricmode {
  \vOne
Ser -- vant of God, re -- mem -- ber
The stream thy soul be -- dew -- ing,
The grace that came up -- on thee
A -- noint -- ing and re -- new -- ing.
}

verseTwo = \lyricmode {
  \vTwo
When kind -- ly slum -- ber calls thee,
Up -- on thy bed re -- clin -- ing,
Trace thou the Cross of Je -- sus,
Thy heart and fore -- head sign -- ing.
}

verseThree = \lyricmode {
  \vThree
The Cross dis -- solves the dark -- ness,
And drives a -- way temp -- ta -- tion;
It calms the waver -- ing spir -- it
By qui -- et con -- sec -- ra -- tion.
}

verseFour = \lyricmode {
  \vFour
Be -- gone, be -- gone, the ter -- rors
Of vague and form -- less dream -- ing;
Be -- gone, thou fell de -- ceiv -- er,
With all thy boast -- ed schem -- ing. 
}

verseFive = \lyricmode {
  \vFive
  Be -- gone, thou crook -- ed ser -- pent,
Who, twist -- ing and pur -- su -- ing,
By fraud and lie pre -- par -- est
The sim -- ple soul’s un -- do -- ing; \set stanza = "8." A -- men.
}

extraVerses = 
      \markup {
    \vspace #1
  \fontsize #0.2 {
    \fill-line {
      \hspace #0.1 % moves the column off the left margin;
      % can be removed if space on the page is tight
      \column {
        \line {
          \bold "6. "
          \column {
            "Tremble, for Christ is near us,"
"  Depart, for here he dwelleth,"
"And this, the Sign thou knowest,"
"  Thy strong battalions quelleth."
          }
        }
    \vspace #1
        \line {
          \bold "7. "
          \column {
            "Then while the weary body"
"  Its rest in sleep is nearing,"
"The heart will muse in silence"
"  On Christ and his appearing."
          }
        }
        \vspace #1
        \line {
          \bold "8. "
          \column {
           "To God, eternal Father,"
"  To Christ, our King, be glory,"
"And to the Holy Spirit,"
"  In never-ending story. Amen."

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
  
\extraVerses
\markup {
  \vspace #0.5
}
  %}
  \refs
}
