import axios from "axios";
import configuration from "./config";
const createTournament = async (tournamentData) => {
  try {
    const response = await axios(configuration({
      method: "POST",
      path: "/Tournament/createTournament",
      data: tournamentData,
    }));
    return response;
  } catch (error) {
    throw error; // Để component xử lý lỗi
  }
};
const getAllTournament = (userId) =>
  axios(
    configuration({
      method: "get",
      path: "/Tournament/getAllTournament",
      params: { userId },
    })
  );
const getTournamentDetails = (tournamentId) =>
  axios(
    configuration({
      method: "get",
      path: `/Tournament/getTournamentDetails/${tournamentId}`,
    })
  );
const deleteTournament = (tournamentId) =>
  axios(
    configuration({
      method: "post",
      path: `/Tournament/deleteTournament/${tournamentId}`,
    })
  );

  const updateTounarment = (tournamentId, tournamentData) =>
    axios(
      configuration({
        method: "post",
        path: `/Tournament/updateTounarment/${tournamentId}`,
        data: tournamentData
      })
    );

export {
  createTournament,
  getAllTournament,
  getTournamentDetails,
  deleteTournament,
  updateTounarment
};