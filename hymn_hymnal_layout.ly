\version "2.18.2"
\layout {
  indent = 0.0\cm
  ragged-right = ##f
  ragged-last = ##f
  #(layout-set-staff-size 14)
  \context {
    \Score
    %**** Turns off bar numbering
    \remove "Bar_number_engraver"
  }
  \context {
    \Staff
    \remove "Time_signature_engraver"
  }
}