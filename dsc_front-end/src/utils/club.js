import axios from "axios";
import configuration from "./config";
const getAllClub = (userId) =>
    axios(
      configuration({
        method: "get",
        path: "/Club/getAllClub",
        params: { userId },
      })
    );
const getActivityJoined = (userId) =>
      axios(
        configuration({
          method: "get",
          path: "/Activity/getActivityJoined",
          params: { userId },
        })
      );
const getDetailClub = (clubId) =>
      axios(
        configuration({
          method: "get",
          path: `/Club/getDetailClub/${clubId}`,
        })
      );
const getMyClub = (userId) =>
  axios(
    configuration({
      method: "get",
      path: `/Club/getMyClub`,
      params: { userId },
    })
  );      
const getMemberClub = (ClubId) =>
        axios(
          configuration({
            method: "get",
            path: `/Club/getMemberClub/${ClubId}`,
          })
        );
const getrequestJoinClub = (clubId) =>
  axios(
    configuration({
      method: "get",
      path: `/Club/getrequestJoinClub/${clubId}`,
    })
  );
  const acceptrequestJoinClub = (requestClubId, UserId) => {
    return axios(
      configuration({
        method: "POST",
        path: "/Club/acceptrequestJoinClub",
        data: {
          requestClubId, UserId
        },
      })
    )
      .then((result) => result)
      .catch((error) => error);
  };
  const cancelrequestJoinClub = (requestClubId, UserId) => {
    return axios(
      configuration({
        method: "POST",
        path: "/Club/cancelrequestJoinClub",
        data: {
          requestClubId, UserId
        },
      })
    )
      .then((result) => result)
      .catch((error) => error);
  };
  const createActivity = (eventData) => {
    return axios(
      configuration({
        method: "POST",
        path: "/Activity/createActivity",
        data:
          eventData,
      })
    )
      .then((result) => result)
      .catch((error) => error);
  };
  const uppdateActivity = (eventData) => {
    return axios(
      configuration({
        method: "POST",
        path: "/Activity/uppdateActivity",
        data:
          eventData,
      })
    )
      .then((result) => result)
      .catch((error) => error);
  };
  const requestJoinClub = (userId, clubId) => {
    return axios(
      configuration({
        method: "POST",
        path: "/Club/requestJoinClub",
        data: {
          userId, clubId
        },
      })
    )
      .then((result) => result)
      .catch((error) => error);
  };
  
export {
    getAllClub,
    getDetailClub,
    getMemberClub,
    getActivityJoined,
    getMyClub,
    getrequestJoinClub,
    acceptrequestJoinClub,
    cancelrequestJoinClub,
    createActivity,
    uppdateActivity,
    requestJoinClub
  };