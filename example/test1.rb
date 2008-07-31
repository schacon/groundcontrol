# schedule a spot and check that it ran

server = RmcUser.new('user')
sp = server.upload_spot(spot1)
server.schedule_spot(sp, today, next week, test_reactors)
new_playlist = server.regenerate_playlists(test_reactors)

results = test_reactors.each_parallel do |rx|
  remote = ReactorControl.new(rx)
  remote.heartbeat.wait

  results = {}
  results[:playlist] = remote.check_correct_playlist
  results[:spots] = {}
  playlist.each do |spot|
    remote.next_spot
    results[spot] = remote.log_file_spot_data(spot, :last)
  end

  results
end

results.each do |rx_results|
  assert rx_results.has_spot(spot1).and_passed
end