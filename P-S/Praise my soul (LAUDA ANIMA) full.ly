\version "2.22.2"

\include "english.ly"
\include "hymn_definitions.ly"

refs = \markup {
  \fontsize #-3 {
    \left-column {
      \wordwrap {
        Text: Henry F. Lyte (1793-1847), 1834
      }
      \wordwrap {
        Music: LAUDA ANIMA  87 87 87, John Goss (1800-1880), 1869
      }
    }
  }
}

top = \markup {
  \fill-line {
    \column {
      \line {LAUDA ANIMA  87 87 87}
    }
    \right-column{
      \line {John Goss (1800-1880), 1869}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null 
    \right-column {
      \line {Henry F. Lyte (1793-1847), 1834}
    }
  } 
}

\header {
  tagline = ""
}

global = {
  \key d \major
  \time 2/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c'' {
  \global
  %verse 1
a4^\markup {\italic Unison} a |
a a|
d cs |
b2 |
a2 |
g4 fs |
b a |
fs g |
e2 |

fs4 fs |
fs fs |
b a |
a gs |
a b |
cs d |
fs, gs |
a2 |

d4 cs |
b a |
d cs |
b a |
b a |
g e |
d cs |
d2 \bar "||" \break

%verse 2
R2 |
R2 |
R2 |
R2 |
R2 |
R2 |
R2 |
R2 |
R2 |

R2 |
R2 |
R2 |
R2 |
R2 |
R2 |
R2 |
R2 |

R2 |
R2 |
R2 |
R2 |
R2 |
R2 |
R2 |
R2 | 

%verse 3
a'4^\markup {\italic Unison} a |
a a|
d cs |
b2 |
a2 |
g4 fs |
b a |
fs g |
e2 |

fs4 fs |
fs fs |
b a |
a gs |
a b |
cs d |
fs, gs |
a2 |

d4 cs |
b a |
d cs |
b a |
b a |
g e |
d cs |
d2 \bar "||" \break

%verse 4
R2 |
R2 |
R2 |
R2 |
R2 |
R2 |
R2 |
R2 |
R2 |

R2 |
R2 |
R2 |
R2 |
R2 |
R2 |
R2 |
R2 |

R2 |
R2 |
R2 |
R2 |
R2 |
R2 |
R2 |
R2 |  \bar "||" \break

%verse 5
a'4^\markup {\italic Unison} a |
a a|
d cs |
b2 |
a2 |
g4 fs |
b a |
fs g |
e2 |

fs4 fs |
fs fs |
b a |
a gs |
a b |
cs d |
fs, gs |
a2 |

d4 cs |
b a |
d cs |
b a |
b a |
g e |
d cs |
d2
\bar "|."
}

soprano = \relative c'' {
 <<{a2~ \tieDown a2~ \single \hide Stem a2}\\{s2 s2 \stemUp d4 cs }>> | 
 b2 | 
 a2 |
 g4 fs |
 <b, d b'> <cs a'> |
 <d fs> <b e g> | 
 <a cs e>2~ |
 <as cs fs>~ |
 fs'2 |
 b4 a | 
 <d, a'> <f gs> |
 a4 b |
 <e, cs'> d' |
 fs, gs a2 |
 
 d4( cs |
 b a) |
 d( cs |
 b a) |
 b4 a |
 <e g> e |
 d cs |
 d2
 
 %verse 2
 a'4^\markup {\italic Harmony} a |
a a|
d cs |
b2 |
a2 |
g4 fs |
b a |
fs g |
e2 |

fs4 fs |
fs fs |
b a |
a gs |
a b |
cs d |
fs, gs |
a2 |

d4 cs |
b a |
d cs |
b a |
b a |
g e |
d cs |
d2 \bar "||" \break

%verse 3
a'2~ |
a2 |
d4 cs |
b2 a |
<b, e g>4 <a ds fs> |
<b e~ b'> <c e~ a> |
<e fs> <b ds g> |
e2 |
<a, d fs>2 <as e' fs> |
<d b'>4 <ds a'~> |
a' gs |
<a, e' a> <d e~ b'> |
<cs e cs'> <d d'> |
fs gs | 
<<{a2~ \single \hide Stem a2 s2}

\\{s2 \stemUp \slurUp d4( cs b a)}>> |

d( cs |
b a) |
b a | 
<b, e g> <bf e> |
d cs d2

%verse 4
 a'4^\markup {\italic Harmony} a |
a a|
d cs |
b2 |
a2 |
g4 fs |
b a |
fs g |
e2 |

fs4 fs |
fs fs |
b a |
a gs |
a b |
cs d |
fs, gs |
a2 |

d4 cs |
b a |
d cs |
b a |
b a |
g e |
d cs |
d2

%verse 5
<d fs a>~ |
<cs fs a> |
d'4 cs |
b2 a2 |
<e g>4 <d fs> |
b' a |
<d, fs> <e g> |
<cs~ e>2 |
<as cs fs>~ |
<as fs'> |
<b b'>4 <cs a'~> |
<d a'> <b gs'> |
<a e'~ a>4 <e' b'> |
<e cs'> <d d'> |
fs gs a2 |

d4( cs |
<d, b'> <cs a'>) |
d'( cs |
b a) |
b a | 
<d, g> <b e> |
\tieDown <a~ d> <a~ cs> |
<a d>2
}

alto = \relative c' {
  \global
  %verse 1
  d2 |
  cs2 |
  <d a'~> |
  <d a'>4 <e g> |
  fs2 |
  d2~ |
  \stemUp d4 \stemDown s4
  s2 |
  s2 |
  s2 |
  b4 <as e'> |
  <b d>2~ |
  b2 |
  e2~ |
  \stemUp e4 d4~ |
  \stemDown d2 |
  cs2 
  
  d2 |
  <e g> |
  <d fs> |
  <cs g'> |
  <c ds fs> |
  b2 |
  a2~ |
  a2 |
  
  %verse 2
d4 d |
cs cs |
d a' |
a( g) |
fs2 |
d4 d |
d d |
d e |
cs2 |

cs4 e |
d cs |
b b |
d d |
cs e |
e d |
d d |
cs2 |

d4. d8 |
d4 cs |
d e8[ fs] |
g4 g |
fs e |
d b |
a a |
a2

%verse 3
fs'2~ |
fs~ |
fs~ |
fs4 <cs~ es> |
<cs fs> <b~ ds> |
\single \hide Stem b s4 |
s2 |
s4 \single \hide Stem b~ |
b4 <a~ cs> |
\single \hide Stem a2 |
s2 |
b2~ |
<b e~> |
\stemUp e4 \single \hide Stem d4 |
s4 d4~
\stemDown d2 cs |

<d a'>2 |
<e g> |
<d fs> |
e |
<c fs> |
s2 |
a2~ |
a

%verse 4
d4 d |
cs cs |
d a' |
a( g) |
fs2 |
d4 d |
d d |
d e |
cs2 |

cs4 e |
d cs |
b b |
d d |
cs e |
e d |
d d |
cs2 |

d4. d8 |
d4 cs |
d e8[ fs] |
g4 g |
fs e |
d b |
a a |
a2

%verse 5
s2 |
\once \stemUp fs'2~ |
<d fs>2~ |
<d fs>4 e8[~ <d e~>] |
<cs e>4 d |
s4 \single \hide Stem d4~ |
d2~ |
\single \hide Stem d4 s4 |
s2 |
s2 |
e4 cs |
s2 |
s2 |
s2 |
s2 |
d2 |
cs |
d2~ |
\single \hide Stem d4 s4 |
d2~ |
d4 g |
<d~ fs>2 |
\single \hide Stem d4 s4 |
s2 |
s2

}

