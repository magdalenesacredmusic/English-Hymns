\version "2.18.2"
\include "english.ly"
\include "hymn_definitions.ly"

top = \markup {
  \fill-line {
    \column {
      \line {DIES IRAE}
    }
    \right-column{
      \line {Mode I plainsong}
      \line {Harm. Achille P. Bragers (1887-1955)}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null
    \right-column {
      \line {\italic "Dies irae dies illa"}
      \line {Thomas of Celano, 13th cent.; Tr. William Josiah Irons (1812-83)}
      \line {alt. \italic "Order for Funerals," Anglican Ordinariate}
    }
  }
}

\header {
  tagline = ""
}

global = {
  \key af \major
  \cadenzaOn
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c'' {
  \global
  b8\rest af8 g af f g ef f f4 \hb
  af8 af8[ bf] af[ g] f[ ef] g af g f4 \hb
  c8 ef8[ f] f f[ ef] g af g f4 \bar "|"
  
  %verse 2
  b8\rest af8 g af f g ef f f4 \hb
  af8 af8[ bf] af[ g] f[ ef] g af g f4 \hb
  c8 ef8[ f] f f[ ef] g af g f4 \bar "|"
  
  %verse 3
  r8 c' ef ef d8[ bf c] c[ bf af] bf c c4( f,) \hb
  af8 g af f g ef f f4 \hb
  af8 bf8[ c] c8[ bf af] g[ f ef] g af g f4 \bar "|"
  
  %verse 4
  r8 c' ef ef d8[ bf c] c[ bf af] bf c c4( f,) \hb
  af8 g af f g ef f f4 \hb
  af8 bf8[ c] c8[ bf af] g[ f ef] g af g f4 \bar "|"

  %verse 5
  r8 c'8 bf[ af] bf c[-- f,] f8[ ef] c ef[ f] f4 \hb
  af8[ g] f ef c ef f af g[( ef] f4) \hb
  c'8 af bf f ef f af g8[( ef] f4) \bar "|"
  
  %verse 6
  r8 c'8 bf[ af] bf c[-- f,] f8[ ef] c ef[ f] f4 \hb
  af8[ g] f ef c ef f af g[( ef] f4) \hb
  c'8 af bf f ef f af g8[( ef] f4) \bar "|"
  
  %verse 7
  b8\rest af8 g af f g ef f f4 \hb
  af8 af8[ bf] af[ g] f[ ef] g af g f4 \hb
  c8 ef8[ f] f f[ ef] g af g f4 \bar "|"
  
  %verse 8
  b8\rest af8 g af f g ef f f4 \hb
  af8 af8[ bf] af[ g] f[ ef] g af g f4 \hb
  c8 ef8[ f] f f[ ef] g af g f4 \bar "|"
  
  %verse 9
  r8 c' ef ef d8[ bf c] c[ bf af] bf c c4( f,) \hb
  af8 g af f g ef f f4 \hb
  af8 bf8[ c] c8[ bf af] g[ f ef] g af g f4 \bar "|"
  
  %verse 10
  r8 c' ef ef d8[ bf c] c[ bf af] bf c c4( f,) \hb
  af8 g af f g ef f f4 \hb
  af8 bf8[ c] c8[ bf af] g[ f ef] g af g f4 \bar "|"

  %verse 11
  r8 c'8 bf[ af] bf c[-- f,] f8[ ef] c ef[ f] f4 \hb
  af8[ g] f ef c ef f af g[( ef] f4) \hb
  c'8 af bf f ef f af g8[( ef] f4) \bar "|"
  
  %verse 12
  r8 c'8 bf[ af] bf c[-- f,] f8[ ef] c ef[ f] f4 \hb
  af8[ g] f ef c ef f af g[( ef] f4) \hb
  c'8 af bf f ef f af g8[( ef] f4) \bar "|"
  
  %verse 13
  b8\rest af8 g af f g ef f f4 \hb
  af8 af8[ bf] af[ g] f[ ef] g af g f4 \hb
  c8 ef8[ f] f f[ ef] g af g f4 \bar "|"
  
  %verse 14
  b8\rest af8 g af f g ef f f4 \hb
  af8 af8[ bf] af[ g] f[ ef] g af g f4 \hb
  c8 ef8[ f] f f[ ef] g af g f4 \bar "|"
  
  %verse 15
  r8 c' ef ef d8[ bf c] c[ bf af] bf c c4( f,) \hb
  af8 g af f g ef f f4 \hb
  af8 bf8[ c] c8[ bf af] g[ f ef] g af g f4 \bar "|"
  
  %verse 16
  r8 c' ef ef d8[ bf c] c[ bf af] bf c c4( f,) \hb
  af8 g af f g ef f f4 \hb
  af8 bf8[ c] c8[ bf af] g[ f ef] g af g f4 \bar "|"

  %verse 17
  r8 c'8 bf[ af] bf c[-- f,] f8[ ef] c ef[ f] f4 \hb
  af8[ g] f ef c ef f af g[( ef] f4) \hb
  c'8 af bf f ef f af g8[( ef] f4) \bar "|"
  
  %verse 18
  f8 c' c[ d] c bf af[ g] bf c4 \hb
  af8 g bf c4 f,8[ af g f ef] af g f4 \bar "|"
  
  %verse 19
  r8 c'8 ef f ef8[ d c] c[ bf af] bf c c4( f,) \hb
  af8 g bf c4 f,8[ af g f ef] af g f4 \bar "|"
  
  %verse 20
  c'8 bf af g bf bf c4 \hb
  af8 g bf g8[ f g] af g f4 \bar "|"
  
  ef8[ g] af[ g f] ef4 f \bar "||"
}

alto = \relative c' {
  \global
  c2 df c4~ 
  c8 f2 f8[ ef] g df4 c
  c8~ c4. bf c2
  
  %verse 2
  c2 df c4~ 
  c8 f2 f8[ ef] g df4 c
  c8~ c4. bf c2
  
  %verse 3
  f4 g af4. g4. ef4 c2~
  c8 df4 c bf c~
  c8 f4 ef4.~ ef2~ ef4 c
  
  %verse 4
  f4 g af4. g4. ef4 c2~
  c8 df4 c bf c~
  c8 f4 ef4.~ ef2~ ef4 c
  
  %verse 5
  c4~ c4.~ c4~ c4 c8 bf4 c~
  c2 c4~ c2~ c4~
  c8 f4 f8[ ef]~ ef4 c~ c~
  
  %verse 6
   c4~ c4.~ c4~ c4 c8 bf4 c~
  c2 c4~ c2~ c4~
  c8 f4 f8[ ef]~ ef4 c~ c~
  
  %verse 7
  c2 df2 c4~
  c8 f2 f8 ef4 df c
  c8~ c4. f8 ef4~ ef c
  
  %verse 8
  c2 df2 c4~
  c8 f2 f8 ef4 df c
  c8~ c4. f8 ef4~ ef c
  
  %verse 9
  f4 g af4. g ef4 c2~
  c8 df4 c bf c~
  c8 f4 ef4.~ ef4 ef4~ ef c
  
  %verse 10
  f4 g af4. g ef4 c2~
  c8 df4 c bf c~
  c8 f4 ef4.~ ef4 ef4~ ef c~
  
  %verse 11
  c4~ c4.~ c4~ c4 c8 bf4 c4~
  c4 bf c~ c2~ c4~
  c8 f4 f8[ ef]~ ef4 c4~ c
  
  %verse 12
  c4~ c4.~ c4~ c4 c8 bf4 c4~
  c4 bf c~ c2~ c4~
  c8 f4 f8[ ef]~ ef4 c4~ c
  
  %verse 13
  f2 df2 c4~
  c8 f2 f8 ef4 df c
  c8~ c4. bf c2
  
  %verse 14
  f2 df2 c4~
  c8 f2 f8 ef4 df c
  c8~ c4. bf c2
  
  %verse 15
  f4 ef f4. ef~ ef4 c2~
  c8 df4 c bf c4~
  c8 f4 ef4.~ ef4 ef~ ef c
  
  %verse 16
  f4 ef f4. ef~ ef4 c2~
  c8 df4 c bf c4~
  c8 f4 ef4.~ ef4 ef~ ef c~
  
  %verse 17
  c4~ c4.~ c4~ c4 c8 bf4 c~
  c4 bf c~ c df c4~
  c8~ c4 df4 ef2 c4
  
  %verse 18
  f2.~ f4.~ f4~
  f4.~ f4 f4. r4 ef4 c
  
  %verse 19
  f4 g af4. ef4.~ ef4 c2
  f4. ef4~ ef4. r4 c4~ c4~
  
  %verse 20
  c2 f4 ef
  df4.~ df4. c4~ c4
  
  ef4 c4. bf4 c
}

tenor = \relative c' {
  \global
  af2 bf af4~
  af8 c2~ c4. bf4 c4~
  c8 af4. bf~ bf4 af~
  
  %verse 2
  af2 bf af4~
  af8 c2~ c4. bf4 c4~
  c8 af4. bf~ bf4 af~
  
  %verse 3
  af4 bf c4.~ c4. bf4 af2~
  af8 bf4 af g af4~
  af8~ af4~ af4. bf4 c bf af~
  
  %verse 4
  af4 bf c4.~ c4. bf4 af2~
  af8 bf4 af g af4~
  af8~ af4~ af4. bf4 c bf af~
  
  %verse 5
  af4 g4. af4~ af4. bf4 af~
  af4 bf af~ af bf af~
  af8~ af4~ af4 c bf af~
  
  %verse 6
  af4 g4. af4~ af4. bf4 af~
  af4 bf af~ af bf af~
  af8~ af4~ af4 c bf af~
  
  %verse 7
  af2 bf af4~
  af8 c2 bf4.~ bf4 c4~ c8
  af4. bf4.~ bf4 af~
  
  %verse 8
  af2 bf af4~
  af8 c2 bf4.~ bf4 c4~ c8
  af4. bf4.~ bf4 af~
  
  %verse 9
  af4 bf c4.~ c4. bf4 af2~ 
  af8 bf4 af g af4~
  af8~ af4~ af4. bf4 c bf af~
  
  %verse 10
  af4 bf c4.~ c4. bf4 af2~ 
  af8 bf4 af g af4~
  af8~ af4~ af4. bf4 c bf af~
  
  %verse 11
  af4 bf4. af4~ af4. bf4 af~
  af bf af~ af bf af4~
  af8~ af4~ af4 c bf af
  
  %verse 12
  af4 bf4. af4~ af4. bf4 af~
  af bf af~ af bf af4~
  af8~ af4~ af4 c bf af
  
  %verse 13
  c2 bf af4~
  af8 c2~ c4. bf4 c~
  c8 af4. bf4.~ bf4 af
  
  %verse 14
  c2 bf af4~
  af8 c2~ c4. bf4 c~
  c8 af4. bf4.~ bf4 af~
  
  %verse15
  af4 bf af4. bf4.~ bf4 af2~
  af8 bf4 af g af4~
  af8~ af4 af4. bf4 c bf af~
  
  %verse 16
  af4 bf af4. bf4.~ bf4 af2~
  af8 bf4 af g af4~
  af8~ af4 af4. bf4 c bf af~
  
  %verse 17
  af4 g4. af4~ af4. bf4 af4~
  af4 bf af~ af bf af4~
  af8~ af2~ af4 bf af~
  
  %verse 18
  af4 bf c df4. c4
  df4. c4~
  c4. bf4~ bf af
  
  %verse 19
  af4 bf c4. bf~ bf4~ bf af~
  af4.~ af4~ af4. g4~ g af4~
  
  %verse 20
  af2~ af4~ af 
  f4. bf~ bf4 af4
  
  bf4 af4. g4 af
}

