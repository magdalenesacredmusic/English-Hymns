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
      \line {ADORO TE  10 10 10 10}
    }
    \right-column{
      \line {Mode 5 plainsong, Solesmes}
      \line {harm. \italic "The English Hymnal," 1906}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null 
    \right-column {
      \line {\italic "Adoro te devote"}
      \line {Thomas Aquinas; tr. John Mason Neale, alt.}
    }
  } 
}

\header {
  tagline = ""
}


global = {
	\key d \major
	\cadenzaOn
	\autoBeamOff
	\set Staff.midiInstrument = "church organ"

}

melody = \relative c' {
	\global
	
  d4 fs a a a( b) a \bar "'"
  g fs e d d2 \hb 
  d4 fs a a a( b) a \bar "'"
  g fs e d d2 \bar "|"
  
  a'4 a b( cs) d d( cs) a \bar "'"
  b4 a g fs e2 \hb 
  fs4 a g fs e( d) e \bar "'"
  fs d e d d2 \bar "||" \break
  
  d4( e d) cs2( d2) \bar "|."
}

melodya = \relative c' {
	\global
	  \override Stem #'length = #0
  d4 fs a a a( b) a \bar "'"
  g fs e d d2 \hb 
  d4 fs a a a( b) a \bar "'"
  g fs e d d2 \bar "|"
  
  a'4 a b( cs) d d( cs) a \bar "'"
  b4 a g fs e2 \hb 
  fs4 a g fs e( d) e \bar "'"
  fs d e d d2 \bar "||" \break
  
  d4( e d) cs2( d2) \bar "|."
}



alto = \relative c' {
	\global
  d1~ d2.
  <b d>2 <a c>2 a2 
  d1~ d2.
  <b d>2 <a c>2 a2 
  
  <d fs>2~ <d fs>2. <fs a>2.
  <d fs>2 <b d>2~ b4 cs
  <d fs>2 <b d>2 s2.
  <b d>2 b4 cs a2
  
  b2 a~ a2 a2
}

tenor = \relative c {
	\global
  <fs a>1~ fs2.
  s1 fs2
  <fs a>1~ fs2.
  s1 fs2
  
  s2 s2. a2.
  s1 g4 a
  a2 s2 <g b>2.
  fs2 g4 <e a>4
  fs2
  
  fs4 g fs e2 fs2
}

bass = \relative c {
	\global
  d1~ d4 b d
  g, d' a2 d
  d1~ d4 b d
  g, d' a2 d
  
  d2 b2. fs'2.
  b,4 d g, b e a,
  d2 g,4 b e2.
  b2 e4 a, d2
  
  b4 e, fs a2 d2
}

verseOne = \lyricmode {
	\set stanza = "1."
	Humb -- ly I a -- dore thee, hid -- den De -- i -- ty,
	Which be -- neath these fig -- ures are con -- cealed from me;
	Whol -- ly in sub -- mis -- sion thee my spir -- it hails,
	For in con -- tem -- plat -- ing thee it whol -- ly fails.
	
	\set stanza = "7." A -- men.
}

verseTwo = \lyricmode {
	\set stanza = "2."
	Taste and touch and vi -- sion in thee are de -- ceived:
	But the hear -- ing on -- ly may be well be -- lieved:
	I be -- lieve what -- ev -- er God's own Son de -- clared;
	Noth -- ing can be tru -- er than truth's ve -- ry Word.
}

verseThree = \lyricmode {
	\set stanza = "3."
	On the cross lay hid -- den but thy De -- i -- ty:
	Here is al -- so hid -- den thy hu -- man -- i -- ty:
	But in both be -- liev -- ing and con -- fess -- ing, Lord,
	Ask I what the dy -- ing thief of thee im -- plored.
}

verseFour = \lyricmode {
	\set stanza = "4."
	Though thy Wounds, like Tho -- mas, I be -- hold not now,
	Thee my Lord con -- fess -- ing, and my God, I bow:
	Give me ev -- er strong -- er faith in you a -- bove,
	Give me ev -- er strong -- er hope and strong -- er love.
}

verseFive = \lyricmode {
	\set stanza = "5."
	O most sweet me -- mo -- rial of his death and woe,
	Liv -- ing Bread, Which giv -- est life to man be -- low,
	Let my spir -- it ev -- er eat of thee and live,
	And the blest fru -- i -- tion of thy sweet -- ness give!
}

verseSix = \lyricmode {
	\set stanza = "6."
	Pel -- i -- can of Mer -- cy, Je -- sus, Lord and God;
	Cleanse me, wretch -- ed sin -- ner, in thy Pre -- cious Blood: 
	Blood, where -- of one drop for hu -- man -- kind out -- poured
	Might from all trans -- gres -- sion have the world re -- stored.
}

verseSeven = \lyricmode {
	\set stanza = "7."
	Je -- sus, thou, Whom thus veil'd, I must see be -- low,
	When shall that be giv -- en which I long for so,
	That at last be -- hold -- ing thy un -- cov -- er'd Face,
	Thou wouldst sa -- tis -- fy me with thy full -- est grace?

        
	A -- men.
}



%%%%%%%%
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
        tempoWholesPerMinute = #(ly:make-moment 96 4)
      }
    }
    \include "hymn_layout.ly"
  }
    \markup {
    \vspace #2.0
  \large {
    \fill-line {
      \hspace #1.0
      \column {
        \line {
          \bold "5. "
          \column {
        "O most sweet memorial of his death and woe,"
	"Living Bread, Which givest life to man below,"
	"Let my spirit ever eat of you and live,"
	"And the blest fruition of your sweetness give!"
          }
        }
        \vspace #0.5
        \line {
          \bold "6. "
          \column {
        "Pelican of Mercy, Jesus, Lord and God;"
	"Cleanse me, wretched sinner, in your Precious Blood: "
	"Blood, whereof one drop for humankind outpoured"
	"Might from all transgression have the world restored."
          }
        }
        \vspace #0.5
        \line {
          \bold "7. "
          \column {
        "Jesus, you, whom thus veil'd, I must see below,"
	"When shall that be given which I long for so,"
	"That at last beholding your uncover'd face,"
	"You wouldst satisfy me with your fullest grace?"
	"Amen."
          }
        }
      }
      \hspace #1.0

    }
  }
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
        \melodya
      }
      \new Lyrics \lyricsto "tune" { \verseOne }
      \new Lyrics \lyricsto "tune" { \verseTwo }
      \new Lyrics \lyricsto "tune" { \verseThree }
      \new Lyrics \lyricsto "tune" { \verseFour }
    >>
    \include "hymn_layout.ly"
  }
    \markup {
    \vspace #2.0
  \large {
    \fill-line {
      \hspace #1.0
      \column {
        \line {
          \bold "5. "
          \column {
        "O most sweet memorial of his death and woe,"
	"Living Bread, Which givest life to man below,"
	"Let my spirit ever eat of you and live,"
	"And the blest fruition of your sweetness give!"
          }
        }
        \vspace #0.5
        \line {
          \bold "6. "
          \column {
        "Pelican of Mercy, Jesus, Lord and God;"
	"Cleanse me, wretched sinner, in your Precious Blood: "
	"Blood, whereof one drop for humankind outpoured"
	"Might from all transgression have the world restored."
          }
        }
        \vspace #0.5
        \line {
          \bold "7. "
          \column {
        "Jesus, you, Whom thus veil'd, I must see below,"
	"When shall that be given which I long for so,"
	"That at last beholding your uncover'd Face,"
	"You wouldst satisfy me with your fullest grace?"
          }
        }
      }
      \hspace #1.0

    }
  }
}
  \bottom
}
