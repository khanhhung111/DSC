import React, { useState, useEffect, useRef } from 'react';
import styles from './RoundRobinBracket.module.css';
import { useParams } from 'react-router-dom';
import { DatePicker, TimePicker, Modal, Button, Input } from 'antd';
import { getTeamTournament, saveTournamentResults, getTournamentResults, saveTournamentResultsTemp } from '../../utils/tournament';
import { ToastContainer } from 'react-toastify';
import 'react-toastify/dist/ReactToastify.css';
import { toast } from 'react-toastify';
import Hearder from "../../components/Header/Hearder";
import Footer from "../../components/Footer/Footer";
const RoundRobinTournament = () => {
  const { tournamentId } = useParams();
  const [teams, setTeams] = useState([]);
  const [matches, setMatches] = useState([]);
  const [standings, setStandings] = useState([]);
  const [currentRound, setCurrentRound] = useState(1);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);
  const [editMode, setEditMode] = useState(false);
  const hasFetched = useRef(false);

  useEffect(() => {
    if (!hasFetched.current) {
      fetchData();
    }
  }, [tournamentId]);

  const fetchData = async () => {
    try {
        setLoading(true);
        console.log("Fetching tournament data for ID:", tournamentId);

        const teamsResponse = await getTeamTournament(tournamentId);
        console.log("Teams Response:", teamsResponse);

        if (!teamsResponse.data.$values[0]) {
            throw new Error('Failed to fetch teams');
        }

        const data = teamsResponse.data.$values[0];
        const teamIds = data.teamId.$values;
        const teamNames = data.teamNames.$values;
        console.log("teamNames:", teamNames);

        const fetchedTeams = teamIds.map((teamId, index) => ({
            id: teamId,
            teamId: teamId,
            name: teamNames[index],
            teamName: teamNames[index]
        }));

        console.log("Processed Teams:", fetchedTeams);
        setTeams(fetchedTeams);

        const initialMatches = generateInitialMatches(fetchedTeams);
        console.log("Initial matches generated:", initialMatches); // Thêm log này

        let updatedMatches = [...initialMatches];
        const resultsResponse = await getTournamentResults(tournamentId);
        console.log("Tournament Results Response:", resultsResponse);

        if (resultsResponse && resultsResponse.data.data.$values) {
            updatedMatches = updateMatchesWithResults(initialMatches, resultsResponse.data.data.$values);
            console.log("Matches after updating results:", updatedMatches); // Thêm log này
        }

        setMatches(updatedMatches);
        console.log("Calling updateStandings from fetchData"); // Thêm log này
        updateStandings(updatedMatches); // Đảm bảo dòng này được thực thi

    } catch (err) {
        console.error("Error in fetchData:", err);
        setError(err.message);
    } finally {
        setLoading(false);
        console.log("=== fetchData completed ===");
        hasFetched.current = true;
    }
};
useEffect(() => {
  console.log("Matches changed:", matches);
  if (matches.length > 0) {
      console.log("Calling updateStandings from useEffect");
      updateStandings(matches);
  }
}, [matches]);
  const generateInitialMatches = (teamsList) => {
    if (!Array.isArray(teamsList) || teamsList.length === 0) {
      console.error("Invalid teams list:", teamsList);
      return [];
    }

    let allMatches = [];
    let teamsForMatches = [...teamsList];

    if (teamsForMatches.length % 2 !== 0) {
      teamsForMatches.push({ id: null, teamId: null, name: "Bye", teamName: "Bye" });
    }

    const roundsCount = teamsForMatches.length - 1;
    const matchesPerRound = Math.floor(teamsForMatches.length / 2);

    for (let round = 0; round < roundsCount; round++) {
      let roundMatches = [];

      for (let match = 0; match < matchesPerRound; match++) {
        const homeTeam = teamsForMatches[match];
        const awayTeam = teamsForMatches[teamsForMatches.length - 1 - match];

        if (homeTeam.id !== null && awayTeam.id !== null) {
          roundMatches.push({
            round: round + 1,
            homeTeam,
            awayTeam,
            homeScore: null,
            awayScore: null
          });
        }
      }

      allMatches.push(...roundMatches);

      const firstTeam = teamsForMatches[0];
      const lastTeam = teamsForMatches[teamsForMatches.length - 1];
      for (let i = teamsForMatches.length - 1; i > 1; i--) {
        teamsForMatches[i] = teamsForMatches[i - 1];
      }
      teamsForMatches[1] = lastTeam;
    }

    const firstLegMatches = [...allMatches];
    const secondLegMatches = firstLegMatches.map(match => ({
      round: match.round + roundsCount,
      homeTeam: match.awayTeam,
      awayTeam: match.homeTeam,
      homeScore: null,
      awayScore: null
    }));

    return [...firstLegMatches, ...secondLegMatches];
  };
  const updateMatchesWithResults = (initialMatches, results) => {
    const updatedMatches = [...initialMatches];

    results.forEach(result => {
      updatedMatches.forEach((match, index) => {
        if (match.homeTeam.teamId === result.team1Id &&
          match.awayTeam.teamId === result.team2Id) {
          updatedMatches[index] = {
            ...match,
            homeScore: result.score1,
            awayScore: result.score2
          };
        }
      });
    });

    return updatedMatches;
  };

  const updateStandings = (currentMatches) => {
    // Kiểm tra nếu không có teams hoặc matches
    if (!teams.length || !currentMatches.length) return;

    console.log("Updating standings with matches:", currentMatches);

    const newStandings = teams.map(team => ({
      id: team.id,
      teamId: team.teamId,
      name: team.name,
      teamName: team.teamName,
      played: 0,
      won: 0,
      drawn: 0,
      lost: 0,
      goalsFor: 0,
      goalsAgainst: 0,
      points: 0
    }));

    currentMatches.forEach(match => {
      // Chỉ tính các trận đã có kết quả
      if (match.homeScore !== null && match.awayScore !== null &&
        match.homeScore !== undefined && match.awayScore !== undefined) {

        const homeTeam = newStandings.find(team => team.id === match.homeTeam.id);
        const awayTeam = newStandings.find(team => team.id === match.awayTeam.id);

        if (homeTeam && awayTeam) {
          // Cập nhật số trận đã đấu
          homeTeam.played++;
          awayTeam.played++;

          // Cập nhật bàn thắng/thua
          const homeScore = parseInt(match.homeScore);
          const awayScore = parseInt(match.awayScore);

          homeTeam.goalsFor += homeScore;
          homeTeam.goalsAgainst += awayScore;
          awayTeam.goalsFor += awayScore;
          awayTeam.goalsAgainst += homeScore;

          // Cập nhật thắng/thua/hòa và điểm
          if (homeScore > awayScore) {
            homeTeam.won++;
            awayTeam.lost++;
            homeTeam.points += 3;
          } else if (homeScore < awayScore) {
            awayTeam.won++;
            homeTeam.lost++;
            awayTeam.points += 3;
          } else {
            homeTeam.drawn++;
            awayTeam.drawn++;
            homeTeam.points += 1;
            awayTeam.points += 1;
          }
        }
      }
    });

    // Sắp xếp bảng xếp hạng
    newStandings.sort((a, b) => {
      if (b.points !== a.points) return b.points - a.points;
      const aGD = a.goalsFor - a.goalsAgainst;
      const bGD = b.goalsFor - b.goalsAgainst;
      if (bGD !== aGD) return bGD - aGD;
      return b.goalsFor - a.goalsFor;
    });

    console.log("Updated standings:", newStandings);
    setStandings(newStandings);
  };

  const updateScore = (matchIndex, homeScore, awayScore) => {
    console.log("Updating score for match:", matchIndex); // Thêm log này
    const updatedMatches = [...matches];
    updatedMatches[matchIndex] = {
        ...updatedMatches[matchIndex],
        homeScore: homeScore !== '' ? parseInt(homeScore) : null,
        awayScore: awayScore !== '' ? parseInt(awayScore) : null
    };
    console.log("Updated matches:", updatedMatches); // Thêm log này
    setMatches(updatedMatches);
    console.log("Calling updateStandings from updateScore"); // Thêm log này
    updateStandings(updatedMatches);
};

