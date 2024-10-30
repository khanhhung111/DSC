import React from 'react';
import EventItem from './EventItem';
import styles from './EventList.module.css';

const EventList = () => {
  const events = [
    {
      type: 'BÓNG ĐÁ',
      title: 'Giao lưu với team Rồng đen',
      level: 'Trung bình',
      location: 'Địa điểm',
      participants: '1/2 người/đội đã tham gia',
      image: 'https://cdn.builder.io/api/v1/image/assets/TEMP/7aca96e38981607f4b4865e9a1373a68a02bd1037bc0fbb4a5ce4a4467cfef0d?placeholderIfAbsent=true&apiKey=64a11f7ccf9c4f09a01cd9aadc1c5dac'
    },
    {
      type: 'CẦU LÔNG',
      title: 'Giao lưu đơn nam',
      level: 'Khá',
      location: 'Địa điểm',
      participants: '4/8 người/đội đã tham gia',
      image: 'https://cdn.builder.io/api/v1/image/assets/TEMP/7aca96e38981607f4b4865e9a1373a68a02bd1037bc0fbb4a5ce4a4467cfef0d?placeholderIfAbsent=true&apiKey=64a11f7ccf9c4f09a01cd9aadc1c5dac'
    },
    {
      type: 'PICKLEBALL',
      title: 'Mới chơi Pickleball',
      level: 'Nhập môn',
      location: 'Địa điểm',
      participants: '3/8 người/đội đã tham gia',
      image: 'https://cdn.builder.io/api/v1/image/assets/TEMP/7aca96e38981607f4b4865e9a1373a68a02bd1037bc0fbb4a5ce4a4467cfef0d?placeholderIfAbsent=true&apiKey=64a11f7ccf9c4f09a01cd9aadc1c5dac'
    }
  ];

  return (
    <section className={styles.eventList}>
      <div className={styles.timeColumn}>
        <div className={styles.timeSlot}>16:00</div>
        <div className={styles.timeSlot}>17:00</div>
      </div>
      <div className={styles.eventColumn}>
        {events.map((event, index) => (
          <EventItem key={index} {...event} />
        ))}
      </div>
    </section>
  );
};

export default EventList;