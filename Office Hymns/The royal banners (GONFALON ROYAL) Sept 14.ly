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
      \line {GONFALON ROYAL  LM}
    }
    \column{
      \line {P.C. Buck, 1918}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null 
    \right-column {
      \line {Vs. 1-5 "Vexilla Regis prodeunt"}
      \line {Venantius Fortunatus; tr. J.M. Neale}
    } 
  }
}


global = {
  \key g \major
  \time 4/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
  \global
  \partial 4
  d4 |
  e g c b8[ a] |
  b4 g e2~ |
  e4 e a fs | %\break
  d g c8[ b] a[ g] | 
  a2. \bar "" 

  a4 | 
  d b g4. g8 | 
  c4 a fs \bar "" %\break
  
    e8[ fs] |
  g[ a] b[ a] c4 b | 
  a e d2 \bar "||" \break

  \time 1/4
  d4 |
  \time 4/4
  e4 g a2 |
  g2 \bar "|."
}

melodya = \relative c' {
  \global
  \partial 4
  d4 |
  e g c b8[ a] |
  b4 g e2~ |
  e4 e a fs | %\break
  d g c8[ b] a[ g] | 
  a2. \bar "" 

  a4 | 
  d b g4. g8 | %\break
  c4 a fs 
  
    e8[ fs] | %\noBreak
  g[ a] b[ a] c4 b |% \noBreak
  a e d2 \bar "||" \break

  \time 1/4
  d4 |
  \time 4/4
  e4 g a2 |
  g2 \bar "|."
}

alto = \relative c' {
  \global
  \partial 4
  b4^\markup { \italic "Unison."} |
  b c e d |
  d2 c4 d |
  c2. d4 |
  d2. cs4 |
  d2.

  f4 |
  f2 e |
  e ds4 cs8[ ds] |
  e4 f e d |
  e c a2

  b4 |
  b e8[ d] c4 a |
  b2
}

tenor = \relative c' {
  \global
  \partial 4
  g4 |
  g e g fs |
  g2. gs4 |
  a2 d,4 a' |
  a g2 g4 |
  g( fs f) 
  
  d'8[ c] |
  b8[( c] d4) d( c8[ b]) |
  a8[( b] c4) b2 |
  b4 f a fs8[ gs] |
  a4 g2 fs4 |
  
  b4 |
  g2. fs4 |
  g2
}

bass = \relative c' {
  \global
  \partial 4
  g4 |
  e c a d |
  g, b c b |
  a g fs c' |
  b2 e,4 e' |
  d2.
  
  d4 |
  g,2 c |
  fs, b |
  e4 d a b |
  c a d2 
  
  g4 |
  e c8[ b] a4 d |
  g,2
}

verseOne = \lyricmode {
  \vOne
  The Roy -- al Ban -- ners for -- ward go,
  The Cross shines forth in mys -- tic glow;
  Where He in flesh, our flesh Who made,
  Our sen -- tence bore, our ran -- som paid.
}

verseTwo = \lyricmode {
  \vTwo
  Where deep for us the spear was dyed,
  Life’s tor -- rent rush -- ing from His side,
  To wash us in that pre -- cious flood,
  Where min -- gled wa -- ter flowed, and blood.
}

verseThree = \lyricmode {
  \vThree
  Ful -- filled is all that Da -- vid told
  In true pro -- phet -- ic song of old,
  A -- midst the na -- tions, God, saith he,
  Hath reigned and tri -- umphed from the tree.
}

verseFour = \lyricmode {
  \vFour
  O Tree of Beau -- ty, Tree of light!
  O Tree with roy -- al pur -- ple dight!
  E -- lect on whose tri -- um -- phal breast
  Those ho -- ly limbs should find their rest.
  
 % \set stanza = "7." A -- _ _ _ men.
}

verseFive = \lyricmode {
  \vFive
 On whose dear arms, so wide -- ly flung,
            The weight of this world's ran -- som hung:
           The price of hu -- man -- kind to pay,
            And spoil the spoil -- er of his prey.
          }

