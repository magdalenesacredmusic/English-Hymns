\version "2.22.2"

\include "english.ly"
\include "hymn_definitions.ly"

refs = \markup {
  \fontsize #-3 {
    \left-column {
      \wordwrap {
        Text: Φωστήρες τής άϋλον ούσίς, St. Joseph the Hymnographer, d. 883; Tr. John Mason Neale (1818-66)
      }
      \wordwrap {
        Music: QUEDLINBURG  10 10 10 10, From a Chorale by Johann Christian Kittel (1732-1809)
      }
    }
  }
}


\header {
  tagline = ""
}

global = {
  \key f \major
  \time 3/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
  \global
  f4 a bf |
  c c f, |
  d' c bf |
  a2. |
  
  g4 c bf |
  a g f |
  e f d |
  c2. |
  
  g'4 g a |
  a g c |
  c bf a |
  g2. |
  
  c4 c c |
  d c bf |
  a bf g |
  f2.

\bar "|."
}

alto = \relative c' {
  \global
  c4 c f |
  f e f |
  f f4. e8 |
  f2. |
  
  e4 f g |
  f e c |
  c c b |
  c2. |
  
  e4 e f |
  f e e |
  f g fs |
  d2( e4) |
  
  f4 e ef |
  d f f |
  f f e |
  f2.
}

tenor = \relative c' {
  \global
  a4 a8[ g] f4 |
  g4 g c |
  bf c c |
  c2. |
  
  bf4 a g |
  c bf c |
  c a g |
  e2. |
  
  c'4 c c |
  c c g |
  c d d |
  bf2( c4) |
  
  c4 bf a |
  bf c d |
  c d c |
  a2.
}

bass = \relative c {
  \global
   f4 f8[ e] d4 |
   c4 bf a |
   bf c8[ bf] c4 |
   f2. |
   
   c4 d e |
   f g a |
   g f g |
   c,2. |
   
   c4 c f |
   f c bf |
   a bf8[ c] d4 |
   g2( c,4) |
  
  a'4 g f |
  bf, a bf |
  c bf c |
  f2.
}

verseOne = \lyricmode {
  \vOne
  Stars of the morn -- ing, so glo -- rious -- ly bright,
  Filled with ce -- les -- tial res -- plen -- dence and light,
  These that, where night nev -- er fol -- low -- eth day,
  Raise the Tri -- sa -- gi -- on ev -- er and ay.
}

verseTwo = \lyricmode {
  \vTwo
  These are thy coun -- sel -- lors, these dost thou own,
  Lord God of Sab -- a -- oth, near --est thy throne;
  These are thy min -- is -- ters, these dost thou send,
  Help of the help -- less ones! man to de -- fend.
}

verseThree = \lyricmode {
  \vThree
  These keep the guard a -- mid Sa -- lem's dear bowers;
  Thrones, Prin -- ci -- pal -- i -- ties, Vir -- tues, and Powers;
  Where, with the Liv -- ing Ones, mys -- ti -- cal Four;
  Che -- ru -- bim, Ser -- a -- phim bow and a -- dore.
}

verseFour = \lyricmode {
  \vFour
  'Who like the Lord?' thun -- ders Mi -- chael the Chief;
  Ra -- phael, 'the cure of God,' com -- for -- teth grief;
  And, as a Naz -- a -- reth, pro -- phet of peace,
  Ga -- briel, 'the Light of God,' bring -- eth re -- lease.
}

verseFive = \lyricmode {
  \set stanza = "5."
  Then, when the earth was first poised in mid space,
  Then, when the plan -- ets first sped on their race,
  Then, when were end -- ed the six days' em -- ploy,
  Then all the Sons of God shout -- ed for joy.
}

verseSix = \lyricmode {
  \set stanza = "6."
  Still let them suc -- cor us; still let them fight,
  Lord of an -- gel -- ic hosts, batt -- ling for right;
  Till, where their an -- thems they cease -- less -- ly pour,
  We with the An -- gels may bow and a -- dore.
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
          \bold "5. "
          \column {
            "Then, when the earth was first poised in mid space,"
  "Then, when the planets first sped on their race,"
  "Then, when were ended the six days' employ,"
  "Then all the Sons of God shouted for joy."
          }
        }
        \vspace #1
        \line {
          \bold "6. "
          \column {
           "Still let them succor us; still let them fight,"
  "Lord of angelic hosts, battling for right;"
  "Till, where their anthems they ceaselessly pour,"
  "We with the Angels may bow and adore."

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
      % \new Lyrics \lyricsto soprano \verseFive
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
      % \new Lyrics \lyricsto "tune" { \verseFive}
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
