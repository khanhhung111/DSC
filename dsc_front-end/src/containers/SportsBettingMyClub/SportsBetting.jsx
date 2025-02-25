import React from 'react';
import HeaderLogin from '../../components/Header/Hearder';
import SegmentedButton from './SegmentedButton';
import EventList from './EventList';
import Footer from '../../components/Footer/Footer';
import styles from './SportsBetting.module.css';
import { useParams } from 'react-router-dom';
import { useNavigate } from 'react-router-dom';

const SportsBetting = () => {
  const { clubId } = useParams();
  const navigate = useNavigate();
  return (
    <div className={styles.sportsBetting}>
      <HeaderLogin />
      <div className={styles.bannerContainer}>
        <img
          src="https://cdn.builder.io/api/v1/image/assets/TEMP/73697ede93124dea36ec63cd0d105c568819e769f86fa52d92e3a5690a5d212c?placeholderIfAbsent=true&apiKey=64a11f7ccf9c4f09a01cd9aadc1c5dac"
          alt=""
          className={styles.bannerImage}
        />
        <div className={styles.bannerContent}>
          <h2 className={styles.bannerTitle}>Kèo Câu Lạc Bộ</h2>
          <div className={styles.buttonGroup}>
            <button className={styles.secondaryButton} onClick={() => navigate('#')}>Tất cả các kèo trong CLB</button>
            {/* <button className={styles.primaryButton} onClick={() => navigate('/management-betting')}>Quản lý kèo CLB của tôi</button> */}
          </div>
        </div>
        </div>
      <main className={styles.mainContent}>
        {/* <SegmentedButton /> */}
        <EventList />
      </main>
      <Footer />
    </div>
  );
};

export default SportsBetting;