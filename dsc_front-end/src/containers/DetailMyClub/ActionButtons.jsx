import styles from './ActionButtons.module.css';
import { useNavigate } from 'react-router-dom';

function ActionButtons({ matchData }) {
  const navigate = useNavigate();
  const data = matchData;

  const handleButtonClick = (href) => {
    if (href) {
      navigate(href);
    }
  };

  return (
    <div className={styles.actionButtons}>
      <button
        className={styles.button}
        onClick={() => handleButtonClick(`/updatesportevent/${data?.activityId}`)}
      >
        Chỉnh Sửa
      </button>
      <button
        className={styles.button}
        onClick={() => handleButtonClick(`/membermyclub/${data?.clubId}`)}
      >
        Thành Viên
      </button>
      <button
        className={styles.button}
        onClick={() => handleButtonClick(`/approvemember/${data?.activityId}`)}
      >
        Kèo
      </button>
      <button
        className={`${styles.button} ${styles.stopButton}`} // class thêm cho nút dừng hoạt động
        onClick={() => handleButtonClick('/resultmatch')}
      >
        Dừng Hoạt Động
      </button>
    </div>
  );
}

export default ActionButtons;
