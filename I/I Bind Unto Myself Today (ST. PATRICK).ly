%{
The music and poetry produced by this source code are believed to be in the public domain in the United States.
The source code itself is licensed under a Creative Commons Attribution-NonCommercial 4.0 International License:
http://creativecommons.org/licenses/by-nc/4.0/

Musicam Ecclesiae - sites.google.com/site/musicamecclesiae
%}

\version  "2.18.0-1"
\include "english.ly"
\include "hymnstyle.ly"

\paper {
  #(set-paper-size "ustrade")
  page-count = 4
}

\header {
  poet = \markup{ \fontsize #4 \smallCaps "I Bind Unto Myself Today (St. Patrick's Breastplate)"  }
  meter = \markup { \small { Music: ST. PATRICK, D.L.M., Ancient Irish Hymn Melody; arr. C.V. Stanford } }
  %piece = \markup { \small {Text: St. Patrick; tr. C.F. Alexander }}
  %breakbefore
  %copyright = ""
  tagline = "sites.google.com/site/musicamecclesiae"
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
  bf4( a) a |
  c( a) f | \break
  f( a) c |
  bf2 bf4 |
  a2 \bar "||"
  d4 |
  g,4.( a8) bf[ g] |
  f4( d) bf | \noPageBreak
  bf'2 f4 |
  g( a) bf8[ c] |
  d2 c8[ d] |
  bf4( g) a |
  g2 g4 |
  g2 \bar "||"
}

soprano = \relative c' {
  \global
  \partial 4
  d4 |
  g2 g4 |
  f( d f) |
  bf d c8[ bf] |
  bf4( a) <c, a'> |
  c'( a) f |
  f( a) c |
  bf2 <g bf>4 |
  a2
  <d, f d'>4 |
  g4.( a8) bf[ g] |
  f4( d) bf |
  bf'2 f4 |
  g( a) bf8[ c] |
  d2 c8[ d] |
  bf4( g) a |
  g2 g4 |
  g2
}

alto = \relative c' {
  \global
  \partial 4
  d4 |
  <bf d>2.-\shape #'((1 . 0.5) (0 . 0.5) (0 . 0.5) (-0.5 . 0.5))~ |
  <a d> |
  <d f>2 <ef g>4 |
  <<{\voiceThree f2.} \\ { \voiceTwo c2 s4} >>
  <c f>2. |
  <c f>2 <c ef>4 |
  f2 ef8[ d] |
  <c f>2
  s4 |
  <ef g>2 <bf ef>4 |
  <bf d>2 bf4 |
  <bf d>2 <bf f'>4 |
  bf <d f> d8[ f] |
  <d f>2 f4 |
  f ef f |
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
    {\voiceOne \ignore bf2 c4 bf2}\\{
      \voiceThree \shiftOff \tieDown g2.
      -\shape #'((2 . 1) (0 . 0.9) (0 . 0.9) (-1 . 1))
      ~ g2
    }
  >>
}

bass = \relative c {
  \global
  \partial 4
  d4 |
  g, bf g |
  d2 d'4 |
  <bf f>2 ef4 |
  f2. |
  f, |
  f'2 c4 |
  d2 ef4 |
  f2
  <bf, f' bf>4 |
  \shiftOff ef( ef,) g |
  bf2 <bf d>4 |
  g2 d'4 |
  ef d g8[ f] |
  bf,2 f4 |
  d( ef) d |
  g2 c4 |
  g2
}



verseOne = \lyricmode {
  \set stanza = "1."
  I bind un -- to my -- self to -- day
  The strong name of the Trin -- i -- ty,
  By in -- vo -- ca -- tion of the same,
  The Three in One, and One in Three.
}
%%%%%%%%%%%%%
%%%%%%%%%%%%%

