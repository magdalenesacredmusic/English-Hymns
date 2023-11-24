\version "2.22.2"

\include "english.ly"
\include "hymn_definitions.ly"

refs = \markup {
  \fontsize #-3 {
    \left-column {
      \wordwrap {
        Text: \italic "Pange lingua, gloriosi/ Corporis mysterium," Thomas Aquinas (1225-74); Tr. Edward Caswall (1814-78), \italic "Lyra Catholica"
      }
      \wordwrap {
        Music: Mode 3 Plainsong 87 87 87, \italic "Graduale Romanum"
      }
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
   c4( d) c c \bar "" \break  b a c b( a g2) \bar "|"
   g4 a c b a g a g2 \bar "'"
   a4 b g g e a a2( d,) \bar "|"
   e4 g g e \bar "" \break g a a g2 \bar "'"
   a4 b g a( g) f( e) d e2 \bar "||" \break
   
  % e4( f e) d2( e) \bar "|."
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
  \vOneL
  Sing, my tongue, the Sa -- viour's glo -- ry,
  Of His Flesh the mys -- t'ry sing;
  Of the Blood, all price ex -- ceed -- ing,
  Shed by our im -- mor -- tal King,
  Des -- tined, for the world's re -- demp -- tion,
  From a no -- ble womb to spring.
}

verseTwo = \lyricmode {
  \vTwoL
  Of a pure and spot -- less Vir -- gin
  Born for us on earth be -- low,
  He, as Man with man con -- ver -- sing,
  Stay'd, the seeds of truth to sow;
  Then He closed in so -- lemn or -- der
  Won -- drous -- ly His life of woe.
}

verseThree = \lyricmode {
  \vThreeL
  On the night of that Last Sup -- per,
  Seat -- ed with His cho -- sen band,
  He the Pas -- chal vic -- tim eat -- ing,
  Firt ful -- fulls the Law's com -- mand;	Then, as Food to all His breth -- ren
  Gives Him -- self with His own hand.
}

verseFour = \lyricmode {
  \vFourL
  Word made Flesh, the bread of na -- ture
  By His word to Flesh He turns;
  Wine in -- to His Blood He chang -- es:
  What though sense no change dis -- cerns?
  On -- ly be the heart in earn -- est,
  Faith her les -- son quick -- ly learns.
  
  \set stanza = "6."
  A -- men.
}


verseFive = \lyricmode {
  \vFive
  Down in a -- dor -- a -- tion fal -- ling,
  Lo! the sa -- cred Host we hail;
  Lo! o'er an -- cient forms de -- part -- ing,
  New -- er rites of grace pre -- vail;
  Faith, for all de -- fects sup -- ply -- ing,
  Where the fee -- ble sens -- es fail.
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

extraVerses =
 \markup {
  \fontsize #0.2 {
    \fill-line {
      \hspace #1.0
      \column {
        \line {
          \bold "5. "
          \column {
            "Down in adoration falling,"
  "Lo! the sacred Host we hail;"
  "Lo! o'er ancient forms departing,"
  "Newer rites of grace prevail;"
  "Faith, for all defects supplying,"
  "Where the feeble senses fail."
          }
        }
        \vspace #1
        \line {
          \bold "6. "
          \column {
            "To the Everlasting Father,"
  "And the Son who reigns on high,"
  "With the Holy Ghost proceeding"
  "Forth from Each eternally,"
  "Be salvation, honor, blessing,"
  "Might, and endless majesty."
          }
        }
      }
      \hspace #1.0

    }
  }
}

#(set-global-staff-size 20)
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
        tempoWholesPerMinute = #(ly:make-moment 80 4)
      }
    }
    \include "hymn_layout.ly"
  }
  
\extraVerses
\markup {
  \vspace #0.5
}
  %}
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
  %\top
  \score { %\transpose c d
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
    \include "hymn_hymnal_layout.ly"
  }    
  
\extraVerses
\markup {
  \vspace #0.5
}
  %}
  \refs
}
%%%%%%
%%%%%%
%%%%%%
#(define output-suffix "Melody")
\book {
  \include "lilypond-book-preamble.ly"
  \include "hymn_melody_paper.ly"
  %  \top
  \score {
    %\transpose c bf,
    <<
      \new Voice = "tune" {
        \melody
      }
      \new Lyrics \with {
        \override VerticalAxisGroup.
        nonstaff-relatedstaff-spacing.padding = #1.5 } \lyricsto "tune" { \verseOne }
      \new Lyrics \lyricsto "tune" { \verseTwo }
      \new Lyrics \lyricsto "tune" { \verseThree }
      \new Lyrics \lyricsto "tune" { \verseFour }
      % \new Lyrics \lyricsto "tune" { \verseFive}
    >>
    \include "hymn_layout.ly"
  }
  \markup { 
    \vspace #0.5 
  }
  
\extraVerses
\markup {
  \vspace #0.5
}
  %}
  \refs
}
