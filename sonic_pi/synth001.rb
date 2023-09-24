# Sonic Pi Synthwave Example

use_bpm 160

live_loop :drums do
  sample :bd_haus
  sleep 1
  sample :sn_dolf
  sleep 1
end

live_loop :bass, sync: :drums do
  use_synth :tb303
  play :e2, release: 0.2
  sleep 0.25
end

live_loop :lead, sync: :drums do
  use_synth :blade
  play :e3, release: 0.4
  sleep 0.5
end

use_bpm 160
switch = false

# Drums
live_loop :drums do
  sample :bd_haus
  sleep 1
  sample :sn_dolf
  sleep 1
end

# Bass
live_loop :bass, sync: :drums do
  use_synth :tb303
  if switch
    play :g2, release: 0.2
  else
    play :e2, release: 0.2
  end
  sleep 0.25
end

# Improved Lead
live_loop :lead, sync: :drums do
  use_synth :prophet
  if switch
    play_pattern_timed [:b3, :a3, :g3, :e3], [0.25]
  else
    play_pattern_timed [:e3, :g3, :a3, :b3], [0.25]
  end
  sleep 0.5
end

# Switch to the middle part after 16 beats
live_loop :control, sync: :drums do
  sleep 16
  switch = !switch
end