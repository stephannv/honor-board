[
  { username: '@stephannGameDev', friend_code: 'SW-1111-1111-1111' },
  { username: '@marcos', friend_code: 'SW-2222-2222-2222' },
  { username: '@lopes', friend_code: 'SW-3333-3333-3333' },
  { username: '@rogoes', friend_code: 'SW-4444-4444-4444' },
  { username: '@phillipe', friend_code: 'SW-5555-5555-5555' }
].each do |participant_data|
  Participant.find_or_create_by!(participant_data)
end
