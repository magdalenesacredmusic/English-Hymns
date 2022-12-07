%{
The music and poetry produced by this source code are believed to be in the public domain in the United States.
The source code itself is licensed under a Creative Commons Attribution-NonCommercial 4.0 International License:
http://creativecommons.org/licenses/by-nc/4.0/

Musicam Ecclesiae - sites.google.com/site/musicamecclesiae
%}

\version "2.22.2"
\include "english.ly"
\include "hymn_definitions.ly"

refs = \markup {
  \fontsize #-3 {
    \left-column {
      \wordwrap {
        Text: George Herbert (1593-1633)
      }
      \wordwrap {
        Music: THE CALL, 77 77, Ralph Vaughan Williams, 1911
      }
    }
  }
}

top = \markup {
\fill-line {
      \column {
          \line \small {THE CALL 77 77}
      }
      \column{
      \line \small {Ralph Vaughan Williams, 1911}
      }
}
}

bottom = \markup  {
 \fill-line {
   \null 
   \right-column {
     \line \small {George Herbert (1593-1633)}
   }
  } 
}

global = {
	\key ef \major
	\time 6/4
	\autoBeamOff
	\set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
	\global
	\partial 2.
	ef2 g4 |
	bf2 bf4 c( bf) af |
	bf2. ef,2 g4 |
	bf2 bf4 c( bf) af |
	bf2. df2 df4 |
	c2 c4 bf2 af4 |
	bf2. af2 af4 |
	g2 g4 f4( g af |
	g f ef f2) f4 |
	ef1. \bar "|."
	
}

melodya = \relative c' {
	\global
	\partial 2.
	ef2 g4 |
	bf2 bf4 c( bf) af |
	bf2. ef,2 g4 | \break
	bf2 bf4 c( bf) af |
	bf2. df2 df4 |
	c2 c4 bf2 af4 |
	bf2. af2 af4 |
	g2 g4 f4( g af |
	g f ef f2) f4 |
	ef1. \bar "|."
	
}

alto = \relative c' {
	\global
	\partial 2.
	c2. |
	df2. ef2. |
	ef2( df4) c2. |
	df2. ef2. |
	ef2( df4) <gf bf>2 <f bf>4~ |
	<f af>2 <ef af>4 <<{\voiceTwo f2}\\{\voiceFour ef4 df}>> <c f>4 |
	ef2. f2. |
	ef2. c2.~ |
	c2. df2 c4 |
	bf1.
}

tenor = \relative c {
	\global
	\partial 2.
	ef2. |
	f2. af2. |
	f2. ef2. |
	f2. af2. |
	f2. bf2. |
	c2. f,2 f4 |
	g2. df'2 c4 |
	bf2. af2.~ |
	af2. bf2. |
	af2. g2.
}

bass = \relative c {
	\global
	\partial 2.
	c2. |
	bf2. af2. |
	bf2. c2. |
	bf2. af2. |
	bf2. gf2. |
	af2. bf2 f'4 |
	ef2. df2. |
	ef2. f2.~ |
	f2. bf,2. |
	ef1.
}


verseOne = \lyricmode {
	\vOne
        Come, my way, my truth, my life:
        Such a way, as gives us breath;
        Such a truth, as ends all strife;
        such a life as kill -- eth death.
}

verseTwo = \lyricmode {
	\vTwo
	Come, my light, my feast, my strength:
	Such a light as shows a feast;
	Such a feast as mends in length;
	Such a strength as makes __ his guest.
}

verseThree = \lyricmode {
	\vThree
	Come, my joy, my love, my heart:
	Such a joy as none can move;
	Such a love as none can part;
	Such a heart as joys __ in love.
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
  \score { %\transpose c d
    \new ChoirStaff <<
      \new Staff  <<
        \new Voice = "soprano" { \voiceOne \melody }
        \new Voice = "alto" { \voiceTwo \alto }
      >>
      \new Lyrics  \lyricsto soprano \verseOne
      \new Lyrics  \lyricsto soprano \verseTwo
      \new Lyrics  \lyricsto soprano \verseThree
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
      \new Lyrics \lyricsto "tune" { \verseOne }
      \new Lyrics \lyricsto "tune" { \verseTwo }
      \new Lyrics \lyricsto "tune" { \verseThree }
    >>
    \include "hymn_layout.ly"
  }
  \markup { 
    \vspace #0.5 
  }
  % \bottom
  \refs
}
