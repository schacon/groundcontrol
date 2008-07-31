# rearrange spots

server = RmcUser.new('user')
new_playlist = server.regenerate_playlists(test_reactor)
arrange_playlist = new_playlist.rearrange
server.reorder_playlist(test_reactor, arrange_playlist)

remote = ReactorControl.new(rx)
remote.heartbeat.wait

results = {}
results[:playlist] = remote.check_correct_playlist
results[:spots] = []
playlist.each do |spot|
  remote.next_spot
  results[spots] &lt;&lt; remote.log_file_spot_data(:spot, :last)
end

assert results.in_same_order(arrange_playlist)
