import axios from "axios";
import configuration from "./config";

const getInfo = ({
  email
}) => {
  return axios(
    configuration({
      method: "POST",
      path: "/User/getinfor",
      data: {
        email
      },
    })
  )
    .then((result) => result)
    .catch((error) => error);
  };
const updateInfo = ({
    email, updatedInfo
  }) => {
    return axios(
      configuration({
        method: "POST",
        path: "/User/updateinfor",
        data: { email, ...updatedInfo },
      })
    )
      .then((result) => result)
      .catch((error) => error);
    };
const updateInfoGua = ({ userId, data }) =>
  axios({
    method: 'post',
    url: `http://guardsystem.site:3000/guard/changeinfor/${userId}`,
    data,
  });
const updateImgCus = ({ userId, data }) =>
  axios({
    method: 'post',
    url: `http://guardsystem.site:3000/customer/changeimg/${userId}`,
    data,
  });
const updateImgGua = ({ userId, data }) =>
  axios({
    method: 'post',
    url: `http://guardsystem.site:3000/guard/changeimg/${userId}`,
    data,
  });

export { getInfo, updateInfo, updateImgCus, updateImgGua, updateInfoGua };