tenor = \relative c {
  \global
  %verse 1
  <d fs a>2~ |
  <e g a>~ |
  <fs a> |
  <g b>4 <g cs> |
  <a d>2 |
  d,2 |
  g4 e |
  d e |
  a, g' |
  fs e |
  d cs |
  b f' |
  e d |
  <cs a'> <e gs> |
  a2 |
  <fs b>4~ b |
  <e, a> g! |
  fs2 |
  e |
  fs |
  g |
  <ds fs>2 |
  <e g>~ |
  <e g> |
  <d fs> |
  
  %verse 2
fs4 fs |
g g |
a a |
b( cs) |
d2 |
g,4 a |
g a |
b b |
a( g) |

fs4 e |
d e |
fs b |
b b |
a d |
cs a |
b b |
a2 |

a4. a8 |
g4 g |
fs e8[ d] |
e4 a |
d cs |
b g |
fs e8[ g] |
fs2

%verse 3
a2~ |
a2 |
gs2~ |
gs |
fs4 b, |
e fs |
g a~ |
a2 |
g |
fs |
fs |
fs |
e |
fs4 gs |
a2 |
b |
a4 g! |
fs2 |
cs |
d |
g |
fs |
g |
fs4 <e g> |
<a, d fs>2 |

%verse 4
fs'4 fs |
g g |
a a |
b( cs) |
d2 |
g,4 a |
g a |
b b |
a( g) |

fs4 e |
d e |
fs b |
b b |
a d |
cs a |
b b |
a2 |

a4. a8 |
g4 g |
fs e8[ d] |
e4 a |
d cs |
b g |
fs e8[ g] |
fs2

%verse 5
a2~ |
a~ |
a2~ |
a4 gs |
a2~ |
a |
g4 a |
b2 |
a |
fs2~ |
fs~ |
fs2~ |
fs4 e4~ |
e gs | 
a2 |
b |
a4 g8[ e] |

<d fs>2 |
<e g> |
<fs a> |
<g b>4 <e cs'> |
<d d'> cs' b g |
fs <e g> |
<a, d fs>2
}

