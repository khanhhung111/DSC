import React, { useState, useEffect } from 'react';
import './TournamentBracket.css';
import { useParams } from 'react-router-dom';
import { getTeamTournament, saveTournamentResults, getTournamentResults } from '../../utils/tournament';
import Hearder from "../../components/Header/Hearder";
import Footer from "../../components/Footer/Footer";

const TournamentBracket = () => {
  const { tournamentId } = useParams();
  const [numberOfTeams, setNumberOfTeams] = useState(8);
  const [teams, setTeams] = useState([]);
  const [matches, setMatches] = useState({});
  const [winner, setWinner] = useState('');
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState('');
  const [tournamentInfo, setTournamentInfo] = useState(null);
  const [editMode, setEditMode] = useState(false);
  const [lastUpdateTime, setLastUpdateTime] = useState(null);

  const initializeTournament = (teamList) => {
    const rounds = Math.log2(teamList.length);
    let matchStructure = {};
    let currentRoundTeams = [...teamList];

    for (let i = rounds; i > 0; i--) {
      const roundName = `round${i}`;
      const matchCount = Math.pow(2, i - 1);
      const matches = [];

      for (let j = 0; j < matchCount; j++) {
        if (i === rounds) {
          matches.push({
            team1: currentRoundTeams[j * 2].teamName,
            team2: currentRoundTeams[j * 2 + 1].teamName,
            team1Id: currentRoundTeams[j * 2].teamId,
            team2Id: currentRoundTeams[j * 2 + 1].teamId,
            score1: '',
            score2: ''
          });
        } else {
          matches.push({
            team1: 'TBD',
            team2: 'TBD',
            team1Id: null,
            team2Id: null,
            score1: '',
            score2: ''
          });
        }
      }
      matchStructure[roundName] = matches;
    }
    return matchStructure;
  };

  const updateMatchesWithResults = (results, currentMatches) => {
    const newMatches = { ...currentMatches };
    results.forEach(result => {
      const { roundNumber, matchNumber, team1Id, team2Id, score1, score2 } = result;
      const roundKey = `round${roundNumber}`;
      if (newMatches[roundKey] && newMatches[roundKey][matchNumber - 1]) {
        newMatches[roundKey][matchNumber - 1] = {
          ...newMatches[roundKey][matchNumber - 1],
          team1Id,
          team2Id,
          score1: score1 && score1.$values ? score1.$values[0].toString() : '0',
          score2: score2 && score2.$values ? score2.$values[0].toString() : '0'
        };
      }
    });
    setMatches(newMatches);
  };

  const fetchTournamentResults = async () => {
    try {
      setLoading(true);
      const response = await getTournamentResults(tournamentId);
      if (response && response.data.$values) {
        updateMatchesWithResults(response.data.$values, matches);
      }
    } catch (err) {
      console.error('Error fetching tournament results:', err);
      setError('Failed to fetch tournament results');
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => {
    const fetchData = async () => {
      if (!tournamentId) return;

      try {
        setLoading(true);
        setError('');

        // Fetch teams
        const teamsResponse = await getTeamTournament(tournamentId);
        if (!teamsResponse.data.$values[0]) {
          throw new Error('Failed to fetch teams');
        }

        const data = teamsResponse.data.$values[0];
        const fetchedTeams = data.teamNames.$values.map((team, index) => ({
          teamName: team,
          teamId: data.teamId.$values[index]
        })) || [];

        setTournamentInfo(data);
        setNumberOfTeams(data.numberOfTeams);
        setTeams(fetchedTeams);

        // Initialize tournament structure
        const initialMatches = initializeTournament(fetchedTeams);
        setMatches(initialMatches);

        // Fetch results
        const resultsResponse = await getTournamentResults(tournamentId);
        if (resultsResponse && resultsResponse.data.$values) {
          updateMatchesWithResults(resultsResponse.data.$values, initialMatches);
        }
      } catch (err) {
        setError(err.message);
      } finally {
        setLoading(false);
      }
    };

    fetchData();
  }, [tournamentId]);

  useEffect(() => {
    if (lastUpdateTime) {
      fetchTournamentResults();
    }
  }, [lastUpdateTime]);

  const handleScoreChange = (round, matchIndex, team, value) => {
    if (value !== '' && (isNaN(value) || value < 0)) return;

    const newMatches = { ...matches };
    if (team === 1) {
      newMatches[round][matchIndex].score1 = value;
    } else {
      newMatches[round][matchIndex].score2 = value;
    }

    if (newMatches[round][matchIndex].score1 !== '' &&
      newMatches[round][matchIndex].score2 !== '') {
      const winner = parseInt(newMatches[round][matchIndex].score1) >
        parseInt(newMatches[round][matchIndex].score2)
        ? { name: newMatches[round][matchIndex].team1, id: newMatches[round][matchIndex].team1Id }
        : { name: newMatches[round][matchIndex].team2, id: newMatches[round][matchIndex].team2Id };

      const roundNumber = parseInt(round.replace('round', ''));
      if (roundNumber > 1) {
        const nextRound = `round${roundNumber - 1}`;
        const nextMatchIndex = Math.floor(matchIndex / 2);
        const isFirstTeam = matchIndex % 2 === 0;

        if (isFirstTeam) {
          newMatches[nextRound][nextMatchIndex].team1 = winner.name;
          newMatches[nextRound][nextMatchIndex].team1Id = winner.id;
        } else {
          newMatches[nextRound][nextMatchIndex].team2 = winner.name;
          newMatches[nextRound][nextMatchIndex].team2Id = winner.id;
        }
      } else {
        setWinner(winner.name);
      }
    }

    setMatches(newMatches);
  };

  const saveResults = async () => {
    try {
      setLoading(true);

      const convertedMatches = Object.entries(matches).reduce((acc, [roundKey, roundMatches]) => {
        const roundNumber = parseInt(roundKey.replace('round', ''));

        const convertedRoundMatches = roundMatches
          .map((match, index) => {
            if (match.score1 !== "" && match.score2 !== "") {
              return {
                matchNumber: index + 1,
                team1Id: match.team1Id || undefined,
                team2Id: match.team2Id || undefined,
                score1: parseInt(match.score1),
                score2: parseInt(match.score2)
              };
            }
            return null;
          })
          .filter(match => match !== null);

        if (convertedRoundMatches.length > 0) {
          acc[roundNumber] = convertedRoundMatches;
        }
        return acc;
      }, {});

      if (Object.keys(convertedMatches).length > 0) {
        const data1 = {
          tournamentId: parseInt(tournamentId),
          matches: convertedMatches,
        };

        const response = await saveTournamentResults(data1);

        if (response && response.data && response.data.success) {
          setEditMode(false);
          alert('Results saved successfully!');
          setLastUpdateTime(new Date().toISOString());
        } else {
          alert('Failed to save results. Please try again.');
        }
      } else {
        alert('No results to save. Please enter scores for at least one match.');
      }
    } catch (err) {
      alert('An error occurred while saving results: ' + err.message);
    } finally {
      setLoading(false);
    }
  };

  return (
<div>

  <Hearder/>
  <div className="tournament-container">
      <div className="tournament-controls">
        <h2>Tournament Bracket</h2>
        {error && <div className="error-message">{error}</div>}
        {winner && (
          <div className="winner-announcement">
            <h3>Tournament Winner</h3>
            <div className="winner-name">{winner}</div>
          </div>
        )}
      </div>

      {loading ? (
        <div className="loading">Loading...</div>
      ) : error ? (
        <div className="error-container">
          <p>{error}</p>
        </div>
      ) : (
        <div className="tournament-bracket">
          {Object.entries(matches).map(([roundName, roundMatches], roundIndex) => (
            <div key={roundName} className={`round ${roundName}`}>
              <h3>{`Round ${Math.log2(numberOfTeams) - roundIndex}`}</h3>
              {roundMatches.map((match, matchIndex) => (
                <div key={matchIndex} className="match">
                  <div className={`team ${parseInt(match.score1) > parseInt(match.score2) ? 'winner' : ''}`}>
                    <span>{match.team1}</span>
                    {editMode ? (
                      <input
                        type="number"
                        value={match.score1}
                        onChange={(e) => handleScoreChange(roundName, matchIndex, 1, e.target.value)}
                        disabled={match.team1 === 'TBD'}
                      />
                    ) : (
                      <span className="score">
                        {match.score1 !== undefined && match.score1 !== null ? match.score1 : '-'}
                      </span>
                    )}
                  </div>
                  <div className={`team ${parseInt(match.score2) > parseInt(match.score1) ? 'winner' : ''}`}>
                    <span>{match.team2}</span>
                    {editMode ? (
                      <input
                        type="number"
                        value={match.score2}
                        onChange={(e) => handleScoreChange(roundName, matchIndex, 2, e.target.value)}
                        disabled={match.team2 === 'TBD'}
                      />
                    ) : (
                      <span className="score">
                        {match.score2 !== undefined && match.score2 !== null ? match.score2 : '-'}
                      </span>
                    )}
                  </div>
                </div>
              ))}
            </div>
          ))}
        </div>
      )}
    </div>
    <Footer />
</div>

    
  );
};

export default TournamentBracket;