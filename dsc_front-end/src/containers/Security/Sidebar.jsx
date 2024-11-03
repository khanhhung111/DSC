import React, { useEffect, useState } from 'react';
import styles from './Sidebar.module.css';
import { useNavigate } from 'react-router-dom';
const Sidebar = ({ fullname }) => {
  const navigate = useNavigate();
  const [isLoggedIn, setIsLoggedIn] = useState(false);
  const [userEmail, setUserEmail] = useState('');
  const [userfullName, setfullName] = useState('');
  useEffect(() => {
    // Kiểm tra trạng thái đăng nhập khi component mount
    const checkLoginStatus = () => {
      const loginStatus = localStorage.getItem('isLoggedIn') === 'true';
      const fullname = localStorage.getItem('fullName');
      const email = localStorage.getItem('userEmail');
      setIsLoggedIn(loginStatus);
      if (email) setUserEmail(email);
      if(fullname) setfullName(fullname)
    };

    checkLoginStatus();
    // Theo dõi thay đổi trong localStorage
    window.addEventListener('storage', checkLoginStatus);
    
    return () => {
      window.removeEventListener('storage', checkLoginStatus);
    };
  }, []);
  const handleLogout = () => {
    localStorage.removeItem('userEmail');
    localStorage.removeItem('userId');
    localStorage.removeItem('isLoggedIn');
    localStorage.removeItem('fullName')
    setIsLoggedIn(false);
    setUserEmail('');
    setfullName('');
    navigate('/login');
  };
  return (
    <aside className={styles.sidebar}>
      <img 
        loading="lazy" 
        src="https://cdn.builder.io/api/v1/image/assets/TEMP/6bc8d1ef7ef6beb9a8f62d9a9760725d3ae3ce0003da0601a02b4778efb767c8?placeholderIfAbsent=true&apiKey=64a11f7ccf9c4f09a01cd9aadc1c5dac" 
        alt="User Avatar" 
        className={styles.avatar} 
      />
      <div className={styles.userInfo}>
        <hr className={styles.divider} />
        <p className={styles.userName}>Tên: {fullname}</p> {/* Sử dụng fullname từ props */}
      </div>
      <button onClick={handleLogout} className={styles.logoutButton}>Đăng xuất</button>
    </aside>
  );
};

export default Sidebar;