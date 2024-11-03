import axios from "axios";
import configuration from "./config";
const getAllActivity = () =>
    axios(
      configuration({
        method: "get",
        path: "/Activity/getAllActivity",
      })
    );

export {
    getAllActivity,
  };