const saveResults = async () => {
  try {
      setLoading(true);
      console.log("Saving results..."); // Thêm log này

      const convertedMatches = matches.reduce((acc, match) => {
          const roundNumber = match.round;
          
          if (!acc[roundNumber]) {
              acc[roundNumber] = [];
          }

          acc[roundNumber].push({
              matchNumber: acc[roundNumber].length + 1,
              team1Id: match.homeTeam.teamId,
              team2Id: match.awayTeam.teamId,
              score1: match.homeScore !== null ? parseInt(match.homeScore) : null,
              score2: match.awayScore !== null ? parseInt(match.awayScore) : null,
              Time: match.Time || null,
              Location: match.Location || null,
          });

          return acc;
      }, {});

      console.log("Converted matches for saving:", convertedMatches); // Thêm log này

      if (Object.keys(convertedMatches).length > 0) {
          const data = {
              tournamentId: parseInt(tournamentId),
              matches: convertedMatches,
          };

          const response = await saveTournamentResults(data);

          if (response && response.data && response.data.success) {
              setEditMode(false);
              toast.success('Đã cập nhật thông tin trận đấu');
              console.log("Calling updateStandings after save"); // Thêm log này
              updateStandings(matches);
          } else {
              toast.error('Lỗi cập nhật thông tin trận đấu');
          }
      } else {
          toast.success('Không có gì thay đổi.');
      }

  } catch (err) {
      toast.error('Lỗi cập nhật thông tin trận đấu: ' + err.message);
  } finally {
      setLoading(false);
  }
};

  const getUniqueRounds = () => {
    return [...new Set(matches.map(match => match.round))].sort((a, b) => a - b);
  };
  if (loading) return <div className={styles.loading}>Loading...</div>;
  if (error) return <div className={styles.error}>Error: {error}</div>;

  return (
    <div>
      <Hearder />
    <div className={styles.container}>
      
      <h1 className={styles.title}>Giải Đấu Vòng Tròn</h1>

      <div className={styles.controls}>
  
</div>


      {/* Bảng xếp hạng */}
      {/* Bảng xếp hạng */}
      <div className={styles.standingsSection}>
  <h2>Bảng Xếp Hạng</h2>
  {console.log("Current standings:", standings)}
  <table className={styles.standingsTable}>
    <thead>
      <tr>
        <th>Hạng</th>
        <th>Đội</th>
        <th>Trận</th>
        <th>Thắng</th>
        <th>Hòa</th>
        <th>Thua</th>
        <th>BT</th>
        <th>BB</th>
        <th>HS</th>
        <th>Điểm</th>
      </tr>
    </thead>
    <tbody>
      {standings.map((team, index) => (
        <tr key={team.id}>
        <td>{index + 1}</td>
        <td className={styles.teamNameColumn}>{team.name}</td>
        <td>{team.played}</td>
        <td>{team.won}</td>
        <td>{team.drawn}</td>
        <td>{team.lost}</td>
        <td>{team.goalsFor}</td>
        <td>{team.goalsAgainst}</td>
        <td className={`
          ${styles.goalDifference}
          ${team.goalsFor - team.goalsAgainst > 0 ? styles.positive : 
            team.goalsFor - team.goalsAgainst < 0 ? styles.negative : ''}
        `}>
          {team.goalsFor - team.goalsAgainst}
        </td>
        <td className={styles.points}>{team.points}</td>
      </tr>
      ))}
    </tbody>
  </table>
</div>

      {/* Lịch thi đấu */}
      <div className={styles.matchesSection}>
        <h2>Lịch Thi Đấu</h2>
        <div className={styles.roundSelector}>
          {getUniqueRounds().map(round => (
            <button
              key={round}
              className={`${styles.roundButton} ${currentRound === round ? styles.active : ''}`}
              onClick={() => setCurrentRound(round)}
            >
              Vòng {round}
            </button>
          ))}
        </div>

        <div className={styles.matches}>
          {matches
            .filter(match => match.round === currentRound)
            .map((match, index) => (
              <div key={index} className={styles.match}>
                <div className={styles.teamBlock}>
                  <span className={styles.teamName}>{match.homeTeam.name}</span>
                </div>
                <div className={styles.scoreBlock}>
                  <input
                    type="number"
                    value={match.homeScore ?? ''}
                    onChange={(e) => {
                      if (editMode) {
                        const matchIndex = matches.findIndex(m =>
                          m.round === match.round &&
                          m.homeTeam.id === match.homeTeam.id &&
                          m.awayTeam.id === match.awayTeam.id
                        );
                        updateScore(matchIndex, e.target.value, match.awayScore);
                      }
                    }}
                    className={styles.scoreInput}
                    disabled={!editMode}
                    min="0"
                  />
                  <span className={styles.separator}>-</span>
                  <input
                    type="number"
                    value={match.awayScore ?? ''}
                    onChange={(e) => {
                      if (editMode) {
                        const matchIndex = matches.findIndex(m =>
                          m.round === match.round &&
                          m.homeTeam.id === match.homeTeam.id &&
                          m.awayTeam.id === match.awayTeam.id
                        );
                        updateScore(matchIndex, match.homeScore, e.target.value);
                      }
                    }}
                    className={styles.scoreInput}
                    disabled={!editMode}
                    min="0"
                  />
                </div>
                <div className={styles.teamBlock}>
                  <span className={styles.teamName}>{match.awayTeam.name}</span>
                </div>
              </div>
            ))}
        </div>
      </div>

    </div>
    
    <ToastContainer 
    position="top-right"
    autoClose={5000}
    hideProgressBar={false}
    newestOnTop={false}
    closeOnClick
    rtl={false}
    pauseOnFocusLoss
    draggable
    pauseOnHover
  />
     <Footer />
    </div>
  );
};

export default RoundRobinTournament;