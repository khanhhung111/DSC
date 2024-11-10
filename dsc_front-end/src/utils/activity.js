import axios from "axios";
import configuration from "./config";
const getAllActivity = (userId) =>
    axios(
      configuration({
        method: "get",
        path: "/Activity/getAllActivity",
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
const getDetailActivity = (activityId) =>
      axios(
        configuration({
          method: "get",
          path: `/Activity/getActivityDetails/${activityId}`,
        })
      );
const getMyActivity = (userId) =>
  axios(
    configuration({
      method: "get",
      path: `/Activity/getMyActivity`,
      params: { userId },
    })
  );      
const getMemberActivity = (activityId) =>
        axios(
          configuration({
            method: "get",
            path: `/Activity/getMemberActivity/${activityId}`,
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
  const requestJoinActivity = (userId, activityId) => {
    return axios(
      configuration({
        method: "POST",
        path: "/Activity/requestJoinActivity",
        data: {
          userId, activityId
        },
      })
    )
      .then((result) => result)
      .catch((error) => error);
  };
  
export {
    getAllActivity,
    getDetailActivity,
    getMemberActivity,
    getActivityJoined,
    getMyActivity,
    getrequestJoinActivity,
    acceptrequestJoinActivity,
    cancelrequestJoinActivity,
    createActivity,
    uppdateActivity,
    requestJoinActivity
  };