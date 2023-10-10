\version "2.22.2"
\include "english.ly"
\include "hymn_definitions.ly"

refs = \markup {
  \fontsize #-3 {
    \left-column {
      \wordwrap {
        Text: \italic "Yesu, Bin Mariamu," Swahili; Tr. Edmund S. Palmer (1856-1931)
      }
      \wordwrap {
        Music: CORPUS DOMINI 65 65 D, G.E.W. Malet (1839-1918)
      }
    }
  }
}

top = \markup {
  \fill-line {
    \column {
      \line {CORPUS DOMINI  65 65 D}
    }
    \right-column{
      \line {G.E.W. Malet (1839-1918)}
      \line {}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null
    \right-column {
      \line {\italic "Yesu, Bin Mariamu"}
      \line {Swahili; Tr. Edmund S. Palmer (1856-1931)}
    }
  }
}

\header {
  tagline = ""
}

global = {
  \key bf \major
  \time 4/2
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c'' {
  \global
  g4. g8 g4 g g2 g |
  g4. fs8 e4 fs g1 | \break
  bf4. bf8 bf4 bf bf2 bf |
  bf4. a8 g4 a bf1 | \break
  d4. d8 d4 d c2 c |
  bf4. bf8 c4 g bf2( a) |
  g4. g8 g4 g g2 g |
  g4. fs8 e4 fs g1  \bar "|."
}

alto = \relative c' {
  \global
  bf4. c8 d4 bf ef2 c |
  d4. d8 c4 c bf1 |
  d4. d8 d4 e f2 f |
  ef4. ef8 ef4 ef d1 |
  f4. ef8 f4 g g( f) f( d) |
  d4. d8 ef4 c d2.( c4) |
  bf4. c8 d4 bf ef2 c |
  d4. d8 d4 c bf1 
}

tenor = \relative c' {
  \global
  g4. g8 g4 g g2. a4 |
  bf4. a8 g4 a g1 |
  bf4. bf8 bf4 c d2 d |
  c4. c8 bf4 c bf1 |
  bf4. bf8 bf4 bf bf4( a) a2 |
  bf4. bf8 a4 g g( e fs2) |
  g4. g8 g4 g4 g2 g4( a) |
  bf4. a8 g4 a g1
}

bass = \relative c {
  \global
 g4. a8 bf4 g c2 ef |
 d4. d8 d4 d g,1 |
 g'4. g8 g4 g f2 f |
 f4. f8 f4 f bf,1 |
 bf4. c8 d4 ef f2 f4( fs) |
 g4. g8 c,4 ef d1 |
 g,4. a8 bf4 g c2 ef |
 d4. d8 d4 d g,1
}

verseOne = \lyricmode {
  \vOne
Je -- sus, Son of Ma -- ry,
Fount of life a -- lone,
Here we hail thee pres -- ent
On thine al -- tar -- throne.
Hum -- bly we a -- dore thee,
Lord of end -- less might,
In the mys -- tic sym -- bols
Veiled from earth -- ly sight.
}

verseTwo = \lyricmode {
  \vTwo
Think, O Lord, in mer -- cy
On the souls of those
Who, in faith gone from us,
Now in death re -- pose.
Here 'mid stress and con -- flict
Toils can nev -- er cease;
There, the war -- fare end -- ed, 
Bid them rest in peace.
}

verseThree = \lyricmode {
  \vThree
Of -- ten were they wound -- ed
In the dead -- ly strife;
Heal them, Good Phy -- si -- cian,
With the balm of life.
Ev -- 'ry taint of e -- vil,
Frail -- ty and de -- cay,
Good and gra -- cious Sa -- vior,
Cleanse and purge a -- way.
}

verseFour = \lyricmode {
  \vFour
Rest e -- ter -- nal grant them,
Af -- ter wea -- ry fight;
Shed on them the ra -- diance
Of thy heav'n -- ly light.
Lead them on -- ward, up -- ward,
To the ho -- ly place,
Where thy saints made per -- fect
Gaze up -- on thy face.
}

#(set-global-staff-size 20)
\book {
  \include "hymn_paper.ly"
  \header {
    tagline = ""
  }
  % \top
  \score { %\transpose c bf,
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
        tempoWholesPerMinute = #(ly:make-moment 80 4)
      }
    }
    \include "hymn_layout.ly"
  }
  % \bottom
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
  \score { %\transpose c bf,
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
        tempoWholesPerMinute = #(ly:make-moment 96 4)
      }
    }
    \include "hymn_hymnal_layout.ly"
  }    
  \refs
  %\bottom
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
    >>
    \include "hymn_layout.ly"
  }
  \markup { 
    \vspace #0.5 
  }
  % \bottom
  \refs
}