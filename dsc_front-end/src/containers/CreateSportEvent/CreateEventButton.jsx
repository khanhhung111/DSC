import React from 'react';
import styles from './CreateEventButton.module.css';

function CreateEventButton() {
  return (
    <button className={styles.createEventButton}>
      <img src="https://cdn.builder.io/api/v1/image/assets/TEMP/18e822f4ea87f4e651b0e37f7795dd7eb8583bd9bfeb31433fe8e50e896a010d?placeholderIfAbsent=true&apiKey=64a11f7ccf9c4f09a01cd9aadc1c5dac" alt="" className={styles.buttonIcon} />
      <span className={styles.buttonText}>TẠO KÈO</span>
    </button>
  );
}

export default CreateEventButton;