import React from 'react';
import styles from './SportSelection.module.css';

const sports = [
  { emoji: '⚽', name: 'Bóng đá' },
  { emoji: '🏐', name: 'Bóng chuyền' },
  { emoji: '🏀', name: 'Bóng rổ' },
  { emoji: '🏸', name: 'Cầu lông' },
  { emoji: '🎱', name: 'Bida' },
];

function SportSelection() {
  return (
    <div className={styles.sportGrid}>
      {sports.map((sport, index) => (
        <button key={index} className={styles.sportButton}>
          <span className={styles.sportEmoji}>{sport.emoji}</span>
          <span className={styles.sportName}>{sport.name}</span>
        </button>
      ))}
      <button className={styles.sportButton}>
        <img src="https://cdn.builder.io/api/v1/image/assets/TEMP/64c214cd6179f71099eb3771f2dff6a3cbefad308d659c8938efbc95944ee1e5?placeholderIfAbsent=true&apiKey=64a11f7ccf9c4f09a01cd9aadc1c5dac" alt="" className={styles.sportIcon} />
        <span className={styles.sportName}>Pickleball</span>
      </button>
    </div>
  );
}

export default SportSelection;