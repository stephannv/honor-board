SELECT
  RANK() OVER(ORDER BY sum(achievements.points) DESC) AS rank,
  participants.id AS participant_id,
  participants.username AS participant_username,
  sum(achievements.points) AS total_points,
  count(DISTINCT participations.id) AS participations_count
FROM
  participants
INNER JOIN
  participations ON participations.participant_id = participants.id
LEFT JOIN
  accomplishments ON accomplishments.participation_id = participations.id
LEFT JOIN
  achievements ON accomplishments.achievement_id = achievements.id
GROUP BY
  participants.id
ORDER BY
  sum(achievements.points) DESC;
