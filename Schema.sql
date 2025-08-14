
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
    team_avatar TEXT,
    created_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS dim_players (
    player_id TEXT PRIMARY KEY,
    team_id TEXT,
    player_name TEXT,
    team_id TEXT REFERENCES dim_teams(team_id),
    player_country TEXT,
    player_faceit_url TEXT,
    created_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS fact_matches (
match_id TEXT,
match_round TEXT,
competition_id TEXT REFERENCES dim_championships(competition_id),
winner_id TEXT REFERENCES dim_teams(team_id),
total_rounds_played INT,
PRIMARY KEY (match_id, match_round),
created_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS fact_teams_stats (
    match_id TEXT,
    match_round TEXT,
    team_id TEXT REFERENCES dim_teams(team_id),
    team_win INT,
    total_rounds_played INT,
    first_half_score INT,
    second_half_score INT,
    overtime_score INT,
    final_score INT,
    created_at TIMESTAMPTZ DEFAULT NOW(),
    FOREIGN KEY (match_id, match_round) 
        REFERENCES fact_matches(match_id, match_round),
    PRIMARY KEY (match_id, match_round, team_id)
);

CREATE TABLE IF NOT EXISTS fact_players_stats (
    match_id TEXT,
    match_round TEXT,
    player_id TEXT,
    zeuskills INT,
    utilitycount INT,
    doublekills INT,
    flashsuccesses INT,
    quadrokills INT,
    entrycount INT,
    firstkills INT,
    flashcount INT,
    sniperkills INT,
    damage INT,
    utilitydamage INT,
    assists INT,
    count_1v1 INT,
    enemiesflashed INT,
    clutchkills INT,
    pentakills INT,
    mvps INT,
    deaths INT,
    entrywins INT,
    kills INT,
    wins_1v2 INT,
    wins_1v1 INT,
    pistolkills INT,
    knifekills INT,
    adr INT,
    count_1v2 INT,
    triplekills INT,
    headshots INT,
    created_at TIMESTAMPTZ DEFAULT NOW(),
    FOREIGN KEY (match_id, match_round) 
        REFERENCES fact_matches(match_id, match_round),
    PRIMARY KEY (match_id, match_round, player_id)
)
