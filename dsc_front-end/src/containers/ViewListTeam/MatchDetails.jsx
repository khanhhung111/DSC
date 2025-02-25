import React from "react";
import styles from './MatchDetails.module.css';
import {amountFormatting} from '../../utils/formatHelper'
import { dateFormatting } from "../../utils/formatHelper";
import { EnvironmentOutlined, CalendarOutlined, UserOutlined } from "@ant-design/icons"; // Import icon từ Ant Design

function MatchDetails({matchData}) {
  const data = matchData[0];
  console.log("undefined",data)
  const formatDateForInput = (dateString) => {
    if (!dateString) return '';
    const date = new Date(dateString);
    return date.toISOString().split('T')[0];
  };
  return (
    <section className={styles.matchDetails}>
      <h1 className={styles.matchTitle}>{data?.name}</h1>
      <div className={styles.matchInfo}>
        <div className={styles.infoItem}>
  <span>
    <CalendarOutlined style={{color: "#faad14" }} />
    {data.startDate ? dateFormatting(data.startDate) : "Ngày bắt đầu không xác định"} - <CalendarOutlined style={{color: "#faad14" }} />
    {data.endDate ? dateFormatting(data.endDate) : "Ngày kết thúc không xác định"}
  </span>
</div>

       
      </div>
      <div className={styles.infoItem} style={{paddingBottom:'7px'}}>
      <EnvironmentOutlined style={{ marginRight: "8px", color: "#1890ff" }} />
          <span>{data.location}</span>
      </div>

      <UserOutlined style={{ marginRight: "8px", color: "green" }} />
      {data.numberOfTeams} đội - {data.memberOfTeams} thành viên / 1 đội

      <p className={styles.infoItem} style={{paddingTop:'5px'}}><CalendarOutlined style={{marginRight: "8px",color: "#faad14" }} /> <span style={{marginRight: "5px",color:'red'}}> Hạn đăng ký  </span> :  {dateFormatting(data.LimitRegister)}</p>
    </section>
  );
}

export default MatchDetails;