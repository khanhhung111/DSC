import React from 'react';
import styles from './EventTypeSelection.module.css';

const eventTypes = ['Giao hữu', 'Buổi tập', 'Buổi học', 'Thi đấu', 'Họp mặt'];

function EventTypeSelection() {
  return (
    <div className={styles.eventTypeGrid}>
      {eventTypes.map((type, index) => (
        <button key={index} className={styles.eventTypeButton}>{type}</button>
      ))}
    </div>
  );
}

export default EventTypeSelection;