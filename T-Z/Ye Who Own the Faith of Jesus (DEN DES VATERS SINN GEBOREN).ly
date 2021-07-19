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
      \line {DEN DES VATERS} 
      \line {SINN GEBOREN  87 87 87 6}
    }
    \right-column{
      \line {J.A. Freylinghausen1694}
      \line {harm. C. Kocher, 1855}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null 
    \right-column {
      \line {V.S.S. Coles, 1906}
    }
  } 
}

\header {
  tagline = ""
}


global = {
  \key d \major
  \time 4/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
  \global
  d4 e fs g |
  a a fs d |
  b' a g fs |
  e4. e8 d2 \bar "||" \break

  fs4 e8[ d] e4 a |
  b cs8[ d] cs4 a |
  d cs b a |
  a4. gs8 a2 \bar "||" \break

  b4 a8[ g] fs4 g |
  a g8[ fs] e4 e |
  d e fs g | \break
  a b a2 \bar "||"

  g4( a) fs g |
  fs e d2 \bar "|."
}

alto = \relative c' {
  \global
  d4 cs d d |
  e cs d d |
  d d d8[ e] d4 |
  d cs d2 |

  d4. d8 d4 cs |
  fs e e e |
  fs e d e |
  fs e e2 |

  g4 e d d |
  d d d cs |
  d cs d d |
  e e cs2 |

  e2 d4 d |
  d cs d2
}

tenor = \relative c {
  \global
  fs4 a a b |
  a a a fs |
  g a b a |
  a a fs2 |

  a4 gs a a |
  a gs a a |
  a a gs a |
  d b cs2 |

  d4 cs d b |
  a b e, a |
  fs a a b |
  a gs a2 |

  b4( a) a b |
  a a fs2
}

bass = \relative c {
  \global
  d4 a d b |
  cs a d d |
  g fs b,8[ cs] d4 |
  a' a, d2 |

  d4 b a fs' |
  d e a, cs |
  d a b cs |
  d e a,2 |

  g4 a b g |
  fs g a a |
  b a d b |
  cs e a,2 |

  e'4( cs) d g, |
  a a d2
}

verseOne = \lyricmode {
  \set stanza = "1."
  Ye who own the faith of Je -- sus
  Sing the won -- ders that were done,
  When the love of God the Fa -- ther
  O'er our sin the vic -- t'ry won,
  When he made the Vir -- gin Ma -- ry
  Moth -- er of his  on -- ly Son.


}

verseTwo = \lyricmode {
  \set stanza = "2."
  Bless -- èd were the cho -- sen peo -- ple
  Out of whom the Lord did come,
  Bless -- èd was teh land of pro -- mise
  Fash -- ioned for his earth -- ly home;
  But more bless -- èd far the Moth -- er
  She who bare him in her womb.
}

verseThree = \lyricmode {
  \set stanza = "3."
  Where -- fore let all faith -- ful peo -- ple
  Tell the ho -- nour of her name,
  Let the Church in her fore -- shad -- owed
  Part in her thanks -- giv -- ing claim;
  What Christ's Moth -- er sang in glad -- ness
  Let Christ's peo -- ple sing the same.

  \override LyricText.font-shape = #'italic
  Hail Ma -- ry, full of grace.
}

verseFour = \lyricmode {
  \set stanza = "4."
  Let us weave our sup -- pli -- ca -- tions,
  She with us and we with her,
  For the_ad -- vance -- ment of the faith -- ful,
  For each faith -- ful wor -- ship -- per,
  For the doubt -- ing, for the sin -- ful,
  For each heed -- less wan -- der -- er.
}

verseFive = \lyricmode {
  \set stanza = "5."
  Praise, O Ma -- ry, praise the Fa -- ther,
  Praise thy Sa -- viour and thy Son,
  Praise the ev -- er -- last -- ing Spir -- itm
  Who hath made thee ark and Throne
  O'er all crea -- tures high ex -- alt -- ed,
  Low -- ly praise the Three in One.
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
        tempoWholesPerMinute = #(ly:make-moment 100 4)
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

%{
Vs. 5 was originally verse 7. The original vs. 5 and 6 were as follows:

5. May the Mother's intercessions
On our homes a blessing win,
That the children all be prospered,
Strong and fair and pure within,
Following our Lord's own footsteps,
Firm in faith and free from sin.

6. For the sick and for the agèd,
For our dear ones far away,
For the hearts that mourn in secret,
All who need our prayers to-day,
For the faithful gone before us,
May the holy Virgin pray.
%}