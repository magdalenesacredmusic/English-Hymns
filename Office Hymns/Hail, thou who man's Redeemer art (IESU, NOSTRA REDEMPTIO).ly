\version "2.18.2"
\include "english.ly"
\include "hymn_definitions.ly"

top = \markup {
  \tiny {
  \fill-line {
    \column {
      \line {IESU, NOSTRA REDEMPTIO, LM}
    }
    \right-column{
      \line {Gregorian, Mode IV}
      \line {Harm. Peter Wagner (1865-1931)}
    }
  }
  }
}

bottom = \markup  {
  \tiny {
  \fill-line {
    \null
    \right-column {
      \line {\italic "Iesu, nostra redemptio"}
      \line {Tr. Thomas J. Potter (1828-1873)}
    }
  }
  }
}

\header {
  tagline = ""
}

global = {
  \key d \major
  \cadenzaOn
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c'' {
  \global
  g8 fs[^- g\prall a b] a g[ e] g fs[ g a] g fs4 \hb
  a8 b[ d] b a[ g] a \bar "" \break a g fs4( e) \bar "|"
  d8[ e] e e[ d] e g[ fs] e[ fs] fs fs4 \hb
  a8 a[ b] a g[ e] g fs[ g a] g fs4 \bar "||"
  
  fs8[ g fs] e4( fs) \bar "||"
}

alto = \relative c' {
  \global
  d2. b4 d2~ d4.
  fs8 g4. fs8[ e] fs e4 b2
  b4. a4 b4. cs4. d4
  d2 b4. d2~ d4
  
  d4. cs2
}

tenor = \relative c' {
  \global
  b8 a4 fs~ fs8 g4 b8 a8[ g fs] b a4
  d8 b4. d b4 a g
  g4. fs4 g4. a4.~ a4
  fs2 g4. b2
  a4
  
  a8[ b a]~ a2
}

bass = \relative c' {
  \global
 g8 d2~ d8 e4 d2~ d4. 
 d2~ d4. e2. 
 g4. fs4 e4. a,4. d4
 d2 e4. b2 d4
 
 d4. a4 fs
}

verseOne = \lyricmode {
  \vOne
  Hail, thou who man's Re -- deem -- er art,
  Je -- sus, the joy of ev' -- ry heart;
  Great Mak -- er of the world's wide frame,
  And pur -- est love's de -- light and flame.
}

verseTwo = \lyricmode {
  \vTwo
  What name -- less mer -- cy thee o'er -- came,
  To bear our load of sin and shame?
  For guilt -- less, thou thy life didst give,
  That sin -- ful, err -- ing man might live.
}

verseThree = \lyricmode {
  \vThree
  The reams of woe are forced by thee,
  Its cap -- tives from their chains set free;
  And thou, a -- mid the ran -- somed train,
  At God's right hand dost vic -- tor reign.
}

verseFour = \lyricmode {
  \vFour
  Let mer -- cy sweet with thee pre -- vail,
  To cure the wounds we now be -- wail;
  Oh, bless us with thy ho -- ly sight, 
  And fill us with e -- ter -- nal light.
}

verseFive = \lyricmode {
  \vFive
  Be thou our joy and thou our guard,
  Who art to be our great re -- ward;
  Our glo -- ry and our boast in thee
  For ev -- er and for ev -- er be.
  
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
    %\transpose c bf,
    <<
      \new Voice = "tune" {
        \melody
      }
      \new Lyrics \lyricsto "tune" { \verseOne }
      \new Lyrics \lyricsto "tune" { \verseTwo }
      \new Lyrics \lyricsto "tune" { \verseThree }
      \new Lyrics \lyricsto "tune" { \verseFour}
      \new Lyrics \lyricsto "tune" { \verseFive }
    >>
    \include "hymn_layout.ly"
  }
  \markup {
    \vspace #0.5
  }
  \bottom
}