melodya = \relative c' {
  \global
  \partial 4
  \repeat volta 6 {
    d4 |
    g2 g4 |
    f( d) f |
    bf( d) c8[ bf] |
    \set melismaBusyProperties = #'() bf4( a) \unset melismaBusyProperties a |
    c( a) f |
    f( a) c |
    bf2 bf4 |
    <<{\voiceTwo \once \override NoteColumn #'force-hshift = #0.5 a2}\new Voice = "alternative" {\voiceOne a4 a}>>  \oneVoice \bar "||"
    d4 |
    g,4.(\( a8) bf[ g]\) |
    f4( d) bf |
    bf'2 f4 |
    \set melismaBusyProperties = #'() g( a) \unset melismaBusyProperties bf8[ c] |
    d2 c8[ d] |
    bf4( g) a |
    g2 g4 |
    <<{\voiceTwo \once \override NoteColumn #'force-hshift = #0.5 g2}\new Voice = "alternative" {\voiceOne g4 g}>> \oneVoice \bar "||"
    f4 |
    bf2 bf4 |
    bf2 c8[ d] |
    c2 b4 |
    c2 d4 |
    g,2 g4 |
    f( a) c |
    bf2 bf4 |
    <<{\voiceTwo \once \override NoteColumn #'force-hshift = #0.5 a2}\new Voice = "alternative" {\voiceOne a4 a}>>  \oneVoice d,4 |
    g4.( a8) bf[ g] |
    f4( d) bf |
    bf'2 f4 |
    g( a) bf8[ c] |
    d2 c8[ d] |
    bf4( g) a |
    g2 g4 |
    <<{\voiceTwo \once \override NoteColumn #'force-hshift = #0.5 g2}\new Voice = "alternative" {\voiceOne g4 g}>>  \oneVoice
  }
  \key g \major
}

sopranoa = \relative c' {
  \global
  \partial 4
  d4 |
  g2 g4 |
  f( d f) |
  bf d c8[ bf] |
 \ignore  bf4( a) a |
  c( a) f |
  f( a) c | \pageBreak
  bf2 <g bf>4 |
  a2
  <d, f d'>4 |
  g4.(\( a8) bf[ g]\) |
  f4( d) bf |
  bf'2 f4 |
  g( a) bf8[ c] |
  d2 c8[ d] |
  bf4( g) a |
  g2.~ |
  g2\fermata
  f4 |
  bf2 bf4 |
  bf2 c8[ d] |
  c2 b4 |
  c2 d4 |
  g,2 g4 |
  f( a) c |
  bf2 bf4 |
  a2 d,4 |
  g4.( a8) bf[ g] |
  f4( d) bf |
  bf'2 f4 |
  g( a) bf8[ c] |
  d2 c8[ d] |
  bf4( g) a |
  g2.~ |
  g2
  \key g \major
}

altoa = \relative c' {
  \global
  \partial 4
  d4 |
  <bf d>2.-\shape #'((1 . 0.5) (0 . 0.5) (0 . 0.5) (-0.5 . 0.5))
  ~ |
  <a d> |
  <d f>2 <ef g>4 |
  <<{f2.} \\ { c2 c4} >>
  <c f>2. |
  <c f>2 <c ef>4 |
  f2 ef8[ d] |
  <c f>2
  s4 |
  <ef g>2 <bf ef>4 |
  <bf d>2 bf4 |
  <bf d>2 <bf f'>4 |
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

tenora = \relative c {
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
  \key g \major
}

bassa = \relative c {
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
  \shiftOff ef( ef,) g |
  bf2 <bf d>4 |
  g2 d'4 |
  ef d g8[ f] |
  bf,2 f4 |
  d( ef) d |
  g2 c4 |
  g2
  bf4 |
  bf d ef |
  d2 c8[ bf] |
  c4( ef) g |
  c,2 g4 |
  ef2. |
  f |
  d2 ef4 |
  f2 <d d'>4 |
  ef2. |
  bf'2 bf8[ a] |
  g2 d'4 |
  ef( d) g8[ f] |
  bf,2 f'8[ d] |
  g,4( ef) d |
  <g d'>2 c4 |
  <g d'>2
}

verseTwo = \lyricmode {
  \set stanza = "2."
  I bind this day to me for -- ev -- er
  By pow'r of faith, Christ’s in -- \set associatedVoice = alternative car -- na -- \set associatedVoice = melody tion;
  His bap -- _ tism in Jor -- dan riv -- er,
  His death on Cross for my \set associatedVoice = alternative sal -- va -- \set associatedVoice = melody tion;
  His burst -- ing from the spic -- èd tomb,
  His rid -- ing up the heav'n -- ly way,
  His com -- ing at the day of doom
  I bind un -- to my -- self to -- day.
}

verseThree = \lyricmode {
  \set stanza = "3."
  I bind un -- to my -- self the pow'r _
  Of the great love of Cher -- u -- bim;
  The sweet 'Well done' in judg -- ment hour, _
  The ser -- vice of the Ser -- a -- phim,
  Con -- fes -- sors’ faith, A -- pos -- tles’ word,
  The Pa -- triarchs’ prayers, the pro -- phets’ scrolls,
  All good deeds done un -- to the Lord
  And pu -- ri -- ty of vir -- gin souls.
}

verseFour = \lyricmode {
  \set stanza = "4."
  I bind un -- to my -- self to -- day _
  The vir -- tues of the star lit heav'n,
  The glo -- rious sun’s life giv -- ing ray, _
  The white -- ness of the moon at even,
  The flash -- ing of the light -- ning free,
  The whir -- ling wind’s tem -- pes -- tuous shocks,
  The sta -- ble earth, the deep salt sea
  A -- round the old e -- ter -- nal rocks.
}

verseFive = \lyricmode {
  \set stanza = "5."
  I bind un -- to my -- self to -- day _
  The pow'r of God to hold and lead,
  His eye to watch, His might to stay, _
  His ear to heark -- en to my need.
  The wis -- dom of my God to teach,
  His hand to guide, His shield to ward;
  The word of God to give me speech,
  His heav'n -- ly host to be my guard.
}

verseSix = \lyricmode {
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
  A -- gainst the death -- wound and  \set associatedVoice = alternative  the burn -- \set associatedVoice = melody ing,
  The chok -- ing wave, the poi -- soned shaft,
  Pro -- tect me, Christ, till Thy re -- turning.
}

%%%%%%%%%%
%%%%%%%%%%
melodyb = \relative c'' {
    \set Staff.midiInstrument = "church organ"

  \time 3/4
  \set Staff.keySignature = #`(((0 . 6) . ,NATURAL)
                               ((1 . 2) . ,NATURAL)
                               ((1 . 3) . ,SHARP))
  \partial 4
  g8. e16 | \once \override Score.KeySignature #'stencil = ##t \set Staff.printKeyCancellation = ##f \key g \major
  g4 d e8. a16 |
  g4 g g8. g16 |
  c4 b a8. g16 |
  b4 a \bar "||"
  b8. a16 |
  c4 b b8. a16 |
  a4 g g8. e16 |
  g4 g g8. b16 |
  a4 g\fermata \bar "||"
  g8. e16 |
  g4 d e8. a16 |
  g4 g g8. g16 |
  c4 b a8. g16 |
  b4 a \bar "||"
  b8. a16 |
  c4 b b8. a16 |
  a4 g g8. e16 |
  g4 g g8. b16 |
  a4 g\fermata \bar "||"
}

altob = \relative c' {
  \set Staff.midiInstrument = "church organ"

  \partial 4
  d8. e16 |
  d4 a c8. c16 |
  e4 e g8. fs16 |
  e4 d c8. e16 |
  d8[ e] fs4
  g8. fs16 |
  g4 g fs8. fs16 |
  e4 e d8. e16 |
  d4 e e8. d16 |
  e8[ d] b4
  d8. e16 |
  d4 a c8. c16 |
  e4 e g8. fs16 |
  e4 d c8. e16 |
  d8[ e] fs4
  g8. fs16 |
  g4 g fs8. fs16 |
  e4 e d8. e16 |
  d4 e e8. d16 |
  e8[ d] b4
}

