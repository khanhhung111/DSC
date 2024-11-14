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
const getrequestJoinActivity = (activityId) =>
  axios(
    configuration({
      method: "get",
      path: `/Activity/getrequestJoinActivity/${activityId}`,
    })
  );
  const acceptrequestJoinActivity = (RequestJoinActivityId, UserId) => {
    return axios(
      configuration({
        method: "POST",
        path: "/Activity/acceptrequestJoinActivity",
        data: {
          RequestJoinActivityId, UserId
        },
      })
    )
      .then((result) => result)
      .catch((error) => error);
  };
  const cancelrequestJoinActivity = (RequestJoinActivityId, UserId) => {
    return axios(
      configuration({
        method: "POST",
        path: "/Activity/cancelrequestJoinActivity",
        data: {
          RequestJoinActivityId, UserId
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
    getrequestJoinActivity,
    acceptrequestJoinActivity,
    cancelrequestJoinActivity,
    createActivity,
    uppdateActivity,
    requestJoinClub
  };