import React from 'react';
import styles from './EventItem.module.css';
import { useNavigate } from 'react-router-dom';
const EventItem = ({ type, title, level, location, participants, image }) => {
  const navigate = useNavigate();

  const handleButtonClick = (href) => {
    if (href !== '#') {
      navigate(href);
    }
  };
  return (
    <article className={styles.eventItem}>
      <img src={image} alt="" className={styles.eventImage} />
      <div className={styles.eventContent}>
        <h3 className={styles.eventType}>
          {type === 'BÓNG ĐÁ' && <span className={styles.eventIcon}>⚽</span>}
          {type === 'CẦU LÔNG' && <span className={styles.eventIcon}>🏸</span>}
          {type === 'PICKLEBALL' && <img src="https://cdn.builder.io/api/v1/image/assets/TEMP/ab9ff22713f712f38f603f95c97bf89e418c432d4bf87ade5058d5b3c48587d0?placeholderIfAbsent=true&apiKey=64a11f7ccf9c4f09a01cd9aadc1c5dac" alt="" className={styles.eventIcon} />}
          {type}
        </h3>
        <h4 className={styles.eventTitle}>{title}</h4>
        <p className={styles.eventLevel}>Trình độ: {level}</p>
        <p className={styles.eventLocation}>
          <img src="https://cdn.builder.io/api/v1/image/assets/TEMP/67584d32e2d5f94a86a73a7f5ccbd5afffb2b578b94fba80627caddf2964c13f?placeholderIfAbsent=true&apiKey=64a11f7ccf9c4f09a01cd9aadc1c5dac" alt="" className={styles.locationIcon} />
          {location}
        </p>
        <p className={styles.eventParticipants}>
          <img src="https://cdn.builder.io/api/v1/image/assets/TEMP/8ffcb3e3c3c1c652965ce1a52390935f85298d7b2efe6c6296f48d1d7c35b6fe?placeholderIfAbsent=true&apiKey=64a11f7ccf9c4f09a01cd9aadc1c5dac" alt="" className={styles.participantsIcon} />
          {participants}
        </p>
      </div>
      <button className={styles.moreButton} onClick={() => handleButtonClick('/detailmatch')}>More</button>
    </article>
  );
};

export default EventItem;