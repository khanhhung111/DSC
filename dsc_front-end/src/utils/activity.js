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
const getMyActivity = (userId) =>
      axios(
        configuration({
          method: "get",
          path: "/Activity/getMyActivity",
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
const getMemberActivity = (activityId) =>
        axios(
          configuration({
            method: "get",
            path: `/Activity/getMemberActivity/${activityId}`,
          })
        );
export {
    getAllActivity,
    getDetailActivity,
    getMemberActivity,
    getMyActivity
  };