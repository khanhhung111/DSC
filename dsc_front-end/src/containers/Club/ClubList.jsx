import React from "react";
import ClubItem from "./ClubItem";
import styles from "./ClubList.module.css";

const clubsData = [
  {
    id: 1,
    name: "PickleBall Club",
    members: 70,
    level: "Tất cả trình độ",
    description: "Weekly Sunday",
    imageUrl:
      "https://cdn.builder.io/api/v1/image/assets/TEMP/94da0cf84f5eb343f8bc6cdb4b69649cbe87f64ff3f061fd39a44e80515c0240?placeholderIfAbsent=true&apiKey=64a11f7ccf9c4f09a01cd9aadc1c5dac",
  },
  {
    id: 2,
    name: "PickleBall Club",
    members: 70,
    level: "Tất cả trình độ",
    description: "Weekly Sunday",
    imageUrl:
      "https://cdn.builder.io/api/v1/image/assets/TEMP/9481bfceea552353a8498ad793fc7dc559126ff545e94048bbd0d8cf0ed9133b?placeholderIfAbsent=true&apiKey=64a11f7ccf9c4f09a01cd9aadc1c5dac",
  },
  {
    id: 3,
    name: "PickleBall Club",
    members: 70,
    level: "Tất cả trình độ",
    description: "Weekly Sunday",
    imageUrl:
      "https://cdn.builder.io/api/v1/image/assets/TEMP/9481bfceea552353a8498ad793fc7dc559126ff545e94048bbd0d8cf0ed9133b?placeholderIfAbsent=true&apiKey=64a11f7ccf9c4f09a01cd9aadc1c5dac",
  },
  {
    id: 4,
    name: "PickleBall Club",
    members: 70,
    level: "Tất cả trình độ",
    description: "Weekly Sunday",
    imageUrl:
      "https://cdn.builder.io/api/v1/image/assets/TEMP/9481bfceea552353a8498ad793fc7dc559126ff545e94048bbd0d8cf0ed9133b?placeholderIfAbsent=true&apiKey=64a11f7ccf9c4f09a01cd9aadc1c5dac",
  },
];

function ClubList() {
  return (
    <ul className={styles.clubList}>
      {clubsData.map((club) => (
        <li key={club.id}>
          <ClubItem {...club} />
        </li>
      ))}
    </ul>
  );
}

export default ClubList;
