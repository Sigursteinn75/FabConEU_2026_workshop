-- Slim public standings: team and points, straight off the league table.
CREATE VIEW [football].[vw_⚽Standings]
AS
SELECT *
FROM [football].[vw_LeagueTable];
