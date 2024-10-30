import React from "react";
import styles from './AccountSports.module.css';
import ProfileCard from './ProfileCard';
import HeaderLogin from "../../components/Header/HearderLogin";
import Footer from "../../components/Footer/Footer";
import { useNavigate } from 'react-router-dom';
function AddSportAcc() {
    const navigate = useNavigate();
    return (
        
        <div>
            <HeaderLogin />
            <main className={styles.accountPage}>
                <div className={styles.contentWrapper}>

                    <aside className={styles.sidebar}>
                        <ProfileCard />
                    </aside>
                    <section className={styles.mainContent}>
                        <div className={styles.accountSection}>
                            <header className={styles.sectionHeader}>
                                <h1 className={styles.heading}>Chọn môn thể thao</h1>
                                <h2 className={styles.subheading}>Thể thao của bạn:</h2>
                                <div className={styles.cardGrid} >
                                <article className={styles.card}>
                                    <h2 className={styles.cardTitle}>Đá Bóng</h2>
                                </article>
                                </div>
                            </header>
                            

                        </div>
                    </section>
                </div>
            </main>
            <Footer />
        </div>
    );
}

export default AddSportAcc;
// import React from 'react';
// import styles from './SportSelection.module.css';
// import TextareaField from './TextareaField';
// import FooterColumn from './FooterColumn';

// const sportOptions = ['Cầu lông', 'Bóng rổ', 'Bóng chuyền'];
// const skillLevels = ['Mới biết chơi', 'Trung bình - Khá', 'Chuyên nghiệp'];
// const footerColumns = [
//   {
//     title: 'Use cases',
//     items: ['UI design', 'UX design', 'Wireframing', 'Diagramming', 'Brainstorming', 'Online whiteboard', 'Team collaboration']
//   },
//   {
//     title: 'Explore',
//     items: ['Design', 'Prototyping', 'Development features', 'Design systems', 'Collaboration features', 'Design process', 'FigJam']
//   },
//   {
//     title: 'Resources',
//     items: ['Blog', 'Best practices', 'Colors', 'Color wheel', 'Support', 'Developers', 'Resource library']
//   }
// ];

// function SportSelection() {
//   return (
//     <div className={styles.container}>
//       <h1 className={styles.heading}>Thể thao của bạn:</h1>
//       <TextareaField value="Đá bóng" />
//       <h2 className={styles.subHeading}>Các môn thể thao khác:</h2>
      
//       <aside className={styles.userProfile}>
//         <img src="https://cdn.builder.io/api/v1/image/assets/TEMP/6bc8d1ef7ef6beb9a8f62d9a9760725d3ae3ce0003da0601a02b4778efb767c8?placeholderIfAbsent=true&apiKey=64a11f7ccf9c4f09a01cd9aadc1c5dac" alt="User profile" className={styles.profileImage} />
//         <div className={styles.userInfo}>
//           <div className={styles.divider} />
//           <div className={styles.userName}>Tên: Hung</div>
//         </div>
//         <button className={styles.logoutButton}>
//           <span className={styles.logoutText}>Đăng xuất</span>
//         </button>
//       </aside>
      
//       <main className={styles.mainContent}>
//         <section className={styles.sportSelectionCard}>
//           <h2 className={styles.cardTitle}>Chọn môn thể thao</h2>
//         </section>
        
//         {sportOptions.map((sport, index) => (
//           <TextareaField key={index} value={sport} />
//         ))}
        
//         <h3 className={styles.skillLevelHeading}>Kỹ năng của bạn ở mức nào?</h3>
        
//         {skillLevels.map((level, index) => (
//           <TextareaField key={index} value={level} />
//         ))}
        
//         <button className={styles.saveButton}>
//           <span className={styles.saveButtonText}>Lưu</span>
//         </button>
//       </main>
      
//       <footer className={styles.footer}>
//         <div className={styles.footerColumn} />
//         {footerColumns.map((column, index) => (
//           <FooterColumn key={index} title={column.title} items={column.items} />
//         ))}
//       </footer>
//     </div>
//   );
// }

// export default SportSelection;