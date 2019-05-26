# rubocop:disable Metrics/BlockLength
after 'development:participants', 'development:seasons' do
  stephann = Participant.find_by!(username: '@stephannGameDev')
  marcos = Participant.find_by!(username: '@marcos')
  lopes = Participant.find_by!(username: '@lopes')
  rogoes = Participant.find_by!(username: '@rogoes')
  phillipe = Participant.find_by!(username: '@phillipe')

  season1 = Season.find_by(title: 'T1 FIFA 19 NSB')
  season2 = Season.find_by(title: 'T2 FIFA 19 NSB')
  season3 = Season.find_by(title: 'T3 FIFA 19 NSB')
  season4 = Season.find_by(title: 'T4 FIFA 19 NSB')

  [
    { participant: stephann, season: season1 },
    { participant: stephann, season: season2 },
    { participant: stephann, season: season3 },
    { participant: stephann, season: season4 },

    { participant: marcos, season: season1 },
    { participant: marcos, season: season2 },
    { participant: marcos, season: season3 },
    { participant: marcos, season: season4 },

    { participant: lopes, season: season3 },
    { participant: lopes, season: season4 },

    { participant: rogoes, season: season2 },
    { participant: rogoes, season: season3 },
    { participant: rogoes, season: season4 },

    { participant: phillipe, season: season2 },
    { participant: phillipe, season: season3 },
    { participant: phillipe, season: season4 }
  ].each do |participation_data|
    Participation.find_or_create_by!(participation_data)
  end
end
# rubocop:enable Metrics/BlockLength
