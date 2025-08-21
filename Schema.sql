
CREATE TABLE IF NOT EXISTS dim_championships (
    competition_id TEXT PRIMARY KEY,
    organizer TEXT,
    competition_type TEXT,
    region TEXT,
    sub_region TEXT,
    season TEXT,
    division TEXT,
    state TEXT,
    started_at DATE,
    created_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS dim_teams (
    team_id TEXT PRIMARY KEY,
    team_name TEXT,
    team_nickname TEXT,
    team_avatar TEXT,
    team_faceit_url TEXT,
    created_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS dim_players (
    player_id TEXT PRIMARY KEY,
    player_name TEXT,
    team_id TEXT,
    player_country TEXT,
    player_faceit_url TEXT,
    player_avatar TEXT,
    created_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS dim_matches (
    match_id TEXT,
    match_round TEXT,
    competition_id TEXT,
    match_day DATE,
    format TEXT,
    map TEXT,
    total_rounds_played INT,
    winner_id TEXT,
    loser_id TEXT,
    PRIMARY KEY (match_id, match_round),
    created_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS fact_teams_stats (
    match_id TEXT,
    match_round TEXT,
    team_id TEXT,
    competition_id TEXT,
    team_win INT,
    total_rounds_played TEXT,
    first_half_score INT,
    second_half_score INT,
    overtime_score INT,
    final_score INT,
    created_at TIMESTAMPTZ DEFAULT NOW(),
    PRIMARY KEY (match_id, match_round, team_id)
);

CREATE TABLE IF NOT EXISTS fact_players_stats (
    match_id TEXT,
    match_round TEXT,
    player_id TEXT,
    competition_id TEXT,
    team_id TEXT,
    zeus_kills INT,
    utility_count INT,
    double_kills INT,
    flash_successes INT,
    quadro_kills INT,
    entry_count INT,
    first_kills INT,
    flash_count INT,
    sniper_kills INT,
    damage INT,
    utility_damage INT,
    assists INT,
    count_1v1 INT,
    enemies_flashed INT,
    clutch_kills INT,
    ace INT,
    mvps INT,
    deaths INT,
    entry_wins INT,
    kills INT,
    wins_1v2 INT,
    wins_1v1 INT,
    pistol_kills INT,
    knife_kills INT,
    adr INT,
    count_1v2 INT,
    triple_kills INT,
    headshots INT,
    match_day DATE,
    created_at TIMESTAMPTZ DEFAULT NOW(),
    PRIMARY KEY (match_id, match_round, player_id)
)
