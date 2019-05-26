[
  { title: 'T1 FIFA 19 NSB', started_at: Time.zone.parse('2018-09-01').to_date },
  { title: 'T2 FIFA 19 NSB', started_at: Time.zone.parse('2018-10-01').to_date },
  { title: 'T3 FIFA 19 NSB', started_at: Time.zone.parse('2018-11-01').to_date },
  { title: 'T4 FIFA 19 NSB', started_at: Time.zone.parse('2018-12-01').to_date }
].each do |season_data|
  Season.find_or_create_by!(season_data)
end
