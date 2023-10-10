\version "2.22.2"
\include "english.ly"
\include "hymn_definitions.ly"

refs = \markup {
  \fontsize #-3 {
    \left-column {
      \wordwrap {
        Text: Lorica of St. Patrick, Tr. Cecil Francis Alexander
      }
      \wordwrap {
        Music: ST. PATRICK DLM, ancient Irish Melody, Arr. Charles Villiers Stanford
      }
    }
  }
}

top = \markup {
  \fill-line {
    \column {
      \line {ST. PATRICK    DLM}
    }
    \right-column{
      \line {ancient Irish Melody}
      \line {arr. Charles Villiers Stanford}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null 
    \right-column {
      \line {Lorica of St. Patrick}
      \line {Tr. Cecil Francis Alexander}
    }
  } 
}

\header {
  tagline = ""
}

global = {
  \key bf \major
  \time 3/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
  \global
  \partial 4
  d4 |
  g2 g4 |
  f( d) f |
  bf( d) c8[ bf] |
 \set melismaBusyProperties = #'() \slurDashed bf4( a) a |
  \unset melismaBusyProperties \slurSolid c( a) f | \break
  
  f( a) c |
  bf2 <g bf>4 |
  \set melismaBusyProperties = #'() \tieDashed a4~ a4 
   \unset melismaBusyProperties \tieSolid d4 |
  \phrasingSlurDashed g,4.(\( a8) bf[ g]\) |
  f4( d) bf |
  bf'2 f4 |
   \set melismaBusyProperties = #'() \slurDashed g( a) 
   \unset melismaBusyProperties \slurSolid bf8[ c] | 
 
  d2 c8[ d] |
  bf4( g) a |
  g2 g4 |
  \set melismaBusyProperties = #'() \tieDashed  g~ g4\fermata \bar "||" \break
  \unset melismaBusyProperties \tieSolid
  
  f4 |
  bf2 bf4 |
  bf2 c8[ d] |
  c2 b4 |
  c2 d4 |
  g,2 g4 | \break
  
  f( a) c |
  bf2 bf4 |
  a2 d,4 |
  g4.( a8) bf[ g] |
  f4( d) bf |
  bf'2 f4 |
  g( a) bf8[ c] |
  d2 c8[ d] |
  bf4( g) a |
  g2 g4 |
  g2 \bar "|."
}

alto = \relative c' {
  \global
  \partial 4
  d4^\markup {\italic "To be sung in unison."} |
  <bf d>2.~ |
  <a d> |
  <d f>2 <ef g>4 |
  <c f>2 <c f>4
  <c f>2. |
  <c f>2 <c ef>4 |
  f2 ef8[ d] |
  <c f>2 <d f>4 |
  <ef g>2 <bf ef>4 |
  <bf d>2 bf4 |
  <bf d>2 bf4 |
  bf <d f> d8[ f] |
  <d f>2 f4 |
  f ef f |
  d2 ef4 |
  d2
  d4 |
  g2 <ef g>4 |
  f2 ef8[ d] |
  <<{\voiceTwo  \ignore ef4( g)}\\{ef2}>> <d g>4 |
  <ef g>2 <d g>4 |
  ef2. |
  <c f>2 <c f>4 |
  f2 <ef g>4 |
  <c f>2 d4 |
  bf2. |
  <bf d>2 bf4 |
  <bf d>2 f'4 |
  ef f d8[ f] |
  f2 f4 |
  d4 ef f |
  d2 ef4 |
  d2
}

