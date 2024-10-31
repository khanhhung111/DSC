import React from 'react';
import Hearder from '../../components/Header/Hearder'
import SportSelection from './SportSelection';
import EventTypeSelection from './EventTypeSelection';
import KeoForm from './KeoForm';
import CreateEventButton from './CreateEventButton';
import Footer from '../../components/Footer/Footer';
import styles from './CreateSportEvent.module.css';
import { useNavigate } from 'react-router-dom';

function CreateSportEvent() {
  const navigate = useNavigate();
  return (
    <div className={styles.createSportEvent}>
      <Hearder />
      <div className={styles.bannerContainer}>
        <img
          src="https://cdn.builder.io/api/v1/image/assets/TEMP/73697ede93124dea36ec63cd0d105c568819e769f86fa52d92e3a5690a5d212c?placeholderIfAbsent=true&apiKey=64a11f7ccf9c4f09a01cd9aadc1c5dac"
          alt=""
          className={styles.bannerImage}
        />
        <div className={styles.bannerContent}>
          <h2 className={styles.bannerTitle}>Kèo thể thao</h2>
          <p className={styles.bannerSubtitle}>Subtitle</p>
          <div className={styles.buttonGroup}>
            <button className={styles.primaryButton} onClick={() => navigate('/sportbetting')}>Tất cả các kèo thể thao</button>
            <button className={styles.secondaryButton} onClick={() => navigate('/management-betting')}>Quản lý kèo thể thao của tôi</button>
          </div>
        </div>
      </div>
      <main className={styles.mainContent}>
        <h1 className={styles.title}>Tạo kèo</h1>
        <section className={styles.sportSelection}>
          <h2 className={styles.sectionTitle}>MÔN THỂ THAO</h2>
          <SportSelection />
        </section>
        <section className={styles.eventTypeSelection}>
          <EventTypeSelection />
        </section>
        <section className={styles.eventForm}>
          <KeoForm />
        </section>
        <CreateEventButton />
      </main>
      <Footer />
    </div>
  );
}

export default CreateSportEvent;