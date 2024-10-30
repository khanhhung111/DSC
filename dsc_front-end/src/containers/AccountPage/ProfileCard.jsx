import React from "react";
import styles from './ProfileCard.module.css';

function ProfileCard() {
  return (
    <div className={styles.profileCard}>
      <img src="https://cdn.builder.io/api/v1/image/assets/TEMP/6bc8d1ef7ef6beb9a8f62d9a9760725d3ae3ce0003da0601a02b4778efb767c8?placeholderIfAbsent=true&apiKey=64a11f7ccf9c4f09a01cd9aadc1c5dac" alt="User profile" className={styles.profileImage} />
      <div className={styles.profileInfo}>
        <div className={styles.divider} />
        <p className={styles.userName}>Tên: Hung</p>
      </div>
      <button className={styles.logoutButton}>Đăng xuất</button>
    </div>
  );
}

export default ProfileCard;