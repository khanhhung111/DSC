import React from "react";
import styles from "./MemberMatch.module.css";

function ParticipantList({ memberdata }) {
  const data = memberdata?.memberInfo?.$values || []; // Lấy mảng các thành viên từ API

  return (
    <section className={styles.participantSection}>
      <h2 className={styles.sectionTitle}>Danh sách thành viên</h2>
      <ul className={styles.participantList}>
        {data.map((participant, index) => (
          <li key={index} className={styles.participantItem}>
            <img
              src={"https://cdn.builder.io/api/v1/image/assets/TEMP/50853265154f5d63067e64f710fa527ace98511e05967c947d8eabed1d8d8406?placeholderIfAbsent=true&apiKey=64a11f7ccf9c4f09a01cd9aadc1c5dac" || "/default-avatar.png"} // Đặt avatar mặc định nếu không có ảnh
              alt={`${participant.fullName}'s avatar`}
              className={styles.participantAvatar}
            />
            <div className={styles.participantInfo}>
              <h3 className={styles.participantName}>{participant.fullName}</h3>
              <p className={styles.participantDetails}>
                Chức năng: {participant.roleActivity} • Trình độ: {participant.levelName}
              </p>
            </div>
          </li>
        ))}
      </ul>
    </section>
  );
}

export default ParticipantList;
