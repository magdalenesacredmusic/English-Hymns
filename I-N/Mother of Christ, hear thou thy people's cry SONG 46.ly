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
      \line {
        Text: \italic "Alma redeptoris mater," attr. Hermanus Contractus (1013-1054); Tr. Edward Caswall, (1814-1878)
      }
      \wordwrap {
        Music: SONG 46, 10 10, adapt. from Orlando Gibbons (1583-1625); Harm. \italic "The English Hymnal," 1906
      }
    }
  }
}

top = \markup {
  \fill-line {
    \column {
      \line {SONG 46  10 10}
    }
    \right-column{
      \line {adapt. from Orlando Gibbons (1583-1625)}
      \line {harm. \italic "The English Hymnal," 1906}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null 
    \right-column {
      \line {"Sancti, venite, Christi corpus smite"}
      \line {Antiphonary of Bangor, 7th cent.; tr. J.M. Neale}
    }
  } 
}

\header {
  tagline = ""
}

global = {
  \key f \major
  \time 4/4
  %\autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
  \global
f2 a4 f |
c'2. f,4 |
bf4. bf8 bf4 a |
\tieDashed g4~ g4~ g4 \bar "" \break

 g4 |
 e f d c |
 f a g g |
 f1 \bar "|."
}

alto = \relative c' {
  \global
c2 f4 c |
c2. f4 |
f4. f8 g4 f |
\tieDashed e4~ e4~ e4 

d4 |
c c bf a |
d f f e |
f1
}

tenor = \relative c' {
  \global
  a2 c4 a |
  g2. a4 |
  bf4. bf8 ef4 c |
  \tieDashed c4~ c4~ c4
  
  bf4 |
  g f f f |
  a c c4. bf8 |
  a1
}

bass = \relative c {
  \global
 f2 f4 f |
 f( e2) f4 |
 d4. d8 ef4 f |
 \tieDashed c4~ c4~ c4 
 
 g4 |
 c a bf f' |
 d a c c |
 f1
}

verseOne = \lyricmode {
  \set stanza = "1."
  Moth -- er of Chirst, hear thou thy peo -- ple's cry,
  Star of the deep and por -- tal of the sky!
}

verseTwo = \lyricmode {
  \set stanza = "2."
  Moth -- er of him, who thee from noth -- ing made, 
  Sink -- ing we strive and call to thee for aid:
}

verseThree = \lyricmode {
  \set stanza = "3."
  Oh, by that joy which Ga -- briel brought to \set ignoreMelismata = ##t  thee,
Thou Vir -- gin first and last, let us thy mer -- cy see.
  
}


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
      \new Staff  <<
        \clef bass
        \new Voice = "tenor" { \voiceOne \tenor }
        \new Voice = "bass" { \voiceTwo \bass }
      >>
    >>
    \midi {
      \context {
        \Score
        tempoWholesPerMinute = #(ly:make-moment 92 4)
      }
    }
    \include "hymn_layout.ly"
  }
  %\bottom
  \refs
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
  \score { %\transpose c a,
    \new ChoirStaff <<
      \new Staff  <<
        \new Voice = "soprano" { \voiceOne \melody }
        \new Voice = "alto" { \voiceTwo \alto }
      >>
      \new Lyrics  \lyricsto soprano \verseOne
      \new Lyrics  \lyricsto soprano \verseTwo
      \new Lyrics  \lyricsto soprano \verseThree
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
  \refs
}

%%%%%%
%%%%%%
%%%%%%
#(define output-suffix "Melody")
\book {
  \include "lilypond-book-preamble.ly"
  \include "hymn_melody_paper.ly"
  %\top
  \score {
    %\transpose c bf,
    <<
      \new Voice = "tune" {
        \melody
      }
      \new Lyrics \lyricsto "tune" { \verseOne }
      \new Lyrics \lyricsto "tune" { \verseTwo }
      \new Lyrics \lyricsto "tune" { \verseThree }
    >>
    \include "hymn_layout.ly"
  }
  \markup { 
    \vspace #0.5 
  }
  %\bottom
  \refs
}