tenorb = \relative c' {
    \set Staff.midiInstrument = "church organ"

  \set Staff.keySignature = #`(((-2 . 6) . ,NATURAL)
                               ((-1 . 2) . ,NATURAL)
                               ((-1 . 3) . ,SHARP))
  \partial 4
  b8. c16 |
  \once \override Score.KeySignature #'stencil = ##f \set Staff.printKeyCancellation = ##f \key g \major
  g4 fs g8. a16 |
  b4 b g8. g16 |
  g4 g c8. b16 |
  g4 d'
  d8. d16 |
  e4 e d8. d16 |
  c4 c g8. g16 |
  g4 g g8. g16 |
  g8[ fs] g4
  b8. c16 |
  g4 fs g8. a16 |
  b4 b g8. g16 |
  g4 g c8. b16 |
  g4 d'
  d8. d16 |
  e4 e d8. d16 |
  c4 c g8. g16 |
  g4 g g8. g16 |
  g8[ fs] g4
}

bassb = \relative c {
    \set Staff.midiInstrument = "church organ"

  \partial 4
  g8. c16 |
  b8[ c] d4 c8. a16 |
  e'4 e e8. d16 |
  c4 g a8. e'16 |
  b8[ c] d4
  g8. d16 |
  c4 e b8. d16 |
  a4 c b8. c16 |
  b4 e8[ d] c8. g16 |
  c8[ b] g4\fermata
  g8. c16 |
  b8[ c] d4 c8. a16 |
  e'4 e e8. d16 |
  c4 g a8. e'16 |
  b8[ c] d4
  g8. d16 |
  c4 e b8. d16 |
  a4 c b8. c16 |
  b4 e8[ d] c8. g16 |
  c8[ b] g4\fermata
}

