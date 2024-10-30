import axios from "axios";
import configuration from "./config";

const signUp = ({
  email,
  password
}) => {
  return axios(
    configuration({
      method: "POST",
      path: "/Authen/Register",
      data: {
        email,
        password
      },
    })
  )
    .then((result) => result)
    .catch((error) => error);
};

const login = (username, passwd) => {
  return axios(
    configuration({
      method: "post",
      path: "/auth/login",
      data: { username, passwd },
    })
  )
    .then((result) => result.data)
    .catch((error) => error);
};
const changePass = ({ data }) => {
  return  axios(
      configuration({
        method: 'post',
        path: '/customer/changePassword',
        data: data,
      })
    );
}
const changePassGua = ({ data }) =>
  axios(
    configuration({
      method: 'post',
      path: '/guard/changePassword',
      data: data,
    })
  );
export { signUp, login, changePass, changePassGua };
