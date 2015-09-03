%{
The music and poetry produced by this source code are believed to be in the public domain in the United States.
The source code itself is licensed under a Creative Commons Attribution-NonCommercial 4.0 International License:
http://creativecommons.org/licenses/by-nc/4.0/

Musicam Ecclesiae - sites.google.com/site/musicamecclesiae
%}

\version  "2.18.0-1"
\include "english.ly"
\include "hymnstyle.ly"

\header {
  poet = \markup{ \fontsize #4 \smallCaps "From East to West, From Shore to Shore"  }
  meter = \markup { \small { Music: ST. VENANTIUS, L.M.; \italic "Rouen Church Melody," \italic "The English Hymnal," 1906 } }
  piece = \markup { \small {Text: \italic "A solis ortus cardine," c. 450; tr. John Ellerton, 1871 }}
  %breakbefore
  %copyright = ""
  tagline = ""
}

global = {
  \key f \major
  \time 3/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
  \global
  \partial 4
  f4^\markup {\italic "To be sung in unison."} |
  a( c) bf |
  a( g) a |
  f2 g4 |
  a2 \bar "||"

  c4 |
  d( c) bf |
  a( bf) c |
  c( bf) a |
  g2 \bar "||"

  g4 |
  bf( a) g |
  f( d) e |
  f( e4.) d8 |
  c2 \bar "||"

  g'4 |
  a( f) bf |
  a( g) <a, f'> |
  e'2 f4 |
  f2 \bar "|."
}

alto = \relative c' {
  \global
  \partial 4
  c4 |
  f2 <d f>4 |
  <c~ f> <c e>2 |
  <a d> <c e>4 |
  <c f>2

  <f a>4 |
  <f bf> <e g~> <d g> |
  <d f>2 <e g>4 |
  <c f> <d f>2 |
  <bf d>2

  <c e>4 |
  <d~ f>2 <bf d~>4 |
  <a d> s s |
  s s4. s8 |
  s2

  <c~ e>4 |
  <c e> d2 |
  <c f>4 d s |
  c2~ <a c>4 |
  <a c>2 \bar "|."
}

tenor = \relative c' {
  \global
  \partial 4
  a4 |
  c( a) s |
  s c, a |
  s2 c4 |
  s2

  s4 |
  bf c s |
  s2 c4 |
  a bf s4 |
  s2

  c4 |
  bf s2 |
  s4 <f' a> <g c~> |
  <a c> <g c>4. <g~ b>8 |
  <e g>2

  c4 |
  s f g |
  s bf f |
  g2 f,4 |
  f2 \bar"|."
}

bass = \relative c {
  \global
  \partial 4
  f4 |
  f2 bf4 |
  f s2 |
  d2 s4 |
  f2

  f4 |
  s2 g4 |
  d2 s4 |
  s2 d4 |
  << {\voiceTwo g2} \\ { \voiceFour \ignore \once \override NoteColumn #'force-hshift = #0.4 \override NoteHead #'font-size = #-3 g,2} >>

  s4 |
  s d' g |
  d2 c4 |
  f c4. g8 |
  c2

  s4 |
  a d g, |
  a bf d |
  c2 s4 |
  s2 \bar "|."
}


verseOne = \lyricmode {
  \set stanza = "1."
  From east to west, from shore to shore,
  Let ev' -- ry heart a -- wake and sing
  The ho -- ly Child Whom Ma -- ry bore,
  The Christ, the ev -- er -- last -- ing King.
}

verseTwo = \lyricmode {
  \set stanza = "2."
  Be -- hold, the world’s Cre -- a -- tor wears
  The form and fash -- ion of a slave;
  Our ve -- ry flesh our Mak -- er shares,
  His fal -- len crea -- ture, man, to save.
}

verseThree = \lyricmode {
  \set stanza = "3."
  For this how won -- drous -- ly He wrought!
  A maid -- en, in her low -- ly place,
  Be -- came, in ways be -- yond all thought,
  The cho -- sen ves -- sel of His grace.
}


\score {
  \context ChoirStaff <<
    \context Staff = upper <<
      \context Voice =
      sopranos { \voiceOne << \melody >> }
      \context Voice =
      altos { \voiceTwo << \alto >> }
      \context Lyrics = one \lyricsto sopranos \verseOne
      \context Lyrics = two \lyricsto sopranos \verseTwo
      \context Lyrics = three \lyricsto sopranos \verseThree
    >>
    \context Staff = lower <<
      \clef bass
      \context Voice =
      tenors { \voiceOne << \tenor >> }
      \context Voice =
      basses { \voiceTwo << \bass >> }
    >>
  >>
  \midi {
    \context {
      \Score
      tempoWholesPerMinute = #(ly:make-moment 112 4)
    }
  }
  \layout {}
}

\markup {
  \large {
    \fill-line {
      \hspace #0.1 % moves the column off the left margin;
      % can be removed if space on the page is tight
      \column {
        \line {
          \bold "4. "
          \column {
            "She bowed her to the angel’s word"
            "  Declaring what the Father willed,"
            "And suddenly the promised Lord"
            "  That pure and hallowed temple filled."
          }
        }
        \vspace #1
        \line {
          \bold "5. "
          \column {
            "He shrank not from the oxen’s stall,"
            "  He lay within the manger bed,"
            "And He whose bounty feedeth all"
            "  At Mary’s breast Himself was fed."
          }
        }
      }
      \hspace #0.1  % adds horizontal spacing between columns;
      % if they are still too close, add more " " pairs
      % until the result looks good
      \column {
        \line {
          \bold "6. "
          \column {
            "And while the angels in the sky"
            "  Sang praise above the silent field,"
            "To shepherds poor the Lord Most High,"
            "  The one great Shepherd, was revealed."
          }
        }
        \vspace #1
        \line {
          \bold "7. "
          \column {
            "All glory for this blessèd morn"
            "  To God the Father ever be;"
            "All praise to Thee, O Virgin-born,"
            "  All praise, O Holy Ghost, to Thee."
          }
        }
      }
      \hspace #0.1 % gives some extra space on the right margin;
      % can be removed if page space is tight
    }
  }
}


