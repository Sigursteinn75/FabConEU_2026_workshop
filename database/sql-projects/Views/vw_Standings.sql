-- Slim public standings: season, competition, team, games played and points,
-- straight off the league table. Explicit column list (no SELECT *), plain name.
-- Position is ranked per season and competition, so the Premier League and the WSL
-- are never mixed into one table -- ties broken by goal difference, then goals for.
CREATE VIEW [football].[vw_Standings]
AS
SELECT
    lt.[SeasonId],
    lt.[CompetitionId],
    lt.[Competition],
    lt.[Team],
    lt.[Played],
    lt.[Points],
    ROW_NUMBER() OVER (
        PARTITION BY lt.[SeasonId], lt.[CompetitionId]
        ORDER BY lt.[Points] DESC, lt.[GoalDifference] DESC, lt.[GoalsFor] DESC
    ) AS [Position]
FROM [football].[vw_LeagueTable] AS lt;