verseEight = \lyricmode {
  \set stanza = "8."
  Christ be with me, Christ with -- in me,
  Christ be -- hind me, Christ be -- fore me,
  Christ be -- side me, Christ to win me,
  Christ to com -- fort and re -- store me.

  Christ be -- neath me, Christ a -- bove me,
  Christ in qui -- et, Christ in dan -- ger,
  Christ in hearts of all that love me,
  Christ in mouth of friend and stran -- ger.
}

%%%%%%%%%%%%%%
%%%%%%%%%%%%%%
melodyc = \relative c' {
  \global
  \partial 4
  d4 |
  g2 g4 |
  f( d) f |
  bf( d) c8[ bf] |
  bf4( a) a |
  c( a) f |
  f( a) c |
  bf2 bf4 |
  a2 \bar "||"
  d4 |
  g,4.( a8) bf[ g] |
  f4( d) bf |
  bf'2 f4 |
  g( a) bf8[ c] |
  d2 c8[ d] |
  bf4( g) a |
  g2 g4 |
  g2 \bar "||"
  f4 |
  bf2 bf4 |
  bf2 c8[ d] |
  c2 b4 |
  c4 c d |
  g,2 g4 |
  f( a) c |
  bf2 bf4 |
  a2 d,4 |
  g4.( a8) bf[ g] |
  f4( d) bf |
  bf'2 f4 |
  g a bf8[ c] |
  d2 c8[ d] |
  bf4( g) a |
  g2 g4 |
  g2 \bar "|."
}

sopranoc = \relative c' {
  \global
  \partial 4
  d4 |
  g2 g4 |
  f( d f) |
  bf d c8[ bf] |
   \ignore bf4( a) a |
  c( a) f |
  f( a) c |
  bf2 <g bf>4 |
  a2
  <d, f d'>4 |
  g4.( a8) bf[ g] |
  f4( d) bf |
  bf'2 f4 |
  g( a) bf8[ c] |
  d2 c8[ d] |
  bf4( g) a |
  g2.~ |
  g2\fermata
  f4 |
  bf2 bf4 |
  bf2 c8[ d] |
  c2 b4 |
  c2 d4 |
  g,2 g4 |
  f( a) c |
  bf2 bf4 |
  a2 d,4 |
  g4.( a8) bf[ g] |
  f4( d) bf |
  bf'2 f4 |
  g( a) bf8[ c] |
  d2 c8[ d] |
  bf4( g) a |
  g2.~ |
  g2

}

altoc = \relative c' {
  \global
  \partial 4
  d4 |
  <bf d>2. -\shape #'((1 . 0.5) (0 . 0.5) (0 . 0.5) (-0.5 . 0.5)) ~ |
  <a d> |
  <d f>2 <ef g>4 |
  <<{f2.} \\ { c2 c4} >>
  <c f>2. |
  <c f>2 <c ef>4 |
  f2 ef8[ d] |
  <c f>2
  s4 |
  <ef g>2 <bf ef>4 |
  <bf d>2 bf4 |
  <bf d>2 <bf f'>4 |
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
  d ef f |
  d2 ef4 |
  d2
}