bass = \relative c {
  \global
 f2~ f2~ f4~
 f8~ f4 g af4. bf4 af4~
 af8~ af4. g4. f2
 
 %verse 2
 f2~ f2~ f4~
 f8~ f4 g af4. bf4 af4~
 af8~ af4. g4. f2
 
 %verse 3
 af4 g f4. ef g4 af2~
 af8 r2 r4 f4~
 f8 df4 c4.~ c2 ef4 f
 
 %verse 4
 af4 g f4. ef g4 af2~
 af8 r2 r4 f4~
 f8 df4 c4.~ c2 ef4 f~
 
 %verse 5
 f4~ f4.~ f4 af4. g4 f~
 f g af f2~ f4~
 f8 df4 c4~ c2 f4~
 
 %verse 6
 f4~ f4.~ f4 af4. g4 f~
 f g af f2~ f4~
 f8 df4 c4~ c2 f4~
 
 %verse 7
 f2~ f2~ f4~
 f8~ f2 g4. bf4 af4~ 
 af8~ af4. g4. ef4 f4
 
 %verse 8
 f2~ f2~ f4~
 f8~ f2 g4. bf4 af4~ 
 af8~ af4. g4. ef4 f4
 
 %verse 9
 af4 g f4. ef g4 af2~
 af8 r2 r4 f4~
 f8 df4 c4.~ c2 ef4 f
 
 %verse 10
 af4 g f4. ef g4 af2~
 af8 r2 r4 f4~
 f8 df4 c4.~ c2 ef4 f~
 
 %verse 11
 f4 g4. af4~ af4. g4 f~
 f4 g af4 f2~ f4~
 f8 df4 c~ c2 f4~
 
 %verse 12
 f4 g4. af4~ af4. g4 f~
 f4 g af4 f2~ f4~
 f8 df4 c~ c2 f4~
 
 %verse 13
 f2~ f2~ f4~
 f8~ f4 g af4. bf4 af4~
 af8~ af4. g f2
 
 %verse 14
 f2~ f2~ f4~
 f8~ f4 g af4. bf4 af4~
 af8~ af4. g f2
 
 %verse 15
 af4 g f4. g~ g4 af2~
 af8 r2 r4 f4~
 f8 df4 c4.~ c2 ef4 f
 
 %verse 16
 af4 g f4. g~ g4 af2~
 af8 r2 r4 f4~
 f8 df4 c4.~ c2 ef4 f~
 
 %verse 17
 f4~ f4.~ f4 af4. g4 f~
 f g af f2~ f4~
 f8 ef4 df4 c2 f4~
 
 %verse 18
 f2.~ f4.~ f4
 bf4. af4~ af4. g4 ef f
 
 %verse 19
 af4 g f4. g~ g4 f2
 df4. af4 c4.~ c4 ef f4~
 
 %verse 20
 f4 ef df af 
 bf4.~ bf4. ef4 f
 
 g f4.~ f2
}

