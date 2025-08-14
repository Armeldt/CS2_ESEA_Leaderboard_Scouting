-- Retrieve best french speaking prospects based on Average Damage per Round with a minimum of 5 matches played

SELECT player_name, team_name, ROUND(AVG(adr),2) as ADR,division, player_faceit_url
FROM dim_players d
JOIN fact_players_stats f on d.player_id = f.player_id
JOIN fact_matches fm ON f.match_id = fm.match_id AND f.match_round = fm.match_round
JOIN dim_championships dc ON fm.competition_id = dc.competition_id
JOIN dim_teams dt ON d.team_id = dt.team_id
WHERE player_country IN ('fr','be','ch')
AND division IN ('Entry','Intermediate','Main','Advanced')
GROUP BY player_name, team_name, division, player_faceit_url
HAVING COUNT(DISTINCT CONCAT(f.match_id, '-', f.match_round)) > 5
ORDER BY AVG(adr) DESC;

