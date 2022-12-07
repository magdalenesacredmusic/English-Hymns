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
      \line {Mode 3 Plainsong 87 87 87}
    }
    \right-column{
      \line {\italic "Graduale Romanum"}
      %\line {harm. }
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null 
    \right-column {
      \line {\italic "Pange, lingua, gloriosi/ Proelium certaminis"}
      \line {Fortunatus; vs. 1-4 tr. Percy Dearmer; vs. 6-10 tr. J.M. Neale}
    }
  } 
}

\header {
  tagline = ""
}

global = {
  \key c \major
  \cadenzaOn
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
  \global
   e8 e f e[ d] g g a[ c] c4 \bar "'"
   c8[ d] c c b a c b([ a] g4) \bar "|" %\break
   g8 a c b a g a g4 \bar "'" %\nobBreak
   a8 b g g e a a4( d,) \bar "|" %\break
   e8 g g e g a a g4 \bar "'"
   a8 b g a[ g] f[ e] d e4 \bar "||" %\break
   
   e8[ f e] d4( e) \bar "|."
}

melodya = \relative c' {
  \global
   \override Stem #'length = #0
   e4 e f e( d) g g a( c) c2 \bar "'"
   c4( d) c c \bar "" %\break  
   b a c b( a g2) \bar "|"
   g4 a c b a g a g2 \bar "'"
   a4 b g g e a a2( d,) \bar "|"
   e4 g g e \bar "" %\break 
   g a a g2 \bar "'"
   a4 b g a( g) f( e) d e2 \bar "||" %\break
   
   e4( f e) d2( e) \bar "|."
}

alto = \relative c' {
  \global
 c4. e8[ d] c4 f e
 e4. g4 f d2
 e4 g e~ e4.
 f4 e c d2
 c2~ c8~ c4 d4
 f4 e8~ e4 d4. b4
 
 c4. a4 c4
}

tenor = \relative c' {
 \global 
 a4.~ a4 g a~ a
 c4.~ c4 c8[ a] g8[ a] b4
 c4 c b c4.
 d4 b a f2
 g8 e4 g8 e8~ e4 g
 d'4 b8 c8[ b] a[ g f] g4
 
 g4. f4 a
}

bass = \relative c {
  \global 
 a4. f'4 e d a4
 a'4. e4 f g2
 c,4 e~ e c4.
 d4 e a, d2
 c2~ c8 a4 b
 d e8 c4 d4. e4
 
 c4. d4 a
}

%{ alto = \relative c' {
  \global
  c4. b4 d d e
  g4. a8 g f4 d4~ d
  d8 e4~ e e4 d
  fs4 e8 d b c c4 a4
  c2 c8 c4 c4
  c8 d e e4 d4. b4
  
  c4. a4 c
}

tenor = \relative c' {
  \global
  a4. g4 b f4 g4
  e4. e4 c4 d8[ c] b4
  b'8 c e d c b c b4
  d4 b a e f
  g8 e4 g8[ e] e4 e4
  e8 g b c4 a8[ g f] g4
  
  g4. a4 e
}

bass = \relative c {
  \global
  a4. e'4 g4 d c
  c4. a4 f4 g4~ g4
  b'8 a4~ a e8 a b4
  d,4 e a, a d
  c2 c8 a4 c4
  a8 g e' c4 d4. e4
  
  c4. d4 a
}
%}


verseOne = \lyricmode {
  \vOne
  Sing, my tongue, the glo -- rious bat -- tle,
  Sing the end -- ing of the fray;
  Now a -- bove the Cross, the tro --  phy,
  Sound the loud tri -- um -- phant lay:
  Tell how Christ, the world's Re -- deem -- er,
  As a Vic -- tim won the day.
}

verseTwo = \lyricmode {
  \vTwo
  God in pit -- y saw man fal -- len,
  Shamed and sunk in mis -- er -- y,
  When he fell on death by tast -- ing
  Fruit of the for -- bid -- den tree;
  Then an -- oth -- er tree was cho -- sen
  Which the world from death should free.
}

verseThree = \lyricmode {
  \vThree
  Thus the scheme of our sal -- va -- tion
  Was of old in or -- der laid,
  That the man -- i -- fold de -- ceiv -- er's
  Art by art might be out -- weighed,
  And the lure the foe put for -- ward
  In -- to means of heal -- ing made.
}