bass = \relative c, {
  \global
  %verse1
  d2 |
  e |
  fs |
  g |
  d'4 cs |
  b a |
  g a |
  b e, |
  a g |
  fs e |
  d cs' |
  b f |
  e d |
  cs e |
  <<{\stemDown s2 d'4 e~ \single \hide Stem e s}\\{ a,4 fs'~ \stemUp fs s \stemDown a,2}>> 
  
 b2 | 
 cs |
 d | 
 e |
 fs, |
 g |
 a |
 d,
  
  %verse 2
d'4 d |
e e fs fs |
g2 |
d2 |
b4 d |
g fs |
b e, |
a,2 |

as4 as |
b cs |
d ds |
e es |
fs gs |
a fs |
d e |
a,2 |

fs'4. fs,8 |
g4 a |
b4. b8 |
cs4 cs |
d e8[ fs] |
g4 g, |
a a |
d2

%verse 3
d2 |
cs |
b |
cs |
fs,4 b |
e, fs |
g a |
c b |
e a, |
d2 |
cs |
b |
e, |
fs4 gs |
a fs' |
d e |
a,2~ |

a2~ |
a |
b |
cs |
ds |
e4 g, |
<<{\stemDown \tieDown a2~ \stemUp a2}\\{s2 d,2}>>

%verse 4
d'4 d |
e e fs fs |
g2 |
d2 |
b4 d |
g fs |
b e, |
a,2 |

as4 as |
b cs |
d ds |
e es |
fs gs |
a fs |
d e |
a,2 |

fs'4. fs,8 |
g4 a |
b4. b8 |
cs4 cs |
d e8[ fs] |
g4 g, |
a a |
d2

%verse 5
d2 |
fs |
b, |
e |
a,4 b |
cs d |
g, fs |
b e, |
a g |
fs as |
cs e |
d cs |
b e8[ d] |
cs4 e |
a fs |
d e |
a, g8[ e] |

d2~ |
d2~ |
d2~ |
d2~ |
d4 cs' |
b g |
<<{\stemDown \tieDown a2~ \stemUp a2}\\{s2 d,2}>>
}

verseOne = \lyricmode {
  \set stanza = "1. "
  Praise, my soul, the King of heav -- en,
  To his feet your trib -- ute bring;
  Ran -- somed, healed, re -- stored, for -- giv -- en,
  Who, like me, his praise should sing?
Praise him! Praise him! Praise him! Praise him!
  Praise the ev -- er -- last -- ing King.


  \set stanza = "3. "
Fa -- ther -- like, he tends and spares us;
Well our fee -- ble frame he knows;
in his hands he gent -- ly bears us, 
Res -- cues us from all our foes;
Praise him! Praise him! Praise him! Praise him!
Wide -- ly as his mer -- cy flows.

  
  \set stanza = "5. "
  An -- gels, help us to a -- dore him;
  Ye be -- hold him face to face;
  Sun and moon, bow down be -- fore him,
  Dwell -- ers all in time and space.
Praise him! Praise him! Praise him! Praise him!
  Praise with us the God of grace.
}