tenor = \relative c {
  \global
  \partial 4
  d4 |
  <d g>2.~ |
  <d f> |
  f2 ef4 |
  f2. |
  <f a> |
  a2 g4 |
  f2 bf4 |
  f2
  s4
  <<{ bf2 g4}\\ {\voiceThree ef2.}>> |
  f2 f4 |
  <d g>2 f4 |
  ef f g8[ a] |
  <f bf>2 <f a>4 |
  <f bf> <g bf> <a d> |
  <<
    {\voiceOne  \ignore bf2 c4 bf2}\\{
      \voiceThree \shiftOff \tieDown g2.
      -\shape #'((2 . 1) (0 . 0.9) (0 . 0.9) (-1 . 1))
      ~ g2
    }
  >>
  bf4 |
  d bf bf |
  bf2 a8[ bf] |
  g2 g4 |
  g2 <g bf>4 |
  <g bf>2. |
  <f a> |
  <f bf>2 bf4 |
  f2 d4 |
  <ef g>2. |
  f2 d4 |
  <d g>2 bf'4 |
  bf d bf8[ a] |
  <f bf>2 <f a>4 |
  <g bf> <g bf> <d a' d> |
  <<{\voiceOne  \ignore bf'2\( c4 bf2\)}\\{\voiceThree \shiftOff g2. g2}>>
}

bass = \relative c {
  \global
  \partial 4
  d4 |
  g, bf g |
  d2 d'4 |
  bf2 ef4 |
  f2. |
  f, |
  f'2 c4 |
  d2 ef4 |
  f2
  <bf, f' bf>4 |
  \shiftOff ef ef, g |
  bf2 <bf d>4 |
  g2 d'4 |
  ef d g8[ f] |
  bf,2 f4 |
  d ef d |
  g2 c4 |
  g2
  bf4 |
  bf d ef |
  d2 c8[ bf] |
  c4 ef g |
  c,2 g4 |
  ef2. |
  f |
  d2 ef4 |
  f2 d4 |
  ef2. |
  bf'2 bf8[ a] |
  g2 d'4 |
  ef d g8[ f] |
  bf,2 f'8[ d] |
  g,4 ef d |
  <g d'>2 c4 |
  <g d'>2
}
verseOne = \lyricmode {
  \vOne
  I bind un -- to my -- self to -- day _
  The strong name of the Trin -- i -- ty, _
  By in -- vo -- ca -- tion of the same, _
  The Three in One, and One in Three. _
}

verseTwo = \lyricmode {
  \vTwo
  I bind this day to me for -- ev -- er
  By pow'r of faith, Christ’s in -- car -- na -- tion;
  His bap -- _ tism in Jor -- dan riv -- er,
  His death on Cross for my sal -- va -- tion;
  
  His burst -- ing from the spic -- èd tomb,
  His rid -- ing up the heav'n -- ly way,
  His com -- ing at the day of doom
  I bind un -- to my -- self to -- day.
}

 verseThree = \lyricmode {
  \vThree
  I bind un -- to my -- self the pow'r _
  Of the great love of Cher -- u -- bim; _
  The sweet 'Well done' in judg -- ment hour, _
  The ser -- vice of the Ser -- a -- phim, _
  
  Con -- fes -- sors’ faith, A -- pos -- tles’ word,
  The Pa -- triarchs’ prayers, the pro -- phets’ scrolls,
  All good deeds done un -- to the Lord
  And pu -- ri -- ty of vir -- gin souls.
}

verseFour = \lyricmode {
  \vFour
  I bind un -- to my -- self to -- day _
  The vir -- tues of the star lit heav -- en,
  The glo -- rious sun’s life giv -- ing ray, _
  The white -- ness of the moon at e -- ven,
   
 The flash -- ing of the light -- ning free,
  The whir -- ling wind’s tem -- pes -- tuous shocks,
  The sta -- ble earth, the deep salt sea
  A -- round the old e -- ter -- nal rocks.
}

verseFive = \lyricmode {
  \vFive
  I bind un -- to my -- self to -- day _
  The pow'r of God to hold and lead, _
  His eye to watch, His might to stay, _
  His ear to heark -- en to my need. _
   
  The wis -- dom of my God to teach,
  His hand to guide, His shield to ward;
  The word of God to give me speech,
  His heav'n -- ly host to be my guard.
}

%{verseSix = \lyricmode {
  \set stanza = "6."
  A -- gainst the de -- mon snares of sin, _
  The vice that gives temp -- ta -- tion force,
  The na -- tural lusts that war with -- in, _
  The hos -- tile men that mar my course;
  Or few or man -- y, far or nigh,
  In ev' -- ry place and in all hours,
  A -- gainst their fierce hos -- ti -- li -- ty
  I bind to me these ho -- ly pow'rs.
}

verseSeven = \lyricmode {
  \set stanza = "7."
  A -- gainst all Sa -- tan’s spells and wiles, _
  A -- gainst false words of he --re -- sy,
  A -- gainst the know -- ledge that de -- files, _
  A -- gainst the heart’s i -- do -- la -- try,
  A -- gainst the wiz -- ard’s e -- vil craft,
  A -- gainst the death -- wound and  the burn -- ing,
  The chok -- ing wave, the poi -- soned shaft,
  Pro -- tect me, Christ, till Thy re -- turning.
}
%}

verseSix = \lyricmode {
  \vEight
  I bind un -- to my -- self the Name, _
  The strong Name of the Tri -- ni -- ty, _
  By in -- vo -- ca -- tion of the same, _
  The Three in One and One in Three. _
  %  \set stanza = "6."
  By Whom all na -- ture hath cre -- ation,
  E -- ter -- nal Fa -- ther, Spi -- rit, Word:
  Praise to the Lord of my sal -- vation,
  Sal -- va -- tion is of Christ the Lord.
}

endNote =
 \markup {
    \fontsize #0.2 {
      \fill-line {
        \center-column {
                \line  {\italic "The hymn," Christ be with me \italic "is traditionally inserted afer verse 5"}
\line {\italic "to the tune of DEIDRE or GARTAN."}
}
  } } }


#(set-global-staff-size 20)
\book {
  \include "hymn_paper_multipage.ly"
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
      \new Lyrics \lyricsto soprano \verseSix
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
  \refs
    \markup {
    \vspace #0.5
  }
    \endNote

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
      \new Lyrics \lyricsto soprano \verseSix
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
    \markup {
    \vspace #0.5
  }
    \endNote

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
      \new Lyrics \lyricsto "tune" { \verseFour }
      \new Lyrics \lyricsto "tune" { \verseFive}
      \new Lyrics \lyricsto "tune" { \verseSix }
    >>
    \include "hymn_layout.ly"
  }
  \markup { 
    \vspace #0.5 
  }
    \refs
      \markup {
    \vspace #0.5
  }
  \endNote
}
