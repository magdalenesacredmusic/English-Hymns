\version "2.18.2"
\include "english.ly"
\include "hymn_definitions.ly"

top = \markup {
  \fill-line {
    \column {
      \line {ADOREMUS IN AETERNUM}
    }
    \right-column{
      \line {Gregorian, Mode V}
      \line {Harm. David O'Donnell after Henri Potiron}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null
    \right-column {
      \line {\italic "Adoremus in aeternum"}
      \line {Tr. Anon.}
    }
  }
}

\header {
  tagline = ""
}

global = {
  \key ef \major
  \cadenzaOn
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c'' {
  \global
  g8 f g f8^-[ ef] bf' c bf^- a g4 \bar "'"
  g8 f[ g] f8 ef f[ g] f ef4 \bar "||"
  
  %vs1
  ef8 g bf bf bf bf c bf4 \bar "|"
  bf8 bf c a! bf g4 \bar "||"
  %vs2
  ef8 g bf bf bf bf bf bf c bf4 \bar "|"
  bf8 bf bf bf bf bf bf c a! bf g4 \bar "||"
  %Gloria Patri
  ef8 g bf bf bf bf bf bf c c bf4 \bar "|"
  bf8 bf bf c a! bf g4 \bar "|"
  
  ef8 g bf bf bf bf bf bf bf bf bf bf c c bf4 \bar "|"
  bf8 bf c a! bf g4 \bar "||"
}

melodya = \relative c'' {
  \global
  \override Stem #'length = #0
  g4 f g f4^-( ef) bf' c bf^- a g2 \bar "'"
  g4 f( g) f4 ef f( g) f ef2 \bar "||" \break
  
  %vs1
  ef4 g bf bf bf bf c bf2 \bar "|"
  bf4 bf c a! bf g2 \bar "||"
  %vs2
  ef4 g bf bf bf bf bf bf c bf2 \bar "|"
  bf4 bf bf bf bf bf bf c a! bf g2 \bar "||"
  %Gloria Patri
  ef4 g bf bf bf bf bf bf c c bf2 \bar "|" \break
  bf4 bf bf c a! bf g2 \bar "|"
  
  ef4 g bf bf bf bf bf bf \bar "" \break bf bf bf bf c c bf2 \bar "|"
  bf4 bf c a! bf g2 \bar "||"
}

alto = \relative c' {
  \global
  ef4. c4 d4 ef d4.
  c2 d4. bf4
  
  ef2. s8 f4 
  f4~ f4. d4
  ef4 g2. s8 d4
  d1 ef4 d
  
  %Gloria Patri
  ef4~ ef1 f4
  f4.~ f4. d4
  ef4 g1. d4
  d4. ef4 d
}

tenor = \relative c' {
  \global
  bf4. af4 g~ g bf4.
  c2 bf4 af8 g4
  
  g2. s8 bf4
  bf4 a4 c8 bf4
  bf4~ bf2. s8 bf4
  bf1 c4 bf
  %Gloria Patri
  g4~ g1 bf4
  bf4. a!4 c8 bf4
  bf4~ bf1.~ bf4
  bf4. c4 bf4
}

bass = \relative c {
  \global
 ef4. af,4 bf4 c g'4.
 af,2 bf4. ef4
 
 ef2. s8 d4
 d4 f4. g4
 g4 ef2. s8 g4
 g1~ g4~ g
 
  %Gloria Patri
  ef4~ ef1 d4
  d4. f4. g4
  g4 ef1. g4
  g4.~ g4~ g
}

verseOne = \lyricmode {
  \set stanza = "℟."
  Let us a -- dore for e -- ter -- ni -- ty
  the most ho -- ly Sa -- cra -- ment.
  
  \set stanza = "Ps."
  O praise the Lord, all you na -- tions:
  praise him, all you peo -- ple.
  
  For his mer -- cy is con -- firmed up -- on us:
  and the truth of the Lord re -- mains for ev -- er.
  
  Glo -- ry be to the Fa -- ther, 
	and to the Son, and to the Ho -- ly Spi -- rit.
	As it was in the be -- gin -- ning,
	is now, and ev -- er shall be,
	world with -- out end. A -- men.
}


\book {
  \include "hymn_paper.ly"
  \header {
    tagline = ""
  }
  \top
  \score { \transpose c b,
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
        tempoWholesPerMinute = #(ly:make-moment 80 4)
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
  \score { \transpose c b,
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
    \transpose c b,
    <<
      \new Voice = "tune" {
        \melodya
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