tenorc = \relative c {

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
  <<{\voiceOne  \ignore bf2 c4 bf2}\\{\voiceThree \shiftOff \tieDown g2.-\shape #'((2 . 1) (0 . 0.9) (0 . 0.9) (-1 . 1)) ~ g2}>>
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

bassc = \relative c {
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
  \shiftOff ef( ef,) g |
  bf2 <bf d>4 |
  g2 d'4 |
  ef d g8[ f] |
  bf,2 f4 |
  d( ef) d |
  g2 c4 |
  g2\fermata
  bf4 |
  bf d ef |
  d2 c8[ bf] |
  c4( ef) g |
  c,2 g4 |
  ef2. |
  f |
  d2 <ef bf'>4 |
  f2 <d d'>4 |
  ef2. |
  bf'2 bf8[ a] |
  g2 d'4 |
  ef( d) g8[ f] |
  bf,2 f'8[ d] |
  g,4( ef) d |
  <g d'>2 c4 |
  <g d'>2
}


verseNine = \lyricmode {
  \set stanza = "9."
  I bind un -- to my -- self the Name,
  The strong Name of the Tri -- ni -- ty,
  By in -- vo -- ca -- tion of the same,
  The Three in One and One in Three.
  By Whom all na -- ture hath cre -- a -- tion,
  E -- ter -- nal Fa -- ther, Spi -- rit, Word:
  Praise to the Lord of my sal -- va -- tion,
  Sal -- va -- tion is of Christ the Lord.
}


%%%%%%%%%%
%% scores
%%%%%%%%%%

\score {
  <<
    \new Voice = "melody" {\melody }
    \context Lyrics = one \lyricsto "melody" \verseOne
    \context PianoStaff \with { instrumentName = #"Organ"}<<
      \context Staff = upper <<
        \context Voice =
        sopranos { \voiceOne << \soprano >> }
        \context Voice =
        altos { \voiceTwo << \alto >> }

      >>
      \context Staff = lower <<
        \clef bass
        \context Voice =
        tenors { \voiceOne << \tenor >> }
        \context Voice =
        basses { \voiceTwo << \bass >> }
      >>
    >>
  >>
  \header {
    piece = \markup { \small {Text: St. Patrick; tr. C.F. Alexander }}
  }
  \midi {
    \context {
      \Score
      tempoWholesPerMinute = #(ly:make-moment 96 4)
    }
  }
  \layout {
  	indent = 0.4\in
  }
}

\noPageBreak 

%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%

\score {
  <<
    \new Voice = "melody" {\melodya }
    \context Lyrics = two \lyricsto "melody" \verseTwo
    \context Lyrics = three \lyricsto "melody" \verseThree
    \context Lyrics = four \lyricsto "melody" \verseFour
    \context Lyrics = five \lyricsto "melody" \verseFive
    \context Lyrics = six \lyricsto "melody" \verseSix
    \context Lyrics = seven \lyricsto "melody" \verseSeven
    \context PianoStaff <<
      \context Staff = upper <<
        \context Voice =
        sopranos { \voiceOne << \sopranoa >> }
        \context Voice =
        altos { \voiceTwo << \altoa >> }

      >>
      \context Staff = lower <<
        \clef bass
        \context Voice =
        tenors { \voiceOne << \tenora >> }
        \context Voice =
        basses { \voiceTwo << \bassa >> }
      >>
    >>
  >>
  \midi {
    \context {
      \Score
      tempoWholesPerMinute = #(ly:make-moment 96 4)
    }
  }
  \layout {}
}

%%%%%%%%%%%%%
%% score b %%
%%%%%%%%%%%%%

\score {
  \context ChoirStaff <<
    \context Staff = upper <<
      \context Voice =
      sopranos { \voiceOne << \melodyb >> }
      \context Voice =
      altos { \voiceTwo << \altob >> }
      \context Lyrics = eight \lyricsto sopranos \verseEight
    >>
    \context Staff = lower <<
      \clef bass
      \context Voice =
      tenors { \voiceOne << \tenorb >> }
      \context Voice =
      basses { \voiceTwo << \bassb >> }
    >>
  >>
  \header {
    piece = \markup { \small { Music: DEIDRE, 88.88., adapt. from Ancient Irish Melody } }
  }
  \midi {
    \context {
      \Score
      tempoWholesPerMinute = #(ly:make-moment 84 4)
    }
  }
  \layout { }
}


%%%%%%%%%%%%%
%% score c %%
%%%%%%%%%%%%%

\score {
  <<
    \new Voice = "melody" {\melodyc }
    \context Lyrics = nine \lyricsto "melody" \verseNine
    \context PianoStaff <<
      \context Staff = upper <<
        \context Voice =
        sopranos { \voiceOne << \sopranoc >> }
        \context Voice =
        altos { \voiceTwo << \altoc >> }

      >>
      \context Staff = lower <<
        \clef bass
        \context Voice =
        tenors { \voiceOne << \tenorc >> }
        \context Voice =
        basses { \voiceTwo << \bassc >> }
      >>
    >>
  >>
  \midi {
    \context {
      \Score
      tempoWholesPerMinute = #(ly:make-moment 96 4)
    }
  }
  \layout { }
}

