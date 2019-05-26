# rubocop:disable Metrics/BlockLength
after 'development:participations', 'development:achievements' do
  stephann = Participant.find_by!(username: '@stephannGameDev')
  marcos = Participant.find_by!(username: '@marcos')
  lopes = Participant.find_by!(username: '@lopes')
  rogoes = Participant.find_by!(username: '@rogoes')
  phillipe = Participant.find_by!(username: '@phillipe')

  season1 = Season.find_by!(title: 'T1 FIFA 19 NSB')
  season2 = Season.find_by!(title: 'T2 FIFA 19 NSB')
  season3 = Season.find_by!(title: 'T3 FIFA 19 NSB')
  season4 = Season.find_by!(title: 'T4 FIFA 19 NSB')

  ##################
  #### SEASON 1 ####
  ##################

  # GOLD TITLE T1
  Accomplishment.find_or_create_by!(
    participation: Participation.find_by!(participant: stephann, season: season1),
    achievement: Achievement.find_by!(title: 'Gold Title')
  )

  # CUP TITLE T1
  Accomplishment.find_or_create_by!(
    participation: Participation.find_by!(participant: marcos, season: season1),
    achievement: Achievement.find_by!(title: 'Cup Title')
  )

  # CHAMPIONS CUP TITLE T1
  Accomplishment.find_or_create_by!(
    participation: Participation.find_by!(participant: marcos, season: season1),
    achievement: Achievement.find_by!(title: 'Champions Cup Title')
  )

  # RUNNER-UP GOLD TITLE T1
  Accomplishment.find_or_create_by!(
    participation: Participation.find_by!(participant: marcos, season: season1),
    achievement: Achievement.find_by!(title: 'Runner-up Gold')
  )

  # RUNNER-UP CUP TITLE T1
  Accomplishment.find_or_create_by!(
    participation: Participation.find_by!(participant: stephann, season: season1),
    achievement: Achievement.find_by!(title: 'Runner-up Cup')
  )

  # RUNNER-UP CHAMPIONS CUP TITLE T1
  Accomplishment.find_or_create_by!(
    participation: Participation.find_by!(participant: stephann, season: season1),
    achievement: Achievement.find_by!(title: 'Runner-up Champions Cup')
  )

  ##################
  #### SEASON 2 ####
  ##################

  # GOLD TITLE T2
  Accomplishment.find_or_create_by!(
    participation: Participation.find_by!(participant: phillipe, season: season2),
    achievement: Achievement.find_by!(title: 'Gold Title')
  )

  # CUP TITLE T2
  Accomplishment.find_or_create_by!(
    participation: Participation.find_by!(participant: marcos, season: season2),
    achievement: Achievement.find_by!(title: 'Cup Title')
  )

  # CHAMPIONS CUP TITLE T2
  Accomplishment.find_or_create_by!(
    participation: Participation.find_by!(participant: rogoes, season: season2),
    achievement: Achievement.find_by!(title: 'Champions Cup Title')
  )

  # RUNNER-UP GOLD TITLE T2
  Accomplishment.find_or_create_by!(
    participation: Participation.find_by!(participant: stephann, season: season2),
    achievement: Achievement.find_by!(title: 'Runner-up Gold')
  )

  # RUNNER-UP CUP TITLE T2
  Accomplishment.find_or_create_by!(
    participation: Participation.find_by!(participant: rogoes, season: season2),
    achievement: Achievement.find_by!(title: 'Runner-up Cup')
  )

  # RUNNER-UP CHAMPIONS CUP TITLE T2
  Accomplishment.find_or_create_by!(
    participation: Participation.find_by!(participant: phillipe, season: season2),
    achievement: Achievement.find_by!(title: 'Runner-up Champions Cup')
  )

  ##################
  #### SEASON 3 ####
  ##################

  # GOLD TITLE T3
  Accomplishment.find_or_create_by!(
    participation: Participation.find_by!(participant: phillipe, season: season3),
    achievement: Achievement.find_by!(title: 'Gold Title')
  )

  # CUP TITLE T3
  Accomplishment.find_or_create_by!(
    participation: Participation.find_by!(participant: phillipe, season: season3),
    achievement: Achievement.find_by!(title: 'Cup Title')
  )

  # CHAMPIONS CUP TITLE T3
  Accomplishment.find_or_create_by!(
    participation: Participation.find_by!(participant: phillipe, season: season3),
    achievement: Achievement.find_by!(title: 'Champions Cup Title')
  )

  # RUNNER-UP GOLD TITLE T3
  Accomplishment.find_or_create_by!(
    participation: Participation.find_by!(participant: lopes, season: season3),
    achievement: Achievement.find_by!(title: 'Runner-up Gold')
  )

  # RUNNER-UP CUP TITLE T3
  Accomplishment.find_or_create_by!(
    participation: Participation.find_by!(participant: lopes, season: season3),
    achievement: Achievement.find_by!(title: 'Runner-up Cup')
  )

  # RUNNER-UP CHAMPIONS CUP TITLE T3
  Accomplishment.find_or_create_by!(
    participation: Participation.find_by!(participant: lopes, season: season3),
    achievement: Achievement.find_by!(title: 'Runner-up Champions Cup')
  )

  ##################
  #### SEASON 4 ####
  ##################

  # GOLD TITLE T4
  Accomplishment.find_or_create_by!(
    participation: Participation.find_by!(participant: lopes, season: season4),
    achievement: Achievement.find_by!(title: 'Gold Title')
  )

  # CUP TITLE T4
  Accomplishment.find_or_create_by!(
    participation: Participation.find_by!(participant: stephann, season: season4),
    achievement: Achievement.find_by!(title: 'Cup Title')
  )

  # CHAMPIONS CUP TITLE T4
  Accomplishment.find_or_create_by!(
    participation: Participation.find_by!(participant: phillipe, season: season4),
    achievement: Achievement.find_by!(title: 'Champions Cup Title')
  )

  # RUNNER-UP GOLD TITLE T4
  Accomplishment.find_or_create_by!(
    participation: Participation.find_by!(participant: marcos, season: season4),
    achievement: Achievement.find_by!(title: 'Runner-up Gold')
  )

  # RUNNER-UP CUP TITLE T4
  Accomplishment.find_or_create_by!(
    participation: Participation.find_by!(participant: rogoes, season: season4),
    achievement: Achievement.find_by!(title: 'Runner-up Cup')
  )

  # RUNNER-UP CHAMPIONS CUP TITLE T4
  Accomplishment.find_or_create_by!(
    participation: Participation.find_by!(participant: phillipe, season: season4),
    achievement: Achievement.find_by!(title: 'Runner-up Champions Cup')
  )
end
# rubocop:enable Metrics/BlockLength
