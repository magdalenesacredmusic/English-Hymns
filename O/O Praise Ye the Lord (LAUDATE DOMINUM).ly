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
      \line {LAUDATE DOMINUM  10 10 11 11}
    }
    \right-column{
      \line {Charles H.H. Parry, 1894}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null 
    \right-column {
      \line {H.W. Baker, \italic "Hymns Ancient and Modern," 1875}
    }
  } 
}

\header {
  tagline = ""
}

global = {
  \key bf \major
  \time 3/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
  \global
  \partial 4
  f4 |
  d' bf c |
  f,2 bf4 |
  g f ef |
  d2 \bar "||" \break

  f4 |
  d' c f, |
  bf2 a4 |
  c bf g |
  f2 \bar "||" \break

  f4 |
  bf bf bf |
  bf a8[ g] a[ bf] |
  c4 bf c |
  f,2 \bar "||" \break

  a4 |
  d d d |
  bf8[ a] g4 ef' |
  d bf c |
  bf2 \bar "|."
}

alto = \relative c' {
  \global
  \partial 4
  f4 |
  f f g |
  f2 f4 |
  bf, d c |
  bf2

  f'4 |
  bf a f |
  f( g) f |
  fs g e |
  f2 \bar "||"

  c4 |
  bf ef f |
  g ef f |
  g f g |
  f2

  f4 |
  fs g a |
  g4 g g |
  f4. g8 a4 |
  bf2 \bar "|."
}

tenor = \relative c {
  \global
  \partial 4
  f4 |
  bf d c8[ bf] |
  a2 f4 |
  g g a |
  bf2

  d4 |
  e f c |
  d( c) c |
  ef! d bf |
  a2 \bar "||"

  a4 |
  bf bf af |
  g bf bf |
  ef d c8[ bf] |
  a2

  c4 |
  c bf a |
  d8[ c] bf4 bf |
  bf d ef |
  d2 \bar "|."
}

bass = \relative c {
  \global
  \partial 4
  f4 |
  bf d, ef |
  f2 d4 |
  ef c f |
  bf,2

  bf'4 |
  g a a, |
  d( e) f |
  a, bf c |
  f2 \bar "||"

  ef4 |
  d c d |
  ef ef d |
  c d ef |
  f2

  ef4 |
  d e fs |
  g g bf, |
  f' f f |
  bf,2 \bar "|."
}

verseOne = \lyricmode {
  \set stanza = "1."
  O praise ye the Lord! praise Him in the height;
  Re -- joice in His Word, ye an -- gels of light;
  Ye heav -- ens, a -- dore Him by Whom ye were made,
  And wor -- ship be -- fore Him in bright -- ness ar -- rayed.
}

verseTwo = \lyricmode {
  \set stanza = "2."
  O praise ye the Lord! Praise Him up -- on earth,
  In tune -- ful ac -- cord, ye sons of new birth;
  Praise Him Who hath brought you His grace from a -- bove,
  Praise Him Who hath taught you to sing of His love.
}

verseThree = \lyricmode {
  \set stanza = "3."
  O praise ye the Lord! All things that give sound;
  Each ju -- bi -- lant chord re -- ech -- o a -- round;
  Loud or -- gans, His glo -- ry forth tell in deep tone,
  And sweet harp, the sto -- ry of what He hath done.
}

verseFour = \lyricmode {
  \set stanza = "4."
  O praise ye the Lord! Thanks -- giv -- ing and song
  To Him be out -- poured all a -- ges a -- long!
  For love in cre -- a -- tion, for Heav -- en re -- stored,
  For grace of sal -- va -- tion, O praise ye the Lord!
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
    >>
    \include "hymn_layout.ly"
  }
  \markup { 
    \vspace #0.5 
  }
  \bottom
}

%{ \markup {
	\normalsize {
	\fill-line {
	\hspace #1.0
	\column {
		\line { \bold "5. "
		\column {
		"O praise ye the Lord and sing a new song,"
		"Amid all His saints His praises prolong;"
		"The praise of their Maker His people shall sing,"
		"And children of Zion rejoice in their King."
		}
		}
		\vspace #0.5
		\line { \bold "6. "
		\column {
		"With timbrel and harp and joyful acclaim,"
		"With gladness and mirth, sing praise to His Name,"
		"For God in His people His pleasure doth seek,"
		"With robes of salvation He clotheth the meek."
  		}
		}
		}
 \hspace #0.1  % adds horizontal spacing between columns;
        % if they are still too close, add more " " pairs
        % until the result looks good
     \column {
      \line { \bold "7."
        \column {
		"In glory exult, ye saints of the Lord;"
		"With songs in the night, high praises accord;"
		"Go forth in His service, be strong in His might,"
		"To conquer all evil and stand for the right."
        }
      }
      \hspace #0.1 % adds vertical spacing between verses
      \line { \bold "8."
        \column {
		"For this is His Word: His saints shall not fail,"
		"But over the earth their power shall prevail;"
		"All kingdoms and nations shall yield to their sway."
		"To God give the glory and praise Him for aye."
		}
      }
    }
  \hspace #0.1 % gives some extra space on the right margin;
      % can be removed if page space is tight
  }
}
} %}
