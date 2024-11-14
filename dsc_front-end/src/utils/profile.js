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
    const updateInfoImg = ({ email, updatedInfo, file }) => {
      const formData = new FormData();
      formData.append("email", email);
    
      // Thêm các thông tin cập nhật vào formData
      Object.keys(updatedInfo).forEach((key) => {
        formData.append(key, updatedInfo[key]);
      });
    
      // Chỉ thêm file nếu có
      if (file) {
        formData.append("file", file);
      } else {
        // Thêm một file rỗng hoặc null để tránh lỗi required
        formData.append("file", new Blob(), '');
      }
    
      return axios(
        configuration({
          method: "POST",
          path: "/User/updateinforimg",
          data: formData,
          headers: {
            "Content-Type": "multipart/form-data",
          },
        })
      )
        .then((result) => result)
        .catch((error) => error);
    };

const changePassword = ({
  Email, Password, NewPassword
}) => {
  return axios(
    configuration({
      method: "POST",
      path: "/User/changepassword",
      data: { Email, Password, NewPassword },
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

export { getInfo, updateInfo,changePassword, updateImgCus, updateImgGua, updateInfoGua,updateInfoImg };
