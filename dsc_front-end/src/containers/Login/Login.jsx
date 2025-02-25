import React from "react";
import LoginForm from "./LoginForm";
import styles from "./Login.module.css";
import Header from "../../components/Header/Hearder";
import { ToastContainer, toast } from 'react-toastify';
import 'react-toastify/dist/ReactToastify.css';
import { GoogleLogin } from '@react-oauth/google';
import { jwtDecode } from 'jwt-decode';
function Login() {
  const socialButtons = [
    {
      name: "Facebook",
      icon: "https://cdn.builder.io/api/v1/image/assets/TEMP/2b938d459ab07f076de5460d2a50b950a2c66ae6f777acddb7252066065529b2?placeholderIfAbsent=true&apiKey=64a11f7ccf9c4f09a01cd9aadc1c5dac",
      text: "Sign up with Facebook",
    },
    {
      name: "Google",
      icon: "https://cdn.builder.io/api/v1/image/assets/TEMP/202a80eb418dc9ecd2760ef5ef914f979adfb5b7d3bc976c3f0e387d4bf8ff84?placeholderIfAbsent=true&apiKey=64a11f7ccf9c4f09a01cd9aadc1c5dac",
      text: "Sign up with Google",
    },
  ];

  const handleGoogleLoginSuccess = (credentialResponse) => {
    const decoded = jwtDecode(credentialResponse.credential);
      
      const userData = {
        givenName: decoded.given_name,
        email: decoded.email,
        name: decoded.name
      };

    console.log("userData",userData);
    // Ở đây bạn có thể xử lý thông tin đăng nhập, ví dụ gửi lên server hoặc lưu vào state
    toast.success("Logged in successfully with Google!");
  };

  const handleGoogleLoginError = () => {
    toast.error("Google login failed. Please try again.");
  };

  return (
    <>
      <main className={styles.LoginPage}>
        <Header />
        <section className={styles.content}>
          <div className={styles.imageColumn}>
            <img
              src="https://cdn.builder.io/api/v1/image/assets/TEMP/255f5eca8824e2d619f5f131553022d6e189910b11a9c89b765ec9a6d0cd580f?placeholderIfAbsent=true&apiKey=64a11f7ccf9c4f09a01cd9aadc1c5dac"
              alt="Sign up illustration"
              className={styles.LoginImage}
            />
          </div>
          <div className={styles.formColumn}>
            <LoginForm />
            <section className={styles.socialLogin}>
              {socialButtons.map((button, index) => (
                button.name === "Google" ? (
                  <GoogleLogin
                    key={index}
                    onSuccess={handleGoogleLoginSuccess}
                    onError={handleGoogleLoginError}
                    useOneTap
                    render={(renderProps) => (
                      <button 
                        className={styles.socialButton}
                        onClick={renderProps.onClick}
                        disabled={renderProps.disabled}
                      >
                        <img src={button.icon} alt={`${button.name} icon`} className={styles.socialIcon} />
                        <span>{button.text}</span>
                      </button>
                    )}
                  />
                ) : (
                  <button 
                    key={index} 
                    className={styles.socialButton}
                    disabled={true}
                  >
                    <img src={button.icon} alt={`${button.name} icon`} className={styles.socialIcon} />
                    <span>{button.text}</span>
                  </button>
                )
              ))}
            </section>
          </div>
        </section>
      </main>
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
    </>
  );
}

export default Login;