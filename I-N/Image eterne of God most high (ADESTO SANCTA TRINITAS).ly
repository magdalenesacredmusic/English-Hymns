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
          \line {ADESTO SANCTA TRINITAS LM}
      }
      \right-column{
      \line {Chartes Church Melody}
      \line {harm. R. Vaughan Williams, 1906}
      }
}
}

bottom = \markup  {
 \fill-line {
   \null 
   \right-column {
     \line { \italic "Aeterna imago Altissimi"}
     \line {Vittorio Genovesi, S.J., 1925} 
     \line {Tr. Hugh T. Henry, 1926.}
   }
  } 
}

\header {
  tagline = ""
}

global = {
  \key g \major
  \time 3/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c'' {
  \global
  \partial 4
  g4^\markup { \italic "To be sung in unison." } |
  g2 d4 |
  g2 g4 |
  a2 a4 |
  g2 \bar ""

  g4 |
  c2 c4 |
  b2 b4 |
  a2 g4 |
  d'2 \bar "" \break 

  d4 |
  d2 a4 |
  c2 b4 |
  a2 g4 |
  d2 \bar ""

  g4 |
  a2 b4 |
  g2 c4 |
  b2 a4 |
  g2 \bar "||" \break
  
  \cadenzaOn
  g4( a g fs) \bar "|"
  g1 \bar "|."
}

alto = \relative c' {
  \global
  \partial 4
  <b d>4 |
  <b d>2 b4 |
  b2 <b e>4 |
  <d fs>2 <d fs>4 |
  <b d>2

  <b d>4 |
  <e g>2 <e g>4 |
  <d g>2 <d g>4 |
  <d fs>2 g4 |
  <fs a>2

  <g b>4 |
  <f a>2 <c f>4 |
  <e g>2 <d g>4 |
  <c e>2 e4 |
  a,2

  e'4 |
  <d fs>2 <d fs>4 |
  e2 <e g>4 |
  <d g>2 <d fs>4 |
  <b d>2
  
  %amen
  <b e>4 <c e> <b d> <a d>
  <b d>1
}

tenor = \relative c {
  \global
  \partial 4
  s4 |
  s2 fs4 |
  g2 s4 |
  s2. |
  s2

  s4 |
  s2. |
  s2. |
  s2 b4 |
  d2

  s4 |
  s2. |
  s2. |
  s2 b4 |
  s2

  b4 |
  s2 b4 |
  b2 s4 |
  s2. |
  s2
}

bass = \relative c {
  \global
  \partial 4
  g4 |
  g2 b4 |
  e2 e4 |
  d2 d4 |
  g2

  g4 |
  c,2 c4 |
  g'2 g4 |
  d2 e4 |
  d2

  g4 |
  d2 f4 |
  c2 g4 |
  a2 e'4 |
  d2

  e4 |
  d2 b4 |
  e2 c4 |
  g'2 d4 |
  <g, g'>2
  
  e'4 a, b d 
  g1
}


verseOne = \lyricmode {
  \set stanza = "1."
  Im -- age e -- terne of God most high,
Thou Light of Light, true God, to thee,
Re -- deem -- er, laud and glo -- ry be,
And king -- ly reign o’er earth and sky.
}

verseTwo = \lyricmode {
  \set stanza = "2."
For thou a -- lone, ere time be -- gan,
Its hope and cent -- ral -- point to be—
The Fath -- er just -- ly grant -- ed thee
To rule each na -- tion, tribe or clan.
}

verseThree = \lyricmode {
  \set stanza = "3."
O flow -- er of a Vir -- gin -- birth
O head of all on earth who dwell,
O stone that from the moun -- tain fell
And with its vast -- ness cov -- ered earth!
}

verseFour = \lyricmode {
  \set stanza = "4."
The race of men, con -- demned to lie
Be -- neath the dire -- ful tyr -- ant’s yoke,
By thee at length the shack -- les broke
And claimed the Fa -- ther -- land on high.

\set stanza = "7."
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
      \new Staff  <<
        \clef bass
        \new Voice = "tenor" { \voiceOne \tenor }
        \new Voice = "bass" { \voiceTwo \bass }
      >>
    >>
    \midi {
      \context {
        \Score
        tempoWholesPerMinute = #(ly:make-moment 112 4)
      }
    }
    \include "hymn_layout_ragged.ly"
  }
    \markup {
    \vspace #1
  \large {
    \fill-line {
      \hspace #0.1 % moves the column off the left margin;
      % can be removed if space on the page is tight
      \column {
        \line {
          \bold "5. "
          \column {
            "Lawgiver, priest and teacher, God—"
"With these the title well accords"
"Of 'King of kings and Lord of lords'"
"Upon thy vesture writ in blood."
          }
        }
    \vspace #1
        \line {
          \bold "6. "
          \column {
            "With grateful hearts thy rule we bless"
"Who justly reignest over all:"
"Them only truest joys befall"
"Who thee as king and lord confess."
          }
        }
            \vspace #1
        \line {
          \bold "7. "
          \column {
            "To thee, O Jesus, ruling o’er"
"Earth’s rulers all, be glory meet,"
"With Father and the Paraclete,"
"Throughout the ages evermore!  Amen."
          }
        }
      }
      \hspace #0.1 % gives some extra space on the right margin;
      % can be removed if page space is tight
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
        \melody
      }
      \new Lyrics \lyricsto "tune" { \verseOne }
      \new Lyrics \lyricsto "tune" { \verseTwo }
      \new Lyrics \lyricsto "tune" { \verseThree }
      \new Lyrics \lyricsto "tune" { \verseFour }
    >>
    \include "hymn_layout.ly"
  }
  \markup { 
    \vspace #0.5 
  }
      \markup {
    \vspace #1
  \large {
    \fill-line {
      \hspace #0.1 % moves the column off the left margin;
      % can be removed if space on the page is tight
      \column {
        \line {
          \bold "5. "
          \column {
            "Lawgiver, priest and teacher, God—"
"With these the title well accords"
"Of 'King of kings and Lord of lords'"
"Upon thy vesture writ in blood."
          }
        }
    \vspace #1
        \line {
          \bold "6. "
          \column {
            "With grateful hearts thy rule we bless"
"Who justly reignest over all:"
"Them only truest joys befall"
"Who thee as king and lord confess."
          }
        }
            \vspace #1
        \line {
          \bold "7. "
          \column {
            "To thee, O Jesus, ruling o’er"
"Earth’s rulers all, be glory meet,"
"With Father and the Paraclete,"
"Throughout the ages evermore!  Amen."
          }
        }
      }
      \hspace #0.1 % gives some extra space on the right margin;
      % can be removed if page space is tight
    }
  }
}
  \bottom
}


