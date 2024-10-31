import React, { useEffect, useState } from 'react';
import styles from './Header.module.css';
import NavigationPill from '../NavigationPill/NavigationPill';
import Button from '../Button/Button';
import { useNavigate } from 'react-router-dom';

const navItems = [
  { text: 'Kèo thể thao', href: '/sportbetting' },
  { text: 'Giải đấu', href: '#' },
  { text: 'Câu lạc bộ', href: '/club' },
  { text: 'Thông báo', href: '#' },
];

function Header() {
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



  return (
    <header className={styles.header}>
      <nav className={styles.navigation}>
        {navItems.map((item, index) => (
          <NavigationPill key={index} text={item.text} href={item.href} />
        ))}
      </nav>
      <div className={styles.logo}>
        <img 
          src="https://cdn.builder.io/api/v1/image/assets/TEMP/2bd87701f8e5de31409290c62870400ced251ecd3f5895c6c336318f1e3231eb?placeholderIfAbsent=true&apiKey=64a11f7ccf9c4f09a01cd9aadc1c5dac" 
          alt="DSC Logo" 
          className={styles.logoImage} 
        />
        <span className={styles.logoText}>DSC</span>
      </div>
      
      {isLoggedIn ? (
        <div className={styles.userContainer}>
          <img
            src="https://cdn.builder.io/api/v1/image/assets/TEMP/d49291d2c7f0206b44d14e01258fdaeccb10182cc5eb928d0344d1ccfa220d40?placeholderIfAbsent=true&apiKey=64a11f7ccf9c4f09a01cd9aadc1c5dac"
            alt="Avatar"
            className={styles.logoIcon}
            onClick={() => navigate('/account')}
            style={{ cursor: 'pointer' }}
          />
          <span className={styles.userName}>{userfullName}</span>
          {/* <Button onClick={handleLogout} variant="secondary">Đăng xuất</Button> */}
        </div>
      ) : (
        <div className={styles.authButtons}>
          <Button onClick={() => navigate('/signup')}>Đăng ký</Button>
          <Button onClick={() => navigate('/login')} variant="secondary">Đăng nhập</Button>
        </div>
      )}
    </header>
  );
}

export default Header;