[
  { title: 'Gold Title', points: 15, achievement_type_cd: :title, order: '1' },
  { title: 'Cup Title', points: 12, achievement_type_cd: :title, order: '2' },
  { title: 'Champions Cup Title', points: 4, achievement_type_cd: :title, order: '4' },

  { title: 'Runner-up Gold', points: 12, achievement_type_cd: :other, order: '5' },
  { title: 'Runner-up Cup', points: 10, achievement_type_cd: :other, order: '6' },
  { title: 'Runner-up Champions Cup', points: 2, achievement_type_cd: :other, order: '7' }
].each do |achievement_data|
  Achievement.find_or_create_by!(achievement_data)
end