verseFour = \lyricmode {
  \vFour
  There -- fore when the_ap -- point -- ed full -- ness
  Of the ho -- ly time was come,
  He was sent who mak -- eth all things
  Forth from God's e -- ter -- nal home;
  Thus he came to earth, in -- car -- nate,
  Off -- spring of a mai -- den's womb.
  
 %\set stanza = "6." A -- men.
}


verseFive = \lyricmode {
  \vFive
  Thir -- ty years a -- mong us dwel -- ling,
  His ap -- point -- ed time ful -- filled,
  Born for this, He meets His Pas -- sion,
  For that this He free -- ly willed,
  On the Cross the Lamb is lift -- ed
  Where his life -- blood shall be spilled.
}


verseSix = \lyricmode {
  \vSix
  To the Ev -- er -- last -- ing Fa -- ther,
  And the Son who reigns on high,
  With the Ho -- ly Ghost pro -- ceed -- ing
  Forth from Each e -- ter -- nal -- ly,
  Be sal -- va -- tion, ho -- nor, bles -- sing,
  Might, and end -- less ma -- jes -- ty.
  
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
      %\new Lyrics \lyricsto soprano \verseFive
      %\new Lyrics \lyricsto soprano \verseSix
      \new Staff  <<
        \clef bass
        \new Voice = "tenor" { \voiceOne \tenor }
        \new Voice = "bass" { \voiceTwo \bass }
      >>
    >>
    \midi {
      \context {
        \Score
        tempoWholesPerMinute = #(ly:make-moment 72 4)
      }
    }
    \include "hymn_layout_ragged.ly"
  }
    \markup {
    \vspace #0.5
  }
     \markup {
	\large {
  \fill-line {
    \hspace #0.1 % moves the column off the left margin;
        % can be removed if space on the page is tight
     \column {
      \line { \bold "5. "
		\column {
		  "Thirty years among us dwelling,"
 " His appointed time fulfilled,"
  "Born for this, He meets His Passion,"
  "For that this He freely willed,"
  "On the Cross the Lamb is lifted"
  "Where his life blood shall be spilled."
        }
     	}
    }
    \hspace #0.1  % adds horizontal spacing between columns;
        % if they are still too close, add more " " pairs
        % until the result looks good
     \column {
      \line { \bold "6. "
		\column {
		  "To the Trinity be glory"
            "  Everlasting, as is meet;"
            "Equal to the Father, equal"
            "  To the Son, and Paraclete:"
            "Trinal Unity, whose praises"
            "  All created things repeat."

        }
      	}
    }
  \hspace #0.1 % gives some extra space on the right margin;
      % can be removed if page space is tight
  }
}
}
   \markup {
    \vspace #0.5 }
  \bottom
}

%%%%%%
%%%%%%
%%%%%%
#(define output-suffix "Melody")
\book {
  \include "lilypond-book-preamble.ly"
  \include "hymn_melody_paper_wide.ly"
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
      \new Lyrics \lyricsto "tune" { \verseFive}
      \new Lyrics \lyricsto "tune" { \verseSix}
    >>
    \include "hymn_layout_ragged.ly"
  }
 %{  \markup {
    \vspace #0.5
	\large {
  \fill-line {
    \hspace #0.1 % moves the column off the left margin;
        % can be removed if space on the page is tight
     \column {
      \line { \bold "5. "
		\column {
		  "Thirty years among us dwelling,"
 " His appointed time fulfilled,"
  "Born for this, He meets His Passion,"
  "For that this He freely willed,"
  "On the Cross the Lamb is lifted"
  "Where his life blood shall be spilled."
        }
     	}
    }
    \hspace #0.1  % adds horizontal spacing between columns;
        % if they are still too close, add more " " pairs
        % until the result looks good
     \column {
      \line { \bold "6. "
		\column {
		  "To the Trinity be glory"
            "  Everlasting, as is meet;"
            "Equal to the Father, equal"
            "  To the Son, and Paraclete:"
            "Trinal Unity, whose praises"
            "  All created things repeat."

        }
      	}
    }
  \hspace #0.1 % gives some extra space on the right margin;
      % can be removed if page space is tight
  }
}
} %}
  \markup { 
    \vspace #0.5 
  }
  \bottom
}


