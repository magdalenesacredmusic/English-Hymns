\version "2.22.2"

\include "english.ly"
\include "hymn_definitions.ly"

refs = \markup {
  \fontsize #-3 {
    \left-column {
      \wordwrap {
        Text: Henry Williams Baker (1821-77), Edited "The New English Hymnal," 1986
      }
      \wordwrap {
        Music: BANGOR  CM, Ps. xii in \italic "Harmony of Sion," 1734, William Tans'ur (1706-83)
      }
    }
  }
}


\header {
  tagline = ""
}

global = {
  \key ef \major
  \time 4/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c'' {
  \global
  \partial 2
  g2 |
  ef4 d c g' |
  c bf8[ af] g4 g |
  g bf g fs |
  g2 \bar ""
  
  g2 |
  c4 b c ef8[ d] |
  c4 bf8[ af] g4 g |
  c g8[ f] ef4 d |
  c2 \bar "|."
}

alto = \relative c' {
  \global
  b2 |
  c4 b c ef |
  ef f ef f |
  ef d ef d8[ c] |
  b2
  
  d |
  c4 f ef ef |
  ef d ef ef |
  ef c c b |
  c2
}

tenor = \relative c {
  \global
  d2 |
  ef4 f g c |
  c c c d |
  c g c a |
  g2
  
  b |
  g4 f g bf |
  af8[ g] f[ bf] bf4 bf |
  c c c,8[ ef] g[ f] |
  ef2
}

bass = \relative c {
  \global
  g2 |
  c4 d ef c'8[ bf] |
  af[ g] f4 c b |
  c bf c d |
  g,2
  
  g'4( f) |
  ef d c g |
  af bf ef ef8[ d] |
  c[ bf] af4 g g |
  c2
}

verseOne = \lyricmode {
  \vOne
  Shall we not love thee, Moth -- er dear,
  Whom Je -- sus loves so well,
  And to his glo -- ry year by year
  Thy praise and hon -- or tell?
}

verseTwo = \lyricmode {
  \vTwo
  Thee did he choose from whom to take
  True flesh, his flesh to be;
  In it to suf -- fer for our sake,
  And by it make us free.
}

verseThree = \lyricmode {
  \vThree
  O won -- drous depth of love di -- vine,
  That he should bend so low;
  And, Ma -- ry, O what joy was thine
  The Sa -- vior's love to know.
}

verseFour = \lyricmode {
  \vFour
  Joy to be Moth -- er of the Lord,
  Yet thine the tru -- er bliss,
  In ev -- 'ry thought and deed and word
  To be for ev -- er his.
}

extraVerses =
    \markup {
    \vspace #1
  \fontsize #0.2 {
    \fill-line {
      \hspace #0.1 % moves the column off the left margin;
      % can be removed if space on the page is tight
      \column {
        \line {
          \bold "5. "
          \column {
            "Now in the realm of life above"
            "  Close to thy Son thou art,"
            "While on thy soul glad streams of love"
            "  Flow from his sacred heart."
          }
        }
    \vspace #1
        \line {
          \bold "6. "
          \column {
            "Jesus, the Virgin's holy Son,"
            "  Praise we thy Mother blest;"
            "Grant when our earthly course is run,"
            "  Life with the saints at rest."
          }
        }
      }
      \hspace #0.1 % gives some extra space on the right margin;
      % can be removed if page space is tight
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