verseOne = \lyricmode {
\set stanza = "1."
Day of wrath and doom im -- pend -- ing,
Da -- vid’s word with Sib -- yl’s blend -- ing,	
Heaven and earth in ash -- es end -- ing!		

\set stanza = "2."
O what ear man’s bos -- om rend -- eth,	
When from heaven the Judge des -- cend -- eth,	
On whose sen -- tence all de -- pend -- eth!		

\set stanza = "3."
Won -- drous sound the trum -- pet fling -- eth,
Through earth's sep -- ul -- chres it ring -- eth,
All be -- fore the throne it bring -- eth.

\set stanza = "4."
Death is struck, and na -- ture quak -- ing,
All cre -- a -- tion is a -- wak -- ing,
To its Judge an an -- swer mak -- ing.

\set stanza = "5."
Lo! the book ex -- act -- ly word -- ed,
Where -- in all hath been re -- cord -- ed;
Thence shall judg -- ment be a -- ward -- ed.

\set stanza = "6."
When the Judge his seat at -- tain -- eth,
And each hid -- den deed ar -- raign -- eth,
Noth -- ing un -- a -- venged re -- main -- eth.

\set stanza = "7."
What shall I, frail man, be plead -- ing?
Who for me be in -- ter -- ced -- ing,
When the just are mer -- cy need -- ing?

\set stanza = "8."
King of maj -- es -- ty tre -- men -- dous,
Who dost free sal -- va -- tion send us,
Fount of pit -- y, then be -- friend us!

\set stanza = "9."
Think, kind Je -- sus! my sal -- va -- tion
Caused thy won -- drous In -- car -- na -- tion;
Leave me not to rep -- ro -- ba -- tion.

\set stanza = "10."
Faint and wear -- y thou has sought me,
On the Cross of suff -- 'ring bought me;
Shall such grace be vain -- ly brought me?

\set stanza = "11."
Right -- eous Judge! for sin's pol -- lu -- tion
Grant thy gift of ab -- so -- lu -- tion,
Ere that day of re -- tri -- bu -- tion.

\set stanza = "12."
Guil -- ty, now I pour my moan -- ing,
All my shame with an -- guish own -- ing;
Spare, O God, thy sup -- pliant groan -- ing!

\set stanza = "13."
Through the sin -- ful wom -- an shriv -- en,
Through the dy -- ing thief for -- give -- en,
Thou to me a hope hast giv -- en.

\set stanza = "14."
Worth -- less are my prayers and sigh -- ing,
Yet, good Lord, in grace com -- ply -- ing,
Res -- cue me from fires un -- dy -- ing.

\set stanza = "15."
With thy sheep a place pro -- vide me,
From the goats a -- far di -- vide me,
To thy right hand do thou guide me.

\set stanza = "16."
When the wick -- ed are con -- found -- ed,
Doomed to shame and woe un -- bound -- ed,
Call me, with thy Saints sur -- round -- ed.

\set stanza = "17."
Low I kneel, with heart's sub -- mis -- sion.
See, like ash -- es my con -- tri -- tion!
Help me in my last con -- di -- tion!

\set stanza = "18."
Ah! that day of tears and mourn -- ing!
From the dust of earth re -- turn -- ing,

\set stanza = "19."
Man for judg -- ment must pre -- pare him:
Spare, O God, in mer -- cy spare him!

\set stanza = "20."
Lord, all -- pit -- ying, Je -- sus blest,
Grant them thine e -- ter -- nal rest.

A -- men.
}


\book {
  \include "hymn_paper_multipage.ly"
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
    \include "hymn_layout.ly"
  }
  \bottom
}

%%%%%%
%%%%%%
%%%%%%
#(define output-suffix "Hymnal")
\book {
  \include "hymn_hymnal_paper.ly"
  \header {
    tagline = ""
  }
  \top
  \score { %\transpose c d
    \new ChoirStaff <<
      \new Staff  <<
        \new Voice = "soprano" { \voiceOne \melody }
        \new Voice = "alto" { \voiceTwo \alto }
      >>
      \new Lyrics  \lyricsto soprano \verseOne
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
        \melody
      }
      \new Lyrics \lyricsto "tune" { \verseOne }
    >>
    \include "hymn_layout.ly"
  }
  \markup {
    \vspace #0.5
  }
  \bottom
}
