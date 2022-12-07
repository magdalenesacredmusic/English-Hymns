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
      \line {DIVA SERVATRIX   11 11 11 5}
    }
    \column{
      \line {Baueux Church Melody, arr. R. Vaughan Williams, 1906}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null 
    \right-column {
      \line {\italic "Gaudium mundi, nova stella caeli"}
      \line {"Peter Damian, 11th cent."} 
      \line {"Tr. St. Cecilia's Abbey, Ryde"}
    }
  } 
}

\header {
  tagline = ""
}

global = {
  \key g \major
  \time 4/4
  %\autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c'' {
  \global
  b2 b4 c |
  b2 g |
  a4. g8 a4 b |
  a2 g | \break
  
  b b4 d |
  c2 b |
  a4. g8 fs4 g4 | \break
  
  e2 d |
  b' a4 g |
  c2 b |
  g4. a8 \bar "" \break
  
  b4 c |
  d2 d |
  b a4 g |
  a2 g \bar "||"
  
  g2 g2 \bar "|."
}

melodya = \relative c'' {
  \global
  b2 b4 c |
  b2 g |
  a4. g8 a4 b |
  a2 g | \break
  
  b b4 d |
  c2 b |
  a4. g8 fs4 g4 | \break
  
  e2 d |
  b' a4 g |
  c2 b |
  g4. a8 \bar "" \break
  
  b4 c |
  d2 d |
  b a4 g |
  a2 g \bar "||" \break
  
  g2 g2 \bar "|."
}

alto = \relative c' {
  \global
  <d g>2 <d g>4 <e g> |
  <d g>2 <b d> |
  <d fs>4. <b e>8 <d fs>4 <d g> |
  <d fs>2 <b d>

  <d g> <d g>4 <d g> |
  <e g>2 <d g> |
  <d fs>4. <b e>8 <b d>4 <b d> |
  cs2 a |

  <d g>2 <d fs>4 <b e> |
  <e g>2 <d g> |
  <b d>4. d8 <d g>4 g|
  <d g>2 <d fs> |
  <d g> <c e>4 <b e> |
  <d fs>2 <b d>
  
  <c e>2 <b d>2
}

tenor = \relative c' {
  \global
  s1 |
  s1 |
  s1 |
  s1 

  s1 
  s1 
  s1
  a2 fs 

  s1 
  s1 
  s1 
  a2 a |
  g s2 
  s1 
  
  s1
}

bass = \relative c' {
  \global
  g2 g4 \stemUp c, |
  \stemDown g'2 g |
  d4. e8 d4 \stemUp b |
  d2 g,

  \stemDown g' g4 \stemUp b, |
  c2 g |
  \stemDown d'4. e8 \stemUp b4 g |
  \stemDown a2 d |

  g2 d4 e |
  \stemUp c2 g |
  \stemDown g'4. fs8 g4 e |
  d2 d |
  g c,4 e |
  \stemUp d2 g,
  
  c2 g2
  
}

verseOne = \lyricmode {
  \vOne
  Joy of poor sin -- ners, fair -- est Star of heav -- en,
  Sun of true jus -- tice chose you as his Moth -- er;
  Save us who per -- ish, raise the sad -- ly fall -- en,
  Mar -- y, pure Vir -- gin.
}

verseTwo = \lyricmode {
  \vTwo
  You were the lad -- der by which God de -- scend -- ed,
  Through you the High -- est came to seek the low -- est;
  By your pro -- tec -- tion, help us as we jour -- ney
  On -- wards to heav -- en.
}

verseThree = \lyricmode {
  \vThree
  Choirs of bright an -- gels throng with joy to meet you,
  Saints of the Old Law, proph -- ets and a -- pos -- tles,
  Has -- ten to lead you to your throne of glo -- ry
  Next to the God -- head.
}

verseFour = \lyricmode {
  \vFour
  Praised be for ev -- er Trin -- i -- ty most ho -- ly,
  Who crowned you, Mar -- y, Vir -- gin pure and sin -- less,
  And gave you to us, Queen and lov -- ing Moth -- er, 
  Now and for -- ev -- er.
  
  A -- men.
}



\book {
  \include "hymn_paper.ly"
  \header {
    tagline = ""
  }
  \top
  \score { \transpose c bf,
    \new ChoirStaff <<
      \new Staff  <<
        \new Voice = "soprano" { \voiceOne \melody }
        \new Voice = "alto" { \voiceTwo \alto }
      >>
      \new Lyrics  \lyricsto soprano \verseOne
      \new Lyrics  \lyricsto soprano \verseTwo
      \new Lyrics  \lyricsto soprano \verseThree
      \new Lyrics \lyricsto soprano \verseFour
      \new Staff  <<
        \clef bass
        \new Voice = "tenor" { \voiceOne \tenor }
        \new Voice = "bass" { \voiceTwo \bass }
      >>
    >>
    \midi {
      \context {
        \Score
        tempoWholesPerMinute = #(ly:make-moment 110 4)
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
    \transpose c bf,
    <<
      \new Voice = "tune" {
        \melodya
      }
      \new Lyrics \lyricsto "tune" { \verseOne }
      \new Lyrics \lyricsto "tune" { \verseTwo }
      \new Lyrics \lyricsto "tune" { \verseThree }
      \new Lyrics \lyricsto "tune" { \verseFour }
    >>
    \include "hymn_layout_ragged.ly"
  }
  \markup { 
    \vspace #0.5 
  }
  \bottom
}


