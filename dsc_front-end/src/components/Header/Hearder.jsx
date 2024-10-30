import React from 'react';
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
  

  return (
    <header className={styles.header}>
      <nav className={styles.navigation}>
        {navItems.map((item, index) => (
          <NavigationPill key={index} text={item.text} href={item.href} />
        ))}
      </nav>
      <div className={styles.logo}>
        <img src="https://cdn.builder.io/api/v1/image/assets/TEMP/2bd87701f8e5de31409290c62870400ced251ecd3f5895c6c336318f1e3231eb?placeholderIfAbsent=true&apiKey=64a11f7ccf9c4f09a01cd9aadc1c5dac" alt="DSC Logo" className={styles.logoImage} />
        <span className={styles.logoText}>DSC</span>
      </div>
      <div className={styles.authButtons}>
        <Button onClick={() => navigate('/signup')}>Đăng ký</Button>
        <Button onClick={() => navigate('/login')} variant="secondary">Đăng nhập</Button>
      </div>
    </header>
  );
}

export default Header;
