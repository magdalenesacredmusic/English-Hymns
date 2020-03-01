%{
The music and poetry produced by this source code are believed to be in the public domain in the United States.
The source code itself is licensed under a Creative Commons Attribution-NonCommercial 4.0 International License:
http://creativecommons.org/licenses/by-nc/4.0/

Musicam Ecclesiae - sites.google.com/site/musicamecclesiae
%}

\version "2.18.2"
\include "english.ly"
\include "hymn_definitions.ly"

top = \markup {
  \fill-line {
    \column {
      \line {GRAFTON 87 87 87}
    }
    \right-column{
      \line {French \italic "Tantum ergo" }
      \line {\italic "Chants Ordinaires de l'Office Divin," Paris, 1881}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null 
    \right-column {
      \line {John Keble (1792-1866)}
    }
  } 
}

\header {
  tagline = ""
}

global = {
  \key ef \major
  \time 4/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c'{
  \global
ef4 f g ef |
g8[ f] g[ af] bf4 g |
bf bf af af |
g8[ f] g[ ef] f2 |
 
f4 g af4. g8 |
af8[ g] f[ ef] f4 bf, |
ef4 ef f f  |
g8[ f] g[ af] bf2 |
 
 bf8[ c] bf[ af] g4 g |
af8[ bf] af[ g] f4 f |
bf8[ c] bf[ af] g[( bf] ef) af, |
g4 f ef2 \bar "|."
}

alto = \relative c' {
  \global
bf4 d ef ef |
ef8[ g] ef4 d ef |
bf ef ef d
ef8[ f] ef4 d2
 
bf4 ef ef4. ef8
ef4 c d bf
c bf c d
ef ef ef( d)
 
ef d ef bf
ef f8[ ef] ef4 d
ef4 ef8[ f] g[( f] ef) f
f8[ ef] ef[ d] ef2
}

tenor = \relative c' {
  \global
g4 bf bf bf
bf bf8[ af] f4 g
ef' bf c bf
bf8[ af] bf[ g] f2
 
bf4 f af4. bf8
c8[ bf] af[ g] bf4 bf
g bf af bf
bf4. af8 f2
 
bf4 bf bf bf
af c f, bf
bf c8[ d] ef[( bf] c8) c
bf4 af g2
}

bass = \relative c {
  \global
ef4 bf'8[ af] g[ af] g[ f]
ef[ d] c4 bf ef
g g f bf,
ef g, bf2
 
d4 ef c4. bf8
af4 c bf d
c g' f bf,
ef8[ d] c4 bf2
 
g'4 f ef8[ f] ef[ d]
c4 af bf bf'8[ af]
g4 f ef8[( d] c) af 
bf4 bf ef2
}

verseOne = \lyricmode {
  \set stanza = "1. "
Word su -- preme, be -- fore cre -- a -- tion
  Born of God e -- ter -- nal -- ly
Who didst will for our sal -- va -- tion
  To be born on earth, and die;
Well thy saints have kept their sta -- tion,
  Watch -- ing till thine hour drew nigh.
}

verseTwo = \lyricmode {
  \set stanza = "2. "
Now ’tis come, and faith es -- pies thee:
  Like an eag -- le in the morn,
John in stead -- fast wor -- ship eyes thee,
  Thy be -- lov’d, thy lat -- est born:
In thy glo -- ry he de -- scries thee
  Reign -- ing from the tree of scorn.
}

verseThree = \lyricmode {
  \set stanza = "3. "
He first hop -- ing and be -- liev -- ing
  Did be -- side the grave a -- dore;
Lat -- est he, the war -- fare leav -- ing,
  Land -- ed on the_e -- ter -- nal shore;
And his wit -- ness we re -- ceiv -- ing
  Own thee Lord for ev -- er -- more.
}

verseFour = \lyricmode {
  \set stanza = "4. "
Much he asked in lov -- ing won -- der,
  On thy bo -- som lean -- ing, Lord!
In that se -- cret place of thun -- der,
  An -- swer kind didst thou ac -- cord,
Wis -- dom for thy Church to pon -- der
  Till the day of dread a -- ward.
}

verseFive = \lyricmode {
  \set stanza = "5. "
Thee, the_Al -- migh -- ty King e -- ter -- nal,
  Fath -- er of the_e -- ter -- nal Word;
Thee, the Fath -- er’s Word su -- per -- nal,
  Thee, of both, the Breath a -- dored;
Heav'n, and earth, and realms in -- fer -- nal
  Own, one glo -- rious God and Lord. 
  A -- men.
}
\book {
  \include "hymn_paper.ly"
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
        tempoWholesPerMinute = #(ly:make-moment 84 4)
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
  \bottom
}
