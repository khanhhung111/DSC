import React, { useState, useEffect } from 'react';
import EventItem from './EventItem';
import styles from './EventList.module.css';
import { toast } from 'react-toastify';
import { getMyActivity } from "../../utils/activity"; // Giả sử đây là API call

const EventList = () => {
  const [events, setEvents] = useState([]);  // Khởi tạo events là một mảng rỗng
  const [loading, setLoading] = useState(true); // State để quản lý trạng thái loading
  const userId = localStorage.getItem('userId');
  useEffect(() => {
    const fetchActivity = async () => {
      try {
        setLoading(true); // Bắt đầu loading
        const response = await getMyActivity( userId ); // Gửi request để lấy dữ liệu
        if (response.data) {
          if (response.data.$values && Array.isArray(response.data.$values)) {
            setEvents(response.data.$values); 
            console.log("datane",response.data.$values);
          } else {
            console.error('Dữ liệu không phải là một mảng:', response.data);
            toast.error('Dữ liệu sự kiện không đúng định dạng');
          }
        }
      } catch (error) {
        console.error('Error fetching events:', error);
        toast.error('Không thể tải thông tin sự kiện'); // Thông báo lỗi
      } finally {
        setLoading(false); // Kết thúc loading
      }
    };

    fetchActivity(); // Gọi hàm fetchActivity khi component được mount
  }, []);

  if (loading) {
    return <div>Loading...</div>; // Hiển thị loading khi đang tải dữ liệu
  }

  if (events.length === 0) {
    return <div>Không có sự kiện nào</div>; // Thông báo nếu không có sự kiện
  }

  const groupEventsByDate = (events) => {
    // Đảm bảo events là mảng và không rỗng
    if (!Array.isArray(events) || events.length === 0) return [];
  
    const grouped = events.reduce((groups, event) => {
      // Kiểm tra startDate tồn tại
      if (!event.startDate) return groups;
  
      const date = new Date(event.startDate).toLocaleDateString();
      if (!groups[date]) {
        groups[date] = [];
      }
      groups[date].push(event);
      return groups;
    }, {});
  
    return Object.entries(grouped).sort(([dateA], [dateB]) => {
      return new Date(dateA) - new Date(dateB);
    });
  };
  
  return (
    <section className={styles.eventList}>
      {groupEventsByDate(events).map(([date, dailyEvents]) => (
        <div key={date} className={styles.dayGroup}>
          <h2 className={styles.dateHeader}>
            {new Date(date).toLocaleDateString('vi-VN', {
              weekday: 'long',
              year: 'numeric',
              month: 'long',
              day: 'numeric'
            })}
          </h2>
          <div className={styles.dayContent}>
            <div className={styles.timeColumn}>
              {dailyEvents.map((event, index) => (
                <div key={index} className={styles.timeSlot}>
                  {new Date(event.startDate).toLocaleTimeString([], {
                    hour: '2-digit',
                    minute: '2-digit'
                  })}
                </div>
              ))}
            </div>
            <div className={styles.eventColumn}>
              {dailyEvents.map((event, index) => (
                <EventItem
                  key={index}
                  activityId= {event.activityId}
                  activityName={event.activityName}
                  startDate={event.startDate}
                  location={event.location}
                  numberOfTeams={event.numberOfTeams}
                  expense={event.expense}
                  description={event.description}
                  levelname={event.levelName}
                />
              ))}
            </div>
          </div>
        </div>
      ))}
    </section>
  );
};

export default EventList;