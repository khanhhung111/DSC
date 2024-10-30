import React from "react";
import styles from "./ClubItem.module.css";

function ClubItem({ name, members, level, description, imageUrl }) {
  return (
    <article className={styles.clubItem}>
      <img src={imageUrl} alt={`${name} logo`} className={styles.clubLogo} />
      <div className={styles.clubInfo}>
        <h2 className={styles.clubName}>{name}</h2>
        <p className={styles.clubDetails}>
          {members} thành viên • {level}
        </p>
        <p className={styles.clubDescription}>Mô tả: {description}</p>
      </div>
      <button className={styles.viewMoreButton}>Xem thêm</button>
    </article>
  );
}

export default ClubItem;