verseSix = \lyricmode {
  \vSix
            O Cross, our one re -- li -- ance, hail!
            This sol -- emn fes -- ti -- val, a -- vail
            To give fresh me -- rit to the saint,
            And par -- don to the pen -- i -- tent.
          }

verseSeven = \lyricmode {
  \set stanza = "7." 
  \vSeven
            To Thee, E -- ter -- nal Three in One,
           Let hom -- age meet by all be done:
            As by the Cross Thou dost re -- store,
            Pre -- serve and gov -- ern ev -- er -- more.
            A -- _ _ _ men.
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
    \include "hymn_layout_ragged.ly"
  }
  \markup {
  \large {
    \fill-line {
      \hspace #1.0
      \column {
        \line {
          \bold "5."
          \column {
            "On whose dear arms, so widely flung,"
            "The weight of this world's ransom hung:"
            "The price of humankind to pay,"
            "And spoil the spoiler of his prey."
          }
        }
        \vspace #0.5
        \line {
          \bold "6."
          \column {
            "O Cross, our one reliance, hail!"
            "This solemn festival, avail"
            "To give fresh merit to the saint,"
            "And pardon to the penitent."
          }
        }
        \vspace #0.5
        \line {
          \bold "7."
          \column {
            "To Thee, Eternal Three in One,"
            "Let homage meet by all be done:"
            "As by the Cross Thou dost restore,"
            "Preserve and govern evermore."
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
      \new Lyrics \lyricsto "tune" { \verseFive }
      \new Lyrics \lyricsto "tune" { \verseSix }
      \new Lyrics \lyricsto "tune" { \verseSeven }
    >>
    \include "hymn_layout_ragged.ly"
  }
%{     \markup {
    \vspace #0.5
	\large {
  \fill-line {
    \hspace #0.1 % moves the column off the left margin;
        % can be removed if space on the page is tight
     \column {
      \line { \bold "5. "
		\column {
		  "On whose dear arms, so widely flung,"
            "The weight of this world's ransom hung:"
            "The price of humankind to pay,"
            "And spoil the spoiler of his prey."
        }
     	}
    }
    \hspace #0.1  % adds horizontal spacing between columns;
        % if they are still too close, add more " " pairs
        % until the result looks good
     \column {
      \line { \bold "6. "
		\column {
		 "O Cross, our one reliance, hail!"
            "This holy Passiontide, avail"
            "To give fresh merit to the saint,"
            "And pardon to the penitent."

        }
      	}
    }
  \hspace #0.1 % gives some extra space on the right margin;
      % can be removed if page space is tight
  }
}
}
  \markup { 
    \vspace #0.5 
  }
  \markup {
  \large {
    \fill-line {
      \hspace #1.0
      \column {
       %{ \line {
          \bold "5."
          \column {
            "On whose dear arms, so widely flung,"
            "The weight of this world's ransom hung:"
            "The price of humankind to pay,"
            "And spoil the spoiler of his prey."
          }
        }
        \vspace #0.5
        \line {
          \bold "6."
          \column {
            "O Cross, our one reliance, hail!"
            "This holy Passiontide, avail"
            "To give fresh merit to the saint,"
            "And pardon to the penitent."
          }
        } 
        \vspace #0.5 %}
 %{       \line {
          \bold "7."
          \column {
            "To Thee, Eternal Three in One,"
            "Let homage meet by all be done:"
            "As by the Cross Thou dost restore,"
            "Preserve and govern evermore."
            "Amen."
          }
        }
      }
      \hspace #1.0

    }
  }
} %}
  \bottom
}




%{ verse 6 is found alternately thus in the English Hymnal, 1906:
"O Cross, our one reliance, hail!"
		"Still may thy power with us avail"
		"To give new virtue to the saint,"
		"And pardon to the penitent."
%}