verseTwo = \lyricmode {
    _ _ _ _ _ _ _ _
  _ _ _ _ _ _ _
  _ _ _ _ _ _ _ _
  _ _ _ _ _ _ 
  
  \set stanza = "2."
Praise him for his grace and fa -- vor
To our fa -- thers in dis -- tress;
Praise him, still the same for ev -- er,
Slow to chide, and swift to bless;
Praise him! Praise him! Praise him! Praise him!
Glo --  rious in his faith -- ful -- ness.
  
    _ _ _ _ _ _ _ _
  _ _ _ _ _ _ _
  _ _ _ _ _ _ _ _
  _ _ _ _ _
  
    \set stanza = "4. "
Frail as sum -- mer's flow'r we flour -- ish,
Blows the wind and it is gone;
But while mor -- tals rise and per -- ish,
God en -- dures un -- chang -- ing on.
Praise him! Praise him! Praise him! Praise him!
Praise the High E -- ter -- nal One.

  _ _ _ _ _ _ _ _
  _ _ _ _ _ _ _
  _ _ _ _ _ _ _ _
  _ _ _ _ _ _ _
}

#(set-global-staff-size 20)
\book {
  \include "hymn_paper_multipage.ly"
  \header {
    tagline = ""
  }
  \top
  \score {
    <<
    \new Staff
      \new Voice = "chorus" { \melody }
            \new Lyrics  \lyricsto chorus \verseOne
    \new ChoirStaff <<
      \new Staff  <<
        \new Voice = "soprano" { \voiceOne \soprano }
        \new Voice = "alto" { \voiceTwo \alto }
        \new Lyrics  \lyricsto soprano \verseTwo
      >>
      \new Staff  <<
        \clef bass
        \new Voice = "tenor" { \voiceOne \tenor }
        \new Voice = "bass" { \voiceTwo \bass }
      >>
    >>
    >>
    \midi {
      \context {
        \Score
        tempoWholesPerMinute = #(ly:make-moment 100 4)
      }
    }
   \layout {
  indent = 0.0\cm
  ragged-right = ##f
  %ragged-last = ##t
  \context {
    \Score
    \remove "Bar_number_engraver"
  }
  \context {
    \Staff
    \remove "Time_signature_engraver"
  }
   \context { \Staff \RemoveEmptyStaves }
    
    }
}
  \refs
}

%%%%%%
%%%%%%
%%%%%%
#(set-global-staff-size 16)
#(define output-suffix "Hymnal")
\book {
  \include "lilypond-book-preamble.ly"
  \include "hymn_hymnal_paper.ly"
  \header {
    tagline = ""
  }
  \score {
    <<
    \new Staff
      \new Voice = "chorus" { \melody }
            \new Lyrics  \lyricsto chorus \verseOne
    \new ChoirStaff <<
      \new Staff  <<
        \new Voice = "soprano" { \voiceOne \soprano }
        \new Voice = "alto" { \voiceTwo \alto }
        \new Lyrics  \lyricsto soprano \verseTwo
      >>
      \new Staff  <<
        \clef bass
        \new Voice = "tenor" { \voiceOne \tenor }
        \new Voice = "bass" { \voiceTwo \bass }
      >>
    >>
    >>
    \layout {
  indent = 0.0\cm
  ragged-right = ##f
  ragged-last = ##f
  \context {
    \Score
    %**** Turns off bar numbering
    \remove "Bar_number_engraver"
  }
  \context {
    \Staff
    \remove "Time_signature_engraver"
    \RemoveEmptyStaves
  }
  \context {
    \Lyrics
    % **** Prevents lyrics from running too close together
    %\override LyricSpace #'minimum-distance = #1.2
    % **** Makes the text of lyrics a little smaller
    \override LyricText #'font-size = #0.2
    % **** Moves lines of lyrics closer together
   % \override VerticalAxisGroup #'minimum-Y-extent = #'(-1 . 1)
  }
}
  }    
  %{
\extraVerses
\markup {
  \vspace #0.5
}
  %}
  \refs
}