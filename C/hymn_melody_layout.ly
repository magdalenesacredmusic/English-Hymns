\version "2.18.2"

\layout {
  %#(layout-set-staff-size 16)
  indent = 0.0\cm
  ragged-right = ##f
  \context {
    \Score
    % **** Turns off bar numbering
    \remove "Bar_number_engraver"
    %\consists #Lyric_text_align_engraver
  }
  \context {
    \Staff
    \remove "Time_signature_engraver"
  }
  \context {
    \Lyrics
    %\override LyricText #'X-offset = #X-offset-callback
    % **** Prevents lyrics from running too close together
    % \override LyricSpace #'minimum-distance = #0.6
    % **** Makes the text of lyrics a little smaller
    %\override LyricText #'font-size = #0.8
    % **** Moves lines of lyrics closer together
    % \override VerticalAxisGroup #'minimum-Y-extent = #'(-1 . 1)
  }